import 'dart:async';
import 'dart:convert' as convert;

import 'package:book/drift/app_db_drift_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'scan_book_viewmodel.freezed.dart';

@freezed
class ScanBookState with _$ScanBookState {
  const factory ScanBookState({
    @Default(false) bool scanned,
    @Default("") String barcodeNumber,
  }) = _ScanBookState;
}

class ScanBookViewModel extends StateNotifier<ScanBookState> {
  ScanBookViewModel(this._appDb) : super(const ScanBookState());

  late final AppDbDriftImpl _appDb;

  /// GoogleApi取得
  Future<Map<String, dynamic>> getGoogleBookJsonResponse(String isbn) async {
    Map<String, String> responseError = {
      'key': 'error',
    };

    Uri url = Uri.https(
        'www.googleapis.com', '/books/v1/volumes', {'q': 'isbn:$isbn'});
    print('url: $url');

    // 謎の「ISBNコード/日本図書コード/書籍JANコード利用の手引き」が検出されるのを防ぐ
    if (url.toString() ==
            'https://www.googleapis.com/books/v1/volumes?q=isbn%3A' ||
        url.toString() ==
            'https://www.googleapis.com/books/v1/volumes/9gpcewAACAAJ') {
      return responseError;
    }
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('api request success');
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      String bookInfoUrl = jsonResponse['items'][0]['selfLink'];
      final url = Uri.parse(bookInfoUrl);
      final bookResponse = await http.get(url);
      print('book url: $url');
      var bookJsonResponse =
          convert.jsonDecode(bookResponse.body) as Map<String, dynamic>;
      return bookJsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return responseError;
    }
  }

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

  Future<Book> getBookInfoFromJson(String res) async {
    final googleResponse = await getGoogleBookJsonResponse(res);
    final openDbResponse = await getOpendbBookJsonResponse(res);
    final title = googleResponse['volumeInfo']['title'];
    int totalPage;
    try {
      totalPage = googleResponse['volumeInfo']['pageCount'];
    } catch (e) {
      totalPage = 0;
    }
    String authors;
    try {
      authors = googleResponse['volumeInfo']['authors'][0];
    } catch (e) {
      authors = '';
    }

    String description;
    try {
      description = googleResponse['volumeInfo']['description'];
    } catch (e) {
      description = "0";
    }
    int price;
    try {
      price = int.parse(openDbResponse[0]['onix']['ProductSupply']
          ['SupplyDetail']['Price'][0]['PriceAmount']);
    } catch (e) {
      price = 0;
    }
    final publishedDate = googleResponse['volumeInfo']['publishedDate'];
    final publisher = googleResponse['volumeInfo']['publisher'];

    String thumbnail = '';
    try {
      thumbnail = googleResponse['volumeInfo']['imageLinks']['thumbnail'];
    } catch (e) {
      if (thumbnail == '') {
        try {
          thumbnail = openDbResponse[0]['summary']['cover'];
        } catch (e) {
          thumbnail =
              'https://www.shoshinsha-design.com/wp-content/uploads/2020/05/noimage-760x460.png';
        }
      }
    }

    final bookList = await _appDb.getAllBookList;
    int id;
    id = bookList.isEmpty ? 0 : bookList.last.id + 1;
    const hasRead = true;
    const memo = '';
    const selectedGenre = '';
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
        memo: memo,
        rating: 0,
        selectedGenre: selectedGenre);

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

  Future<bool> checkNewBook(String title) async {
    final bookList = await _appDb.getHasReadBookList;
    for (var book in bookList) {
      if (book.title == title) {
        return false;
      }
    }
    return true;
  }

  void updateBarcodeNumber(String number) {
    state = state.copyWith(barcodeNumber: number);
  }
}
