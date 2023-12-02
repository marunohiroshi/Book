import 'package:book/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookDetailView extends ConsumerWidget {
  BookDetailView(this.book, {Key? key}) : super(key: key) {}

  final book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(bookDetailViewModelProvider(book).notifier);
    final state = ref.read(bookDetailViewModelProvider(book));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        title: Text(state.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(90, 30),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                book.thumbnail,
                height: 450,
                width: 300,
                fit: BoxFit.fill,
              ),
            ),
            const Text('タイトル'),
            Text(book.title),
            const Text('著者'),
            Text(book.authors),
            const Text('価格'),
            Text('${book.price}円'),
            const Text('ページ数'),
            Text('${book.totalPage}ページ'),
            const Text('出版社'),
            Text(book.publisher),
            const Text('出版日'),
            Text(book.publishedDate),
            const Text('メモ'),
            TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: '感想、心に残った言葉など',
                  labelText: 'メモ'),
              onChanged: (value) {},
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: OutlinedButton(
                        child: const Text('削除'),
                        onPressed: () {
                          print('delete');
                          ref
                              .read(bookShelfViewModelProvider.notifier)
                              .delete(state.id);
                          Navigator.pop(context, true);
                          Fluttertoast.showToast(
                              msg: '「${viewModel.book.title}」を削除しました。',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: OutlinedButton(
                        child: Text('更新'),
                        onPressed: () {
                          print('update');
                          viewModel.update(book);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
