import 'package:book/Utility/utility.dart';
import 'package:book/drift/app_db_drift_impl.dart';
import 'package:drift/drift.dart';

part 'books_dao.g.dart';

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get price => integer()();
  TextColumn get totalPage => text()();
  TextColumn get thumbnail => text()();
  TextColumn get description => text()();
  TextColumn get publisher => text()();
  TextColumn get publishedDate => text()();
  TextColumn get authors => text()();
  BoolColumn get isRead => boolean()();
  TextColumn get memo => text()();
}

@DriftAccessor(tables: [Books])
class BooksDao extends DatabaseAccessor<AppDbDriftImpl> with _$BooksDaoMixin {
  BooksDao(AppDbDriftImpl db) : super(db);

  Future<List<Book>> get getList async {
    final bookList = await select(books).get();
    return bookList
        .map((book) => Book(
            id: book.id,
            title: book.title,
            price: book.price,
            totalPage: book.totalPage,
            thumbnail: book.thumbnail,
            description: book.description,
            publisher: book.publisher,
            publishedDate: book.publishedDate,
            authors: book.authors,
            isRead: book.isRead,
            memo: book.memo))
        .toList();
  }

  Future<void> add(Book book) async {
    final bookList = await getList;
    final id = bookList.isEmpty ? 0 : bookList.last.id + 1;
    into(books).insertOnConflictUpdate(Book(
        id: id,
        title: book.title,
        price: book.price,
        totalPage: book.totalPage,
        thumbnail: book.thumbnail,
        description: book.description,
        publisher: book.publisher,
        publishedDate: book.publishedDate,
        authors: book.authors,
        isRead: book.isRead,
        memo: book.memo));
    Utility.updateDb.broadcast();
  }

  Future<Book> getBook(int id) async {
    final bookList = await getList;
    var book;
    for (var element in bookList) {
      if (element.id == id) {
        book = element;
      }
    }
    return book;
  }

  Future<void> deleteBook(int id) async {
    (delete(books)..where((tbl) => tbl.id.equals(id))).go();
    print('maruno delete book');
    Utility.updateDb.broadcast();
  }
}
