import 'package:book/model/book.dart' as model;
import 'package:book/providers.dart';
import 'package:book/viewmodel/book_shelf_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BookShelf extends ConsumerWidget {
  final ScrollController _scrollController = ScrollController();

  BookShelf({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(bookShelfViewModelProvider.notifier);
    final state = ref.watch(bookShelfViewModelProvider);
    _scrollController.addListener(() {});
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    int crossAxisCount = state.crossAxisCount;
    ref.listen(bookShelfViewModelProvider, (_, BookShelfState next) {
      crossAxisCount = next.crossAxisCount;
      if (next.updateDb) {}
    });

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'grid_on',
            onPressed: () {
              viewModel.changeCrossAxisCount(crossAxisCount + 1);
            },
            child: Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: 'grid_off',
            onPressed: () {
              viewModel.changeCrossAxisCount(crossAxisCount - 1);
            },
            child: Icon(
              Icons.grid_off,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: GridView.count(
        childAspectRatio: (itemWidth / itemHeight),
        // 1行あたりに表示するWidgetの数
        crossAxisCount: 1,
        // padding: const EdgeInsets.all(8),
        children: [
          FutureBuilder(
            future: viewModel.getBookList(),
            builder: (BuildContext context,
                AsyncSnapshot<List<model.Book>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: (itemWidth / itemHeight),
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: const EdgeInsets.all(8),
                          child: GridTile(
                            // header: GridTileBar(
                            //   backgroundColor: Colors.white,
                            //   title: Text('title'),
                            //   subtitle: Text('subtitle'),
                            //   trailing: IconButton(
                            //     onPressed: () {},
                            //     icon: const Icon(
                            //       Icons.more_vert_rounded,
                            //       color: Colors.black54,
                            //     ),
                            //   ),
                            // ),
                            child: InkResponse(
                              child: Image.network(
                                viewModel.getThumbnail(index),
                                height: itemHeight,
                                width: itemWidth,
                                fit: BoxFit.fill,
                              ),
                              onTap: () {
                                print('index: $index');
                                final book = viewModel.getBook(index);
                                context.goNamed('book_detail_view',
                                    extra: book);
                              },
                            ),
                            // footer: GridTileBar(
                            //   backgroundColor: Colors.white,
                            //   title: Row(
                            //     children: [
                            //       Icon(
                            //         Icons.favorite_outline,
                            //         color: Colors.grey,
                            //       ),
                            //       Text(
                            //         '20',
                            //         style: TextStyle(color: Colors.black),
                            //       ),
                            //       SizedBox(
                            //         width: 20,
                            //       ),
                            //       Icon(
                            //         Icons.chat_bubble_outline,
                            //         color: Colors.grey,
                            //       ),
                            //       Text(
                            //         '5',
                            //         style: TextStyle(color: Colors.black),
                            //       )
                            //     ],
                            //   ),
                            //   trailing: const Icon(
                            //     Icons.bookmark_add_outlined,
                            //     color: Colors.black,
                            //   ),
                            // ),
                          ),
                        );
                      });
                }
                return const Text('error');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
