import 'package:book/drift/app_db_drift_impl.dart';
import 'package:book/providers.dart';
import 'package:book/viewmodel/main_viewmodel.dart';
import 'package:book/viewmodel/scan_book_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScanBook extends ConsumerWidget {
  const ScanBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(scanBookViewModelProvider.notifier);
    final mainViewModel = ref.read(mainViewModelProvider.notifier);
    ref.listen(scanBookViewModelProvider, (_, ScanBookState next) {});
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: OutlinedButton(
                onPressed: () async {
                  String res = await viewModel.checkValidBarcode();
                  final book = await viewModel.getBookInfoFromJson(res);
                  final isNewBook = await viewModel.checkNewBook(book.title);
                  showDialog<void>(
                      context: context,
                      builder: (_) {
                        return showBookInfoDialog(
                            book, mainViewModel, ref, isNewBook);
                      });
                },
                child: const Text(
                  'バーコード読み取り',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showBookInfoDialog(
      Book book, MainViewModel mainViewModel, WidgetRef ref, bool isNewBook) {
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
