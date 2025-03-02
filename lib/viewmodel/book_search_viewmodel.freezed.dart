// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_search_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookSearchState {
  List<model.Book> get bookList => throw _privateConstructorUsedError;

  /// Create a copy of BookSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookSearchStateCopyWith<BookSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSearchStateCopyWith<$Res> {
  factory $BookSearchStateCopyWith(
          BookSearchState value, $Res Function(BookSearchState) then) =
      _$BookSearchStateCopyWithImpl<$Res, BookSearchState>;
  @useResult
  $Res call({List<model.Book> bookList});
}

/// @nodoc
class _$BookSearchStateCopyWithImpl<$Res, $Val extends BookSearchState>
    implements $BookSearchStateCopyWith<$Res> {
  _$BookSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookList = null,
  }) {
    return _then(_value.copyWith(
      bookList: null == bookList
          ? _value.bookList
          : bookList // ignore: cast_nullable_to_non_nullable
              as List<model.Book>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookSearchImplCopyWith<$Res>
    implements $BookSearchStateCopyWith<$Res> {
  factory _$$BookSearchImplCopyWith(
          _$BookSearchImpl value, $Res Function(_$BookSearchImpl) then) =
      __$$BookSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<model.Book> bookList});
}

/// @nodoc
class __$$BookSearchImplCopyWithImpl<$Res>
    extends _$BookSearchStateCopyWithImpl<$Res, _$BookSearchImpl>
    implements _$$BookSearchImplCopyWith<$Res> {
  __$$BookSearchImplCopyWithImpl(
      _$BookSearchImpl _value, $Res Function(_$BookSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookList = null,
  }) {
    return _then(_$BookSearchImpl(
      bookList: null == bookList
          ? _value._bookList
          : bookList // ignore: cast_nullable_to_non_nullable
              as List<model.Book>,
    ));
  }
}

/// @nodoc

class _$BookSearchImpl implements _BookSearch {
  const _$BookSearchImpl(
      {final List<model.Book> bookList = const <model.Book>[]})
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
  String toString() {
    return 'BookSearchState(bookList: $bookList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSearchImpl &&
            const DeepCollectionEquality().equals(other._bookList, _bookList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_bookList));

  /// Create a copy of BookSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSearchImplCopyWith<_$BookSearchImpl> get copyWith =>
      __$$BookSearchImplCopyWithImpl<_$BookSearchImpl>(this, _$identity);
}

abstract class _BookSearch implements BookSearchState {
  const factory _BookSearch({final List<model.Book> bookList}) =
      _$BookSearchImpl;

  @override
  List<model.Book> get bookList;

  /// Create a copy of BookSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookSearchImplCopyWith<_$BookSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
