import 'package:book/providers.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../drift/app_db_drift_impl.dart';

class BookDetailView extends ConsumerWidget {
  BookDetailView(this.book, {Key? key}) : super(key: key) {}

  final Book book;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Image.network(
                book.thumbnail,
                height: 450,
                width: 300,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: RatingBar.builder(
                initialRating: book.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) async {
                  await viewModel.updateRating(book, rating);
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            _bookItem(
              '著者',
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  book.authors,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            _bookItem(
              '価格',
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '${book.price}円',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            _bookItem(
              'ページ数',
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '${book.totalPage}ページ',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            _bookItem(
              '出版日',
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  book.publishedDate,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            _bookItem(
              '出版社',
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  book.publisher,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            _bookItem(
              '詳細',
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: _shrinkText(book.description),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: TextFormField(
                initialValue: state.memo,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: '感想、心に残った言葉など',
                    labelStyle: TextStyle(fontSize: 24),
                    labelText: 'メモ'),
                onChanged: (value) async {
                  await viewModel.updateMemo(book, value);
                },
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 24, bottom: 16),
                      child: OutlinedButton(
                        child: const Text(
                          '削除',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _shrinkText(String description) {
  return ExpandableText(
    description,
    expandText: 'show more',
    maxLines: 2,
    linkColor: Colors.blue,
    animation: true,
    collapseOnTextTap: true,
    prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
    hashtagStyle: const TextStyle(
      color: Color(0xFF30B6F9),
    ),
    mentionStyle: const TextStyle(
      fontWeight: FontWeight.w600,
    ),
    urlStyle: const TextStyle(
      decoration: TextDecoration.underline,
    ),
  );
}

Widget _bookItem(String title, Widget item) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        item
      ],
    ),
  );
}
