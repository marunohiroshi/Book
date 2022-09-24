import 'dart:io';

import 'package:book/drift/books_dao.dart';
import 'package:book/model/book.dart' as models;
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

  Future<List<models.Book>> get getBookList => booksDao.getList;

  Future add(models.Book book) {
    return booksDao.add(book);
  }

  Future getBook(int id) {
    return booksDao.getBook(id);
  }

  Future deleteBook(int id) {
    return booksDao.deleteBook(id);
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
