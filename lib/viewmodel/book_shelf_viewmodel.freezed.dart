// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book_shelf_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookShelfState {
  int get crossAxisCount => throw _privateConstructorUsedError;
  bool get updateDb => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookShelfStateCopyWith<BookShelfState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookShelfStateCopyWith<$Res> {
  factory $BookShelfStateCopyWith(
          BookShelfState value, $Res Function(BookShelfState) then) =
      _$BookShelfStateCopyWithImpl<$Res>;
  $Res call({int crossAxisCount, bool updateDb});
}

/// @nodoc
class _$BookShelfStateCopyWithImpl<$Res>
    implements $BookShelfStateCopyWith<$Res> {
  _$BookShelfStateCopyWithImpl(this._value, this._then);

  final BookShelfState _value;
  // ignore: unused_field
  final $Res Function(BookShelfState) _then;

  @override
  $Res call({
    Object? crossAxisCount = freezed,
    Object? updateDb = freezed,
  }) {
    return _then(_value.copyWith(
      crossAxisCount: crossAxisCount == freezed
          ? _value.crossAxisCount
          : crossAxisCount // ignore: cast_nullable_to_non_nullable
              as int,
      updateDb: updateDb == freezed
          ? _value.updateDb
          : updateDb // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_BookShelfStateCopyWith<$Res>
    implements $BookShelfStateCopyWith<$Res> {
  factory _$$_BookShelfStateCopyWith(
          _$_BookShelfState value, $Res Function(_$_BookShelfState) then) =
      __$$_BookShelfStateCopyWithImpl<$Res>;
  @override
  $Res call({int crossAxisCount, bool updateDb});
}

/// @nodoc
class __$$_BookShelfStateCopyWithImpl<$Res>
    extends _$BookShelfStateCopyWithImpl<$Res>
    implements _$$_BookShelfStateCopyWith<$Res> {
  __$$_BookShelfStateCopyWithImpl(
      _$_BookShelfState _value, $Res Function(_$_BookShelfState) _then)
      : super(_value, (v) => _then(v as _$_BookShelfState));

  @override
  _$_BookShelfState get _value => super._value as _$_BookShelfState;

  @override
  $Res call({
    Object? crossAxisCount = freezed,
    Object? updateDb = freezed,
  }) {
    return _then(_$_BookShelfState(
      crossAxisCount: crossAxisCount == freezed
          ? _value.crossAxisCount
          : crossAxisCount // ignore: cast_nullable_to_non_nullable
              as int,
      updateDb: updateDb == freezed
          ? _value.updateDb
          : updateDb // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BookShelfState implements _BookShelfState {
  const _$_BookShelfState({this.crossAxisCount = 3, this.updateDb = false});

  @override
  @JsonKey()
  final int crossAxisCount;
  @override
  @JsonKey()
  final bool updateDb;

  @override
  String toString() {
    return 'BookShelfState(crossAxisCount: $crossAxisCount, updateDb: $updateDb)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookShelfState &&
            const DeepCollectionEquality()
                .equals(other.crossAxisCount, crossAxisCount) &&
            const DeepCollectionEquality().equals(other.updateDb, updateDb));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(crossAxisCount),
      const DeepCollectionEquality().hash(updateDb));

  @JsonKey(ignore: true)
  @override
  _$$_BookShelfStateCopyWith<_$_BookShelfState> get copyWith =>
      __$$_BookShelfStateCopyWithImpl<_$_BookShelfState>(this, _$identity);
}

abstract class _BookShelfState implements BookShelfState {
  const factory _BookShelfState(
      {final int crossAxisCount, final bool updateDb}) = _$_BookShelfState;

  @override
  int get crossAxisCount;
  @override
  bool get updateDb;
  @override
  @JsonKey(ignore: true)
  _$$_BookShelfStateCopyWith<_$_BookShelfState> get copyWith =>
      throw _privateConstructorUsedError;
}
