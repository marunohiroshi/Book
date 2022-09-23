import 'dart:async';

import 'package:book/drift/app_db_drift_impl.dart';
import 'package:book/model/book.dart' as model;
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_shelf_viewmodel.freezed.dart';

@freezed
class BookShelfState with _$BookShelfState {
  const factory BookShelfState({
    @Default(3) int crossAxisCount,
  }) = _BookShelfState;
}

class BookShelfViewModel extends StateNotifier<BookShelfState>
    with WidgetsBindingObserver {
  BookShelfViewModel(this._appDb) : super(const BookShelfState()) {
    fetch();
  }

  late final AppDbDriftImpl _appDb;
  late List<model.Book> bookList;

  Future<void> fetch() async {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<List<model.Book>> getBookList() async {
    bookList = await _appDb.getBookList;
    return bookList;
  }

  String getThumbnail(int index) {
    String? thumbnail;
    if (thumbnail != '') {
      thumbnail = bookList[index].thumbnail;
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
}
