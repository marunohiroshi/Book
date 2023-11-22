// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db_drift_impl.dart';

// ignore_for_file: type=lint
class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalPageMeta =
      const VerificationMeta('totalPage');
  @override
  late final GeneratedColumn<int> totalPage = GeneratedColumn<int>(
      'total_page', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _thumbnailMeta =
      const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _publisherMeta =
      const VerificationMeta('publisher');
  @override
  late final GeneratedColumn<String> publisher = GeneratedColumn<String>(
      'publisher', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _publishedDateMeta =
      const VerificationMeta('publishedDate');
  @override
  late final GeneratedColumn<String> publishedDate = GeneratedColumn<String>(
      'published_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorsMeta =
      const VerificationMeta('authors');
  @override
  late final GeneratedColumn<String> authors = GeneratedColumn<String>(
      'authors', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hasReadMeta =
      const VerificationMeta('hasRead');
  @override
  late final GeneratedColumn<bool> hasRead = GeneratedColumn<bool>(
      'has_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_read" IN (0, 1))'));
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
      'memo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        price,
        totalPage,
        thumbnail,
        description,
        publisher,
        publishedDate,
        authors,
        hasRead,
        memo
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(Insertable<Book> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('total_page')) {
      context.handle(_totalPageMeta,
          totalPage.isAcceptableOrUnknown(data['total_page']!, _totalPageMeta));
    } else if (isInserting) {
      context.missing(_totalPageMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('publisher')) {
      context.handle(_publisherMeta,
          publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta));
    } else if (isInserting) {
      context.missing(_publisherMeta);
    }
    if (data.containsKey('published_date')) {
      context.handle(
          _publishedDateMeta,
          publishedDate.isAcceptableOrUnknown(
              data['published_date']!, _publishedDateMeta));
    } else if (isInserting) {
      context.missing(_publishedDateMeta);
    }
    if (data.containsKey('authors')) {
      context.handle(_authorsMeta,
          authors.isAcceptableOrUnknown(data['authors']!, _authorsMeta));
    } else if (isInserting) {
      context.missing(_authorsMeta);
    }
    if (data.containsKey('has_read')) {
      context.handle(_hasReadMeta,
          hasRead.isAcceptableOrUnknown(data['has_read']!, _hasReadMeta));
    } else if (isInserting) {
      context.missing(_hasReadMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo']!, _memoMeta));
    } else if (isInserting) {
      context.missing(_memoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Book(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price'])!,
      totalPage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_page'])!,
      thumbnail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      publisher: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}publisher'])!,
      publishedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}published_date'])!,
      authors: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}authors'])!,
      hasRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_read'])!,
      memo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}memo'])!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class Book extends DataClass implements Insertable<Book> {
  final int id;
  final String title;
  final int price;
  final int totalPage;
  final String thumbnail;
  final String description;
  final String publisher;
  final String publishedDate;
  final String authors;
  final bool hasRead;
  final String memo;
  const Book(
      {required this.id,
      required this.title,
      required this.price,
      required this.totalPage,
      required this.thumbnail,
      required this.description,
      required this.publisher,
      required this.publishedDate,
      required this.authors,
      required this.hasRead,
      required this.memo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['price'] = Variable<int>(price);
    map['total_page'] = Variable<int>(totalPage);
    map['thumbnail'] = Variable<String>(thumbnail);
    map['description'] = Variable<String>(description);
    map['publisher'] = Variable<String>(publisher);
    map['published_date'] = Variable<String>(publishedDate);
    map['authors'] = Variable<String>(authors);
    map['has_read'] = Variable<bool>(hasRead);
    map['memo'] = Variable<String>(memo);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      title: Value(title),
      price: Value(price),
      totalPage: Value(totalPage),
      thumbnail: Value(thumbnail),
      description: Value(description),
      publisher: Value(publisher),
      publishedDate: Value(publishedDate),
      authors: Value(authors),
      hasRead: Value(hasRead),
      memo: Value(memo),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      price: serializer.fromJson<int>(json['price']),
      totalPage: serializer.fromJson<int>(json['totalPage']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
      description: serializer.fromJson<String>(json['description']),
      publisher: serializer.fromJson<String>(json['publisher']),
      publishedDate: serializer.fromJson<String>(json['publishedDate']),
      authors: serializer.fromJson<String>(json['authors']),
      hasRead: serializer.fromJson<bool>(json['hasRead']),
      memo: serializer.fromJson<String>(json['memo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'price': serializer.toJson<int>(price),
      'totalPage': serializer.toJson<int>(totalPage),
      'thumbnail': serializer.toJson<String>(thumbnail),
      'description': serializer.toJson<String>(description),
      'publisher': serializer.toJson<String>(publisher),
      'publishedDate': serializer.toJson<String>(publishedDate),
      'authors': serializer.toJson<String>(authors),
      'hasRead': serializer.toJson<bool>(hasRead),
      'memo': serializer.toJson<String>(memo),
    };
  }

  Book copyWith(
          {int? id,
          String? title,
          int? price,
          int? totalPage,
          String? thumbnail,
          String? description,
          String? publisher,
          String? publishedDate,
          String? authors,
          bool? hasRead,
          String? memo}) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        totalPage: totalPage ?? this.totalPage,
        thumbnail: thumbnail ?? this.thumbnail,
        description: description ?? this.description,
        publisher: publisher ?? this.publisher,
        publishedDate: publishedDate ?? this.publishedDate,
        authors: authors ?? this.authors,
        hasRead: hasRead ?? this.hasRead,
        memo: memo ?? this.memo,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('totalPage: $totalPage, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('description: $description, ')
          ..write('publisher: $publisher, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('authors: $authors, ')
          ..write('hasRead: $hasRead, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, price, totalPage, thumbnail,
      description, publisher, publishedDate, authors, hasRead, memo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.title == this.title &&
          other.price == this.price &&
          other.totalPage == this.totalPage &&
          other.thumbnail == this.thumbnail &&
          other.description == this.description &&
          other.publisher == this.publisher &&
          other.publishedDate == this.publishedDate &&
          other.authors == this.authors &&
          other.hasRead == this.hasRead &&
          other.memo == this.memo);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> price;
  final Value<int> totalPage;
  final Value<String> thumbnail;
  final Value<String> description;
  final Value<String> publisher;
  final Value<String> publishedDate;
  final Value<String> authors;
  final Value<bool> hasRead;
  final Value<String> memo;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.price = const Value.absent(),
    this.totalPage = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.description = const Value.absent(),
    this.publisher = const Value.absent(),
    this.publishedDate = const Value.absent(),
    this.authors = const Value.absent(),
    this.hasRead = const Value.absent(),
    this.memo = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int price,
    required int totalPage,
    required String thumbnail,
    required String description,
    required String publisher,
    required String publishedDate,
    required String authors,
    required bool hasRead,
    required String memo,
  })  : title = Value(title),
        price = Value(price),
        totalPage = Value(totalPage),
        thumbnail = Value(thumbnail),
        description = Value(description),
        publisher = Value(publisher),
        publishedDate = Value(publishedDate),
        authors = Value(authors),
        hasRead = Value(hasRead),
        memo = Value(memo);
  static Insertable<Book> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? price,
    Expression<int>? totalPage,
    Expression<String>? thumbnail,
    Expression<String>? description,
    Expression<String>? publisher,
    Expression<String>? publishedDate,
    Expression<String>? authors,
    Expression<bool>? hasRead,
    Expression<String>? memo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (price != null) 'price': price,
      if (totalPage != null) 'total_page': totalPage,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (description != null) 'description': description,
      if (publisher != null) 'publisher': publisher,
      if (publishedDate != null) 'published_date': publishedDate,
      if (authors != null) 'authors': authors,
      if (hasRead != null) 'has_read': hasRead,
      if (memo != null) 'memo': memo,
    });
  }

  BooksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<int>? price,
      Value<int>? totalPage,
      Value<String>? thumbnail,
      Value<String>? description,
      Value<String>? publisher,
      Value<String>? publishedDate,
      Value<String>? authors,
      Value<bool>? hasRead,
      Value<String>? memo}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      totalPage: totalPage ?? this.totalPage,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      authors: authors ?? this.authors,
      hasRead: hasRead ?? this.hasRead,
      memo: memo ?? this.memo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (totalPage.present) {
      map['total_page'] = Variable<int>(totalPage.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(publisher.value);
    }
    if (publishedDate.present) {
      map['published_date'] = Variable<String>(publishedDate.value);
    }
    if (authors.present) {
      map['authors'] = Variable<String>(authors.value);
    }
    if (hasRead.present) {
      map['has_read'] = Variable<bool>(hasRead.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('totalPage: $totalPage, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('description: $description, ')
          ..write('publisher: $publisher, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('authors: $authors, ')
          ..write('hasRead: $hasRead, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDbDriftImpl extends GeneratedDatabase {
  _$AppDbDriftImpl(QueryExecutor e) : super(e);
  late final $BooksTable books = $BooksTable(this);
  late final BooksDao booksDao = BooksDao(this as AppDbDriftImpl);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [books];
}
