import 'package:book/drift/app_db_drift_impl.dart';
import 'package:book/providers.dart';
import 'package:book/viewmodel/main_viewmodel.dart';
import 'package:book/viewmodel/scan_book_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanBook extends ConsumerWidget {
  const ScanBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MobileScannerController cameraController = MobileScannerController();
    final viewModel = ref.refresh(scanBookViewModelProvider.notifier);
    final mainViewModel = ref.watch(mainViewModelProvider.notifier);
    ref.listen(scanBookViewModelProvider, (_, ScanBookState next) async {
      final book = await viewModel.getBookInfoFromJson(next.barcodeNumber);
      final isNewBook = await viewModel.checkNewBook(book.title);
      showDialog<void>(
          context: context,
          builder: (_) {
            return showBookInfoDialog(
                book, mainViewModel, ref, isNewBook, viewModel);
          });
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner')),
      body: MobileScanner(
        fit: BoxFit.contain,
        controller: MobileScannerController(
          // facing: CameraFacing.back,
          // torchEnabled: false,
          returnImage: true,
        ),
        onDetect: (capture) async {
          final List<Barcode> barcodes = capture.barcodes;
          String res = "";
          for (final barcode in barcodes) {
            debugPrint('Barcode found! ${barcode.rawValue}');
            res = barcode.rawValue.toString();
            if (res.startsWith("978")) {
              if (res != viewModel.state.barcodeNumber) {
                viewModel.updateBarcodeNumber(res);
              }
            }
          }
        },
      ),
    );
  }

  Widget showBookInfoDialog(Book book, MainViewModel mainViewModel,
      WidgetRef ref, bool isNewBook, ScanBookViewModel viewModel) {
    return AlertDialog(
      title: Text(book.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            getAlertText(isNewBook),
            Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                  width: 3,
                ),
              ),
              child: Image.network(
                book.thumbnail,
                fit: BoxFit.fill,
              ),
            ),
            Text(book.authors),
            Text('${book.totalPage}ページ'),
            Text('${book.price}円'),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          children: [
            OutlinedButton(
              child: const Text('閉じる'),
              onPressed: () {
                mainViewModel.closeDialog();

                // 同じ本でも再度登録できるよう初期化しておく
                viewModel.updateBarcodeNumber('');
              },
            ),
            const Spacer(),
            OutlinedButton(
              child: const Text('本棚に追加する'),
              onPressed: () {
                ref.read(bookShelfViewModelProvider.notifier).add(book);
                Fluttertoast.showToast(
                    msg: "本棚に追加しました",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blueAccent,
                    textColor: Colors.white,
                    fontSize: 16.0);
                mainViewModel.closeDialog();
              },
            ),
          ],
        )
      ],
    );
  }

  Widget getAlertText(bool isNewBook) {
    if (!isNewBook) {
      return const Text(
        '※この本は既に登録されています',
        style: TextStyle(color: Colors.red),
      );
    }
    return const Spacer();
  }
}
