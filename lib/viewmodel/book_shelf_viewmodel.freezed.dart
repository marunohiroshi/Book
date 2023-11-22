// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_shelf_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookShelfState {
  List<model.Book> get bookList => throw _privateConstructorUsedError;
  int get crossAxisCount => throw _privateConstructorUsedError;
  bool get hasRead => throw _privateConstructorUsedError;
  bool get searchMode => throw _privateConstructorUsedError;
  bool get listMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookShelfStateCopyWith<BookShelfState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookShelfStateCopyWith<$Res> {
  factory $BookShelfStateCopyWith(
          BookShelfState value, $Res Function(BookShelfState) then) =
      _$BookShelfStateCopyWithImpl<$Res, BookShelfState>;
  @useResult
  $Res call(
      {List<model.Book> bookList,
      int crossAxisCount,
      bool hasRead,
      bool searchMode,
      bool listMode});
}

/// @nodoc
class _$BookShelfStateCopyWithImpl<$Res, $Val extends BookShelfState>
    implements $BookShelfStateCopyWith<$Res> {
  _$BookShelfStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookList = null,
    Object? crossAxisCount = null,
    Object? hasRead = null,
    Object? searchMode = null,
    Object? listMode = null,
  }) {
    return _then(_value.copyWith(
      bookList: null == bookList
          ? _value.bookList
          : bookList // ignore: cast_nullable_to_non_nullable
              as List<model.Book>,
      crossAxisCount: null == crossAxisCount
          ? _value.crossAxisCount
          : crossAxisCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasRead: null == hasRead
          ? _value.hasRead
          : hasRead // ignore: cast_nullable_to_non_nullable
              as bool,
      searchMode: null == searchMode
          ? _value.searchMode
          : searchMode // ignore: cast_nullable_to_non_nullable
              as bool,
      listMode: null == listMode
          ? _value.listMode
          : listMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookShelfStateImplCopyWith<$Res>
    implements $BookShelfStateCopyWith<$Res> {
  factory _$$BookShelfStateImplCopyWith(_$BookShelfStateImpl value,
          $Res Function(_$BookShelfStateImpl) then) =
      __$$BookShelfStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<model.Book> bookList,
      int crossAxisCount,
      bool hasRead,
      bool searchMode,
      bool listMode});
}

/// @nodoc
class __$$BookShelfStateImplCopyWithImpl<$Res>
    extends _$BookShelfStateCopyWithImpl<$Res, _$BookShelfStateImpl>
    implements _$$BookShelfStateImplCopyWith<$Res> {
  __$$BookShelfStateImplCopyWithImpl(
      _$BookShelfStateImpl _value, $Res Function(_$BookShelfStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookList = null,
    Object? crossAxisCount = null,
    Object? hasRead = null,
    Object? searchMode = null,
    Object? listMode = null,
  }) {
    return _then(_$BookShelfStateImpl(
      bookList: null == bookList
          ? _value._bookList
          : bookList // ignore: cast_nullable_to_non_nullable
              as List<model.Book>,
      crossAxisCount: null == crossAxisCount
          ? _value.crossAxisCount
          : crossAxisCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasRead: null == hasRead
          ? _value.hasRead
          : hasRead // ignore: cast_nullable_to_non_nullable
              as bool,
      searchMode: null == searchMode
          ? _value.searchMode
          : searchMode // ignore: cast_nullable_to_non_nullable
              as bool,
      listMode: null == listMode
          ? _value.listMode
          : listMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BookShelfStateImpl implements _BookShelfState {
  const _$BookShelfStateImpl(
      {final List<model.Book> bookList = const <model.Book>[],
      this.crossAxisCount = 3,
      this.hasRead = true,
      this.searchMode = false,
      this.listMode = false})
      : _bookList = bookList;

  final List<model.Book> _bookList;
  @override
  @JsonKey()
  List<model.Book> get bookList {
    if (_bookList is EqualUnmodifiableListView) return _bookList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookList);
  }

  @override
  @JsonKey()
  final int crossAxisCount;
  @override
  @JsonKey()
  final bool hasRead;
  @override
  @JsonKey()
  final bool searchMode;
  @override
  @JsonKey()
  final bool listMode;

  @override
  String toString() {
    return 'BookShelfState(bookList: $bookList, crossAxisCount: $crossAxisCount, hasRead: $hasRead, searchMode: $searchMode, listMode: $listMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookShelfStateImpl &&
            const DeepCollectionEquality().equals(other._bookList, _bookList) &&
            (identical(other.crossAxisCount, crossAxisCount) ||
                other.crossAxisCount == crossAxisCount) &&
            (identical(other.hasRead, hasRead) || other.hasRead == hasRead) &&
            (identical(other.searchMode, searchMode) ||
                other.searchMode == searchMode) &&
            (identical(other.listMode, listMode) ||
                other.listMode == listMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bookList),
      crossAxisCount,
      hasRead,
      searchMode,
      listMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookShelfStateImplCopyWith<_$BookShelfStateImpl> get copyWith =>
      __$$BookShelfStateImplCopyWithImpl<_$BookShelfStateImpl>(
          this, _$identity);
}

abstract class _BookShelfState implements BookShelfState {
  const factory _BookShelfState(
      {final List<model.Book> bookList,
      final int crossAxisCount,
      final bool hasRead,
      final bool searchMode,
      final bool listMode}) = _$BookShelfStateImpl;

  @override
  List<model.Book> get bookList;
  @override
  int get crossAxisCount;
  @override
  bool get hasRead;
  @override
  bool get searchMode;
  @override
  bool get listMode;
  @override
  @JsonKey(ignore: true)
  _$$BookShelfStateImplCopyWith<_$BookShelfStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
