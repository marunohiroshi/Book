import 'dart:convert' as convert;

import 'package:book/drift/app_db_drift_impl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'scan_book_viewmodel.freezed.dart';

@freezed
class ScanBookState with _$ScanBookState {
  const factory ScanBookState({
    @Default(false) bool scanned,
    @Default(false) bool closeDialog,
  }) = _ScanBookState;
}

class ScanBookViewModel extends StateNotifier<ScanBookState> {
  ScanBookViewModel(this._appDb) : super(const ScanBookState());

  late final AppDbDriftImpl _appDb;
  String barcodeScanRes = '';

  /// シングルスキャン
  Future<String> scanBarcode() async {
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    return barcodeScanRes;
  }

  /// 連続スキャン
  Future<String> scanBarcodeContinue() async {
    String res = '';
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) {
      print(barcode);
      res = barcode;
    });
    return res;
  }

  /// GoogleApi取得
  Future<Map<String, dynamic>> getGoogleBookJsonResponse(String isbn) async {
    Uri url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': isbn});
    print('url: $url');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('api request success');
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      final responseError = "" as Map<String, dynamic>;
      return responseError;
    }
  }

  // book.title = googleResponse['items'][0]['volumeInfo']['title'];
  // book.authors = googleResponse['items'][0]['volumeInfo']['authors'];
  // book.smallThumbnail = googleResponse['items'][0]['volumeInfo']
  //     ['imageLinks']['smallThumbnail'];
  // book.thumbnail = googleResponse['items'][0]['volumeInfo']
  //     ['imageLinks']['thumbnail'];
  // book.publisher =
  //     googleResponse['items'][0]['volumeInfo']['publisher'];
  // book.publishedDate =
  //     googleResponse['items'][0]['volumeInfo']['publishedDate'];
  //   book.price =
  //       googleResponse['items'][0]['saleInfo']['listPrice']['amount'];

  /// OpenDbApi取得
  Future<List<dynamic>> getOpendbBookJsonResponse(String isbn) async {
    Uri url = Uri.https('api.openbd.jp', '/v1/get', {'isbn': isbn});
    print('url: $url');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('api request success');
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      final responseError = "" as List<dynamic>;
      return responseError;
    }
  }

  /// 有効なバーコードかどうか確認
  Future<String> checkValidBarcode() async {
    var res = '192';
    while (res.startsWith('192')) {
      res = await scanBarcode();
      if (res.startsWith('192')) {
        Fluttertoast.showToast(
            msg: "もう一方のバーコードをスキャンしてください",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    return res;
  }

  Future<Book> getBookInfoFromJson(String res) async {
    final googleResponse = await getGoogleBookJsonResponse(res);
    final openDbResponse = await getOpendbBookJsonResponse(barcodeScanRes);
    final title = openDbResponse[0]['summary']['title'];
    final totalPage = openDbResponse[0]['onix']['DescriptiveDetail']['Extent']
        [0]['ExtentValue'];
    final description =
        openDbResponse[0]['onix']['CollateralDetail']['TextContent'][0]['Text'];
    final authors = openDbResponse[0]['summary']['author'];
    int price;
    try {
      price = int.parse(openDbResponse[0]['onix']['ProductSupply']
          ['SupplyDetail']['Price'][0]['PriceAmount']);
    } catch (e) {
      price = 0;
    }
    final publishedDate = (openDbResponse[0]['summary']['pubdate']);
    final publisher = openDbResponse[0]['summary']['publisher'];

    String thumbnail;
    thumbnail = openDbResponse[0]['summary']['cover'];
    if (thumbnail == '') {
      thumbnail =
          googleResponse['items'][0]['volumeInfo']['imageLinks']['thumbnail'];
    }

    final bookList = await _appDb.getAllBookList;
    final id = bookList.isEmpty ? 0 : bookList.last.id + 1;
    const hasRead = true;
    const memo = '';
    final book = Book(
        title: title,
        price: price,
        totalPage: totalPage,
        thumbnail: thumbnail,
        description: description,
        publisher: publisher,
        publishedDate: publishedDate,
        authors: authors,
        id: id,
        hasRead: hasRead,
        memo: memo);

    print('id: ${book.id}');
    print('title: ${book.title}');
    print('authors: ${book.authors}');
    print('price: ${book.price}');
    print('totalPage: ${book.totalPage}');
    print('description: ${book.description}');
    print('publisher: ${book.publisher}');
    print('publishedDate: ${book.publishedDate}');
    print('thumbnail: ${book.thumbnail}');

    return book;
  }

  checkNewBook() {}
}
