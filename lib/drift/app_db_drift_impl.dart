import 'dart:io';

import 'package:book/drift/books_dao.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_db_drift_impl.g.dart';

@DriftDatabase(
  tables: [Books],
  daos: [BooksDao],
)
class AppDbDriftImpl extends _$AppDbDriftImpl {
  AppDbDriftImpl() : super(_openConnection());

  Future<List<Book>> get getAllBookList => booksDao.getAllBookList;

  Future<List<Book>> get getHasReadBookList => booksDao.getHasReadBookList;

  Future<List<Book>> get getHasNotReadBookList =>
      booksDao.getHasNotReadBookList;

  Future add(Book book) {
    return booksDao.add(book);
  }

  Future updateMemo(Book book, String memo) {
    return booksDao.updateMemo(book, memo);
  }

  Future updateRating(Book book, double rating) {
    return booksDao.updateRating(book, rating);
  }

  // Future updateGenreIndex(Book book, int index) {
  //   return booksDao.insertSet(book, index);
  // }

  Future getBook(int id) {
    return booksDao.getBook(id);
  }

  Future deleteBook(int id) {
    return booksDao.deleteBook(id);
  }

  Future getLastId() {
    return booksDao.getLastId();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    print('sqlite: $file');
    return NativeDatabase(file);
  });
}
