import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/drift/app_db_drift_impl.dart';
import 'package:book/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    InkResponse(
                                      child: Image.network(
                                        snapshot.data?[index].thumbnail ?? '',
                                        height: 150,
                                        width: 100,
                                        fit: BoxFit.fill,
                                      ),
                                      onTap: () {
                                        print('index: $index');
                                        final book = snapshot.data?[index];
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           BookDetailView(book)),
                                        // );
                                      },
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          snapshot.data?[index].title ?? '',
                                          style: const TextStyle(fontSize: 15),
                                          maxLines: 1,
                                        ),
                                        Text(snapshot.data?[index].authors ??
                                            ''),
                                        Text(snapshot
                                                .data?[index].publishedDate ??
                                            ''),
                                        Text(snapshot.data?[index].publisher ??
                                            ''),
                                      ],
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
