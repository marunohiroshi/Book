import 'package:book/model/book.dart' as model;
import 'package:book/providers.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScanBook extends ConsumerWidget {
  const ScanBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(scanBookViewModelProvider.notifier);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Expanded(child:
            NeumorphicButton(
                onPressed: () async {
                  String res = await viewModel.checkValidBarcode();
                  final book = await viewModel.getBookInfoFromJson(res);
                  showDialog<void>(
                      context: context,
                      builder: (_) {
                        return showBookInfoDialog(book, context, ref);
                      });
                },
                style: const NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                ),
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  'バーコード読み取り',
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }

  Widget showBookInfoDialog(
      model.Book book, BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(book.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(book.authors),
            Text('${book.totalPage}ページ'),
            Text('${book.price}円'),
            // Image.network(book.smallThumbnail),
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
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          children: [
            NeumorphicButton(
              child: const Text('閉じる'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const Spacer(),
            NeumorphicButton(
              child: const Text('本棚に追加する'),
              onPressed: () {
                ref.read(scanBookViewModelProvider.notifier).save(book);
                Fluttertoast.showToast(
                    msg: "本棚に追加しました",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blueAccent,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.of(context).pop();
              },
            ),
          ],
        )
      ],
    );
  }
}
