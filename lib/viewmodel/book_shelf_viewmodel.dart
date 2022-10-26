import 'dart:async';

import 'package:book/drift/app_db_drift_impl.dart';
import 'package:book/drift/app_db_drift_impl.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_shelf_viewmodel.freezed.dart';

@freezed
class BookShelfState with _$BookShelfState {
  const factory BookShelfState({
    @Default(<model.Book>[]) List<model.Book> bookList,
    @Default(3) int crossAxisCount,
    @Default(true) bool hasRead,
    @Default(false) bool searchMode,
  }) = _BookShelfState;
}

class BookShelfViewModel extends StateNotifier<BookShelfState> {
  BookShelfViewModel(this._appDb) : super(const BookShelfState()) {
    fetch();
  }
  late final AppDbDriftImpl _appDb;

  Future<void> fetch() async {
    final bookList = await _appDb.getHasReadBookList;
    state = state.copyWith(
      bookList: bookList,
    );
  }

  Future<List<model.Book>> getBookList(bool hasRead) async {
    if (hasRead) {
      print('has read');
      return await _appDb.getHasReadBookList;
    } else {
      print('has not read');
      return await _appDb.getHasNotReadBookList;
    }
  }

  void changeCrossAxisCount(int crossAxisCount) {
    if (crossAxisCount > 0) {
      state = state.copyWith(crossAxisCount: crossAxisCount);
    }
    print(crossAxisCount);
  }

  //TODO: Stream
  void add(model.Book book) async {
    await _appDb.add(book);
    final bookList = await _appDb.getAllBookList;
    state = state.copyWith(bookList: bookList);
  }

  //TODO: Stream
  void delete(int id) async {
    await _appDb.deleteBook(id);
    final bookList = await _appDb.getAllBookList;
    state = state.copyWith(bookList: bookList);
  }

  void switchDisplay(int index) {
    switch (index) {
      case 0:
        state = state.copyWith(hasRead: true);
        return;
      case 1:
        state = state.copyWith(hasRead: false);
        return;
    }
  }

  void switchSearchMode(bool searchMode) {
    state = state.copyWith(searchMode: searchMode);
  }
}
