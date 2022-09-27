import 'dart:async';

import 'package:book/drift/app_db_drift_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_shelf_viewmodel.freezed.dart';

@freezed
class BookShelfState with _$BookShelfState {
  const factory BookShelfState(
      {@Default(<Book>[]) List<Book> bookList,
      @Default(3) int crossAxisCount,
      @Default(false) bool updateDb}) = _BookShelfState;
}

class BookShelfViewModel extends StateNotifier<BookShelfState> {
  BookShelfViewModel(this._appDb) : super(const BookShelfState()) {
    fetch();
  }
  late final AppDbDriftImpl _appDb;

  Future<void> fetch() async {
    final bookList = await _appDb.getBookList;
    state = state.copyWith(
      bookList: bookList,
    );
  }

  Future<List<Book>> getBookList() async {
    return await _appDb.getBookList;
  }

  String getThumbnail(int index) {
    print(index);
    String? thumbnail;
    if (thumbnail != '') {
      thumbnail = state.bookList[index].thumbnail;
    } else {
      thumbnail =
          'https://www.shoshinsha-design.com/wp-content/uploads/2020/05/noimage-760x460.png';
    }
    return thumbnail;
  }

  void changeCrossAxisCount(int crossAxisCount) {
    if (crossAxisCount > 0) {
      state = state.copyWith(crossAxisCount: crossAxisCount);
    }
    print(crossAxisCount);
  }

  void add(Book book) async {
    await _appDb.add(book);
    final bookList = await _appDb.getBookList;
    state = state.copyWith(bookList: bookList);
  }

  void delete(int id) async {
    await _appDb.deleteBook(id);
    final bookList = await _appDb.getBookList;
    state = state.copyWith(bookList: bookList);
  }
}
