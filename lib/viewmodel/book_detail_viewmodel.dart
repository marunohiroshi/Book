import 'package:book/drift/app_db_drift_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    @Default('') String memo,
    @Default(3) double rating,
  }) = _BookDetailState;
}

class BookDetailViewModel extends StateNotifier<BookDetailState> {
  BookDetailViewModel(this._appDb, this.book) : super(const BookDetailState()) {
    fetch(book);
  }

  late final AppDbDriftImpl _appDb;
  late final Book book;

  void fetch(Book book) {
    state = state.copyWith(
        id: book.id,
        title: book.title,
        price: book.price,
        totalPage: book.totalPage,
        thumbnail: book.thumbnail,
        description: book.description,
        publisher: book.publisher,
        publishedDate: book.publishedDate,
        authors: book.authors,
        memo: book.memo,
        rating: book.rating);
  }

  Future<void> updateMemo(Book book, String memo) async {
    state = state.copyWith(memo: memo);
    _appDb.updateMemo(book, memo);
  }

  Future<void> updateRating(Book book, double rating) async {
    state = state.copyWith(rating: rating);
    _appDb.updateRating(book, rating);
  }
}
