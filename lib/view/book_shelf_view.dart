import 'package:book/drift/app_db_drift_impl.dart';
import 'package:book/providers.dart';
import 'package:book/view/book_detail_view.dart';
import 'package:book/viewmodel/book_shelf_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
    int index = state.hasRead ? 0 : 1;
    var bookList = state.bookList;
    ref.listen(bookShelfViewModelProvider, (_, BookShelfState next) {
      crossAxisCount = next.crossAxisCount;
      bookList = next.bookList;
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        title: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Scrollbar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ToggleSwitch(
                  customWidths: const [100.0, 100.0],
                  cornerRadius: 20.0,
                  initialLabelIndex: index,
                  activeBgColors: const [
                    [Colors.blue],
                    [Colors.green]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  labels: const ['本棚', '読みたい'],
                  onToggle: (index) {
                    print('switched to: $index');
                    if (index != null) {
                      viewModel.switchDisplay(index);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        // Text(
        //   '本棚',
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
        elevation: 0,
        flexibleSpace: Image.network(
          // 'https://381d3c8c-a-62cb3a1a-s-sites.googlegroups.com/site/closetvx/picture/09/Title03d.png?attachauth=ANoY7cr302fq6Vo4zsRUxzNaNaUEfqCM67TIUI-CrXUBk-xLUddCCaD85ioEwIWRyhSquocObuGdMv-7-Wg12kR0RSmQxmVr-b-xFVPb25-QgLOzXoIOc6lStLtPuXb3eIa72u9aj3tLuyOOhL_CPYFcm9OmEkuU18ppOTS_cZBVFkpKvusHtFZi8LvNCG1K0nSoJzgPwA35htWOjrliym9Qecyt6zbglE77OstZ0WqxNFWO2j0tULI%3D&attredirects=0',
          'https://i.pinimg.com/736x/61/87/7e/61877eda9ecd479350b1205a4d35edae--old-books-book-shelves.jpg',
          fit: BoxFit.cover,
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'grid_on',
            onPressed: () {
              viewModel.changeCrossAxisCount(crossAxisCount + 1);
            },
            child: const Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: 'grid_off',
            onPressed: () {
              viewModel.changeCrossAxisCount(crossAxisCount - 1);
            },
            child: const Icon(
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
            future: viewModel.getBookList(state.hasRead),
            builder:
                (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: (itemWidth / itemHeight),
                      ),
                      itemCount: bookList.length,
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
                                final book = bookList[index];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BookDetailView(book)),
                                );
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
                return const Center(
                  child: Text('本を登録しよう！'),
                );
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
