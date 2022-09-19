import 'package:book/drift/app_db_drift_impl.dart';
import 'package:book/model/book.dart' as models;
import 'package:drift/drift.dart';

part 'books_dao.g.dart';

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get price => integer()();
  IntColumn get totalPage => integer()();
  TextColumn get smallThumbnail => text()();
  TextColumn get thumbnail => text()();
  TextColumn get description => text()();
  TextColumn get publisher => text()();
  TextColumn get publishedDate => text()();
  TextColumn get authors => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftAccessor(tables: [Books])
class BooksDao extends DatabaseAccessor<AppDbDriftImpl> with _$BooksDaoMixin {
  BooksDao(AppDbDriftImpl db) : super(db);

  Future<List<models.Book>> get getList async {
    final bookList = await select(books).get();
    return bookList
        .map((book) => models.Book(
            id: book.id,
            title: book.title,
            price: book.price,
            totalPage: book.totalPage,
            smallThumbnail: book.smallThumbnail,
            thumbnail: book.thumbnail,
            description: book.description,
            publisher: book.publisher,
            publishedDate: book.publishedDate,
            authors: book.authors))
        .toList();
  }

  Future<void> add(models.Book book) async {
    final bookList = await getList;
    final id = bookList.last.id + 1;
    into(books).insertOnConflictUpdate(Book(
        id: id,
        title: book.title,
        price: book.price,
        totalPage: book.totalPage,
        smallThumbnail: book.smallThumbnail,
        thumbnail: book.thumbnail,
        description: book.description,
        publisher: book.publisher,
        publishedDate: book.publishedDate,
        authors: book.authors));
  }
}
