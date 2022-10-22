import 'package:book/drift/app_db_drift_impl.dart' as model;
import 'package:books_finder/books_finder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_search_viewmodel.freezed.dart';

@freezed
class BookSearchState with _$BookSearchState {
  const factory BookSearchState({
    @Default(<model.Book>[]) List<model.Book> bookList,
  }) = _BookSearch;
}

class BookSearchViewModel extends StateNotifier<BookSearchState> {
  BookSearchViewModel() : super(const BookSearchState()) {}

  Future<List<model.Book>> getSearchBookList(String word) async {
    final books = await queryBooks(
      word,
      maxResults: 30,
      printType: PrintType.all,
      orderBy: OrderBy.relevance,
      reschemeImageLinks: true,
    );
    List<model.Book> bookList = [];
    for (final book in books) {
      final info = book.info;
      final bookData = model.Book(
          id: 0,
          price: 0,
          title: info.title,
          totalPage: info.pageCount.toString(),
          thumbnail: info.imageLinks['thumbnail']?.toString() ??
              'https://www.shoshinsha-design.com/wp-content/uploads/2020/05/noimage-760x460.png',
          description: info.description,
          publisher: info.publisher,
          publishedDate: info.rawPublishedDate,
          authors: info.authors.isNotEmpty ? info.authors.first : '',
          hasRead: false,
          memo: '');
      bookList.add(bookData);
    }
    print('${bookList.toString()}¥n');
    return bookList;
  }
}
