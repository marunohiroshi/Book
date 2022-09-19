import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs
@freezed
class Book with _$Book {
  const Book._();
  const factory Book({
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
  }) = _Book;
}
