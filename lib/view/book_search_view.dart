import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/drift/app_db_drift_impl.dart';
import 'package:book/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookSearch extends ConsumerWidget {
  const BookSearch(this.searchWord, {super.key});

  final searchWord;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(bookSearchViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        title: Text('「$searchWord」の検索結果',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(90, 30),
          ),
        ),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: viewModel.getSearchBookList(searchWord),
        builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return AnimationLimiter(
                child: ListView.builder(
                  itemCount: 40,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Flexible(
                              child: Card(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        InkResponse(
                                          child: Image.network(
                                            snapshot.data?[index].thumbnail ??
                                                '',
                                            height: 150,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                          onTap: () {},
                                        ),
                                        Flexible(
                                          child: Card(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: SizedBox(
                                                    child: AutoSizeText(
                                                      snapshot.data?[index]
                                                              .title ??
                                                          '',
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: SizedBox(
                                                    child: AutoSizeText(
                                                      snapshot.data?[index]
                                                              .authors ??
                                                          '',
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: SizedBox(
                                                    child: AutoSizeText(
                                                      snapshot.data?[index]
                                                              .publishedDate ??
                                                          '',
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: IconButton(
                                                        icon: const Icon(
                                                            Icons.add),
                                                        onPressed: () async {
                                                          print(index);
                                                          final id =
                                                              await viewModel
                                                                  .getLastId();
                                                          final book = Book(
                                                            id: id,
                                                            price: snapshot
                                                                .data![index]
                                                                .price,
                                                            title: snapshot
                                                                .data![index]
                                                                .title,
                                                            totalPage: snapshot
                                                                .data![index]
                                                                .totalPage,
                                                            thumbnail: snapshot
                                                                .data![index]
                                                                .thumbnail,
                                                            description: snapshot
                                                                .data![index]
                                                                .description,
                                                            publisher: snapshot
                                                                .data![index]
                                                                .publisher,
                                                            publishedDate: snapshot
                                                                .data![index]
                                                                .publishedDate,
                                                            authors: snapshot
                                                                .data![index]
                                                                .authors,
                                                            hasRead: snapshot
                                                                .data![index]
                                                                .hasRead,
                                                            memo: snapshot
                                                                .data![index]
                                                                .memo,
                                                            rating: snapshot
                                                                .data![index]
                                                                .rating,
                                                            selectedGenre: snapshot
                                                                .data![index]
                                                                .selectedGenre,
                                                          );
                                                          viewModel
                                                              .addNotHasReadBook(
                                                                  book);
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "読みたいに追加しました",
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .CENTER,
                                                              timeInSecForIosWeb:
                                                                  1,
                                                              backgroundColor:
                                                                  Colors
                                                                      .greenAccent,
                                                              textColor:
                                                                  Colors.white,
                                                              fontSize: 16.0);
                                                        }),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(
              child: Text('検索結果がヒットしませんでした'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
