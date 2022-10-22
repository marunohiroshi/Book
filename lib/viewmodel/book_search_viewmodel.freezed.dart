// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book_search_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookSearchState {
  List<model.Book> get bookList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookSearchStateCopyWith<BookSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSearchStateCopyWith<$Res> {
  factory $BookSearchStateCopyWith(
          BookSearchState value, $Res Function(BookSearchState) then) =
      _$BookSearchStateCopyWithImpl<$Res>;
  $Res call({List<model.Book> bookList});
}

/// @nodoc
class _$BookSearchStateCopyWithImpl<$Res>
    implements $BookSearchStateCopyWith<$Res> {
  _$BookSearchStateCopyWithImpl(this._value, this._then);

  final BookSearchState _value;
  // ignore: unused_field
  final $Res Function(BookSearchState) _then;

  @override
  $Res call({
    Object? bookList = freezed,
  }) {
    return _then(_value.copyWith(
      bookList: bookList == freezed
          ? _value.bookList
          : bookList // ignore: cast_nullable_to_non_nullable
              as List<model.Book>,
    ));
  }
}

/// @nodoc
abstract class _$$_BookSearchCopyWith<$Res>
    implements $BookSearchStateCopyWith<$Res> {
  factory _$$_BookSearchCopyWith(
          _$_BookSearch value, $Res Function(_$_BookSearch) then) =
      __$$_BookSearchCopyWithImpl<$Res>;
  @override
  $Res call({List<model.Book> bookList});
}

/// @nodoc
class __$$_BookSearchCopyWithImpl<$Res>
    extends _$BookSearchStateCopyWithImpl<$Res>
    implements _$$_BookSearchCopyWith<$Res> {
  __$$_BookSearchCopyWithImpl(
      _$_BookSearch _value, $Res Function(_$_BookSearch) _then)
      : super(_value, (v) => _then(v as _$_BookSearch));

  @override
  _$_BookSearch get _value => super._value as _$_BookSearch;

  @override
  $Res call({
    Object? bookList = freezed,
  }) {
    return _then(_$_BookSearch(
      bookList: bookList == freezed
          ? _value._bookList
          : bookList // ignore: cast_nullable_to_non_nullable
              as List<model.Book>,
    ));
  }
}

/// @nodoc

class _$_BookSearch implements _BookSearch {
  const _$_BookSearch({final List<model.Book> bookList = const <model.Book>[]})
      : _bookList = bookList;

  final List<model.Book> _bookList;
  @override
  @JsonKey()
  List<model.Book> get bookList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookList);
  }

  @override
  String toString() {
    return 'BookSearchState(bookList: $bookList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookSearch &&
            const DeepCollectionEquality().equals(other._bookList, _bookList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_bookList));

  @JsonKey(ignore: true)
  @override
  _$$_BookSearchCopyWith<_$_BookSearch> get copyWith =>
      __$$_BookSearchCopyWithImpl<_$_BookSearch>(this, _$identity);
}

abstract class _BookSearch implements BookSearchState {
  const factory _BookSearch({final List<model.Book> bookList}) = _$_BookSearch;

  @override
  List<model.Book> get bookList;
  @override
  @JsonKey(ignore: true)
  _$$_BookSearchCopyWith<_$_BookSearch> get copyWith =>
      throw _privateConstructorUsedError;
}
