// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChartState {
  List<model.Book> get bookList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChartStateCopyWith<ChartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartStateCopyWith<$Res> {
  factory $ChartStateCopyWith(
          ChartState value, $Res Function(ChartState) then) =
      _$ChartStateCopyWithImpl<$Res, ChartState>;
  @useResult
  $Res call({List<model.Book> bookList});
}

/// @nodoc
class _$ChartStateCopyWithImpl<$Res, $Val extends ChartState>
    implements $ChartStateCopyWith<$Res> {
  _$ChartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$ChartStateStateImplCopyWith<$Res>
    implements $ChartStateCopyWith<$Res> {
  factory _$$ChartStateStateImplCopyWith(_$ChartStateStateImpl value,
          $Res Function(_$ChartStateStateImpl) then) =
      __$$ChartStateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<model.Book> bookList});
}

/// @nodoc
class __$$ChartStateStateImplCopyWithImpl<$Res>
    extends _$ChartStateCopyWithImpl<$Res, _$ChartStateStateImpl>
    implements _$$ChartStateStateImplCopyWith<$Res> {
  __$$ChartStateStateImplCopyWithImpl(
      _$ChartStateStateImpl _value, $Res Function(_$ChartStateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookList = null,
  }) {
    return _then(_$ChartStateStateImpl(
      bookList: null == bookList
          ? _value._bookList
          : bookList // ignore: cast_nullable_to_non_nullable
              as List<model.Book>,
    ));
  }
}

/// @nodoc

class _$ChartStateStateImpl implements _ChartStateState {
  const _$ChartStateStateImpl(
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
    return 'ChartState(bookList: $bookList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartStateStateImpl &&
            const DeepCollectionEquality().equals(other._bookList, _bookList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_bookList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartStateStateImplCopyWith<_$ChartStateStateImpl> get copyWith =>
      __$$ChartStateStateImplCopyWithImpl<_$ChartStateStateImpl>(
          this, _$identity);
}

abstract class _ChartStateState implements ChartState {
  const factory _ChartStateState({final List<model.Book> bookList}) =
      _$ChartStateStateImpl;

  @override
  List<model.Book> get bookList;
  @override
  @JsonKey(ignore: true)
  _$$ChartStateStateImplCopyWith<_$ChartStateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
