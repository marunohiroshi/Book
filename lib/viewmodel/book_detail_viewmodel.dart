import 'package:book/drift/app_db_drift_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/book.dart' as model;

part 'book_detail_viewmodel.freezed.dart';

@freezed
class BookDetailState with _$BookDetailState {
  const factory BookDetailState({
    @Default(0) int id,
    @Default('') String title,
    @Default(0) int price,
    @Default(0) int totalPage,
    @Default('') String smallThumbnail,
    @Default('') String thumbnail,
    @Default('') String description,
    @Default('') String publisher,
    @Default('') String publishedDate,
    @Default('') String authors,
  }) = _BookDetailState;
}

class BookDetailViewModel extends StateNotifier<BookDetailState> {
  BookDetailViewModel(this._appDb, this.book) : super(const BookDetailState()) {
    fetch(book);
  }

  late final AppDbDriftImpl _appDb;
  late final model.Book book;

  void fetch(model.Book book) {
    state = state.copyWith(
        id: book.id,
        title: book.title,
        price: book.price,
        totalPage: book.totalPage,
        smallThumbnail: book.smallThumbnail,
        thumbnail: book.thumbnail,
        description: book.description,
        publisher: book.publisher,
        publishedDate: book.publishedDate,
        authors: book.authors);
  }

  Future<void> update(model.Book book) async {
    print('book: $book');
    _appDb.add(book);
  }

  Future<void> delete(int id) async {
    print('id: $id');
    _appDb.deleteBook(id);
  }
}
