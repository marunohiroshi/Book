import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/drift/app_db_drift_impl.dart';
import 'package:book/providers.dart';
import 'package:book/view/book_detail_view.dart';
import 'package:book/viewmodel/book_shelf_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'book_search_view.dart';

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
    ref.listen(bookShelfViewModelProvider, (_, BookShelfState next) {
      crossAxisCount = next.crossAxisCount;
    });
    return Scaffold(
      appBar: AppBar(
        leading: !state.listMode
            ? IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  viewModel.switchListMode(true);
                })
            : IconButton(
                icon: const Icon(Icons.grid_view),
                onPressed: () {
                  viewModel.switchListMode(false);
                }),
        title: !state.searchMode
            ? Center(
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
                        onToggle: (index) async {
                          print('switched to: $index');
                          if (index != null) {
                            viewModel.switchDisplay(index);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              )
            : _searchTextField(context),
        centerTitle: true,
        actions: !state.searchMode
            ? [
                IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      viewModel.switchSearchMode(true);
                    })
              ]
            : [
                IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      viewModel.switchSearchMode(false);
                    })
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
                  if (!state.listMode) {
                    return AnimationLimiter(
                      child: GridView.count(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: (itemWidth / itemHeight),
                        children: List.generate(
                          snapshot.data?.length ?? 0,
                          (int index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 800),
                              columnCount: snapshot.data?.length ?? 0,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: Card(
                                    margin: const EdgeInsets.all(8),
                                    child: GridTile(
                                      child: InkResponse(
                                        child: Image.network(
                                          snapshot.data?[index].thumbnail ??
                                              'https://www.shoshinsha-design.com/wp-content/uploads/2020/05/noimage-760x460.png',
                                          height: itemHeight,
                                          width: itemWidth,
                                          fit: BoxFit.fill,
                                        ),
                                        onTap: () {
                                          print('index: $index');
                                          final book = snapshot.data?[index];
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BookDetailView(book!)),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
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
                                    GestureDetector(
                                      onTap: () {
                                        print('index: $index');
                                        final book = snapshot.data?[index];
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BookDetailView(book!)));
                                      },
                                      child: Row(
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
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: SizedBox(
                                                  width: 250,
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
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: SizedBox(
                                                  width: 250,
                                                  child: AutoSizeText(
                                                    snapshot.data?[index]
                                                            .authors ??
                                                        '',
                                                    maxLines: 3,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: SizedBox(
                                                  width: 250,
                                                  child: AutoSizeText(
                                                    snapshot.data?[index]
                                                            .publishedDate ??
                                                        '',
                                                    maxLines: 3,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                    );
                  }
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

  Widget _searchTextField(BuildContext context) {
    return TextField(
      autofocus: true, //TextFieldが表示されるときにフォーカスする（キーボードを表示する）
      cursorColor: Colors.white, //カーソルの色
      style: const TextStyle(
        //テキストのスタイル
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search, //キーボードのアクションボタンを指定
      decoration: const InputDecoration(
        //TextFiledのスタイル
        enabledBorder: UnderlineInputBorder(
            //デフォルトのTextFieldの枠線
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
            //TextFieldにフォーカス時の枠線
            borderSide: BorderSide(color: Colors.white)),
        hintText: '本のタイトル、著者名など', //何も入力してないときに表示されるテキスト
        hintStyle: TextStyle(
          //hintTextのスタイル
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
      onSubmitted: (String searchWord) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookSearch(searchWord)),
        );
      },
    );
  }
}
