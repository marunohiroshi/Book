import 'dart:convert';

import 'package:book/drift/app_db_drift_impl.dart';
import 'package:drift/drift.dart';

part 'books_dao.g.dart';

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get price => integer()();
  IntColumn get totalPage => integer()();
  TextColumn get thumbnail => text()();
  TextColumn get description => text()();
  TextColumn get publisher => text()();
  TextColumn get publishedDate => text()();
  TextColumn get authors => text()();
  BoolColumn get hasRead => boolean()();
  TextColumn get memo => text()();
  RealColumn get rating => real()();
  TextColumn get selectedGenre => text()();
}

@DriftAccessor(tables: [Books])
class BooksDao extends DatabaseAccessor<AppDbDriftImpl> with _$BooksDaoMixin {
  BooksDao(AppDbDriftImpl db) : super(db);

  Future<List<Book>> get getAllBookList async {
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
            hasRead: book.hasRead,
            memo: book.memo,
            rating: book.rating,
            selectedGenre: book.selectedGenre))
        .toList();
  }

  Future<List<Book>> get getHasReadBookList async {
    final bookList = await getAllBookList;
    List<Book> hasReadBookList = [];
    for (var book in bookList) {
      if (book.hasRead == true) {
        hasReadBookList.add(book);
      }
    }
    return hasReadBookList;
  }

  Future<List<Book>> get getHasNotReadBookList async {
    final bookList = await getAllBookList;
    List<Book> hasNotReadBookList = [];
    for (var book in bookList) {
      if (book.hasRead == false) {
        hasNotReadBookList.add(book);
      }
    }
    return hasNotReadBookList;
  }

  Future<void> add(Book book) async {
    final bookList = await getAllBookList;
    final target = await getBook(book.id);
    int id;
    if (target != null) {
      // すでにDBに登録されていれば本情報をUpdateする
      id = target.id;
    } else {
      // 本情報が登録されていなければ、新規でidを付与して登録する
      id = bookList.isEmpty ? 0 : bookList.last.id + 1;
    }
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
        hasRead: book.hasRead,
        memo: book.memo,
        rating: book.rating,
        selectedGenre: book.selectedGenre));
  }

  Future<void> updateMemo(Book book, String memo) async {
    into(books).insertOnConflictUpdate(Book(
        id: book.id,
        title: book.title,
        price: book.price,
        totalPage: book.totalPage,
        thumbnail: book.thumbnail,
        description: book.description,
        publisher: book.publisher,
        publishedDate: book.publishedDate,
        authors: book.authors,
        hasRead: book.hasRead,
        memo: memo,
        rating: book.rating,
        selectedGenre: book.selectedGenre));
  }

  Future<void> updateRating(Book book, double rating) async {
    into(books).insertOnConflictUpdate(Book(
        id: book.id,
        title: book.title,
        price: book.price,
        totalPage: book.totalPage,
        thumbnail: book.thumbnail,
        description: book.description,
        publisher: book.publisher,
        publishedDate: book.publishedDate,
        authors: book.authors,
        hasRead: book.hasRead,
        memo: book.memo,
        rating: rating,
        selectedGenre: book.selectedGenre));
  }

  Future<Book?> getBook(int id) async {
    final bookList = await getAllBookList;
    Book? book;
    for (var element in bookList) {
      if (element.id == id) {
        book = element;
      }
    }
    return book;
  }

  Future<void> deleteBook(int id) async {
    (delete(books)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> getLastId() async {
    final bookList = await getAllBookList;
    final id = bookList.isEmpty ? 0 : bookList.last.id + 1;
    return id;
  }

  Future<void> updateGenre(Book book, Set<int> intSet) async {
    //  DBに登録するためにSet<int>型をString型に変換
    final jsonString = jsonEncode(intSet.toList());
    await into(books).insertOnConflictUpdate(Book(
      id: book.id,
      title: book.title,
      price: book.price,
      totalPage: book.totalPage,
      thumbnail: book.thumbnail,
      description: book.description,
      publisher: book.publisher,
      publishedDate: book.publishedDate,
      authors: book.authors,
      hasRead: book.hasRead,
      memo: book.memo,
      rating: book.rating,
      selectedGenre: jsonString,
    ));
  }

  Future<Set<int>> getSetById(int id) async {
    final row =
        await (select(books)..where((tbl) => tbl.id.equals(id))).getSingle();
    final List<dynamic> list = jsonDecode(row.selectedGenre);
    return list.map((e) => e as int).toSet();
  }
}
