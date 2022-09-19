// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scan_book_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScanBookState {
  bool get scanned => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanBookStateCopyWith<ScanBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanBookStateCopyWith<$Res> {
  factory $ScanBookStateCopyWith(
          ScanBookState value, $Res Function(ScanBookState) then) =
      _$ScanBookStateCopyWithImpl<$Res>;
  $Res call({bool scanned});
}

/// @nodoc
class _$ScanBookStateCopyWithImpl<$Res>
    implements $ScanBookStateCopyWith<$Res> {
  _$ScanBookStateCopyWithImpl(this._value, this._then);

  final ScanBookState _value;
  // ignore: unused_field
  final $Res Function(ScanBookState) _then;

  @override
  $Res call({
    Object? scanned = freezed,
  }) {
    return _then(_value.copyWith(
      scanned: scanned == freezed
          ? _value.scanned
          : scanned // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ScanBookStateCopyWith<$Res>
    implements $ScanBookStateCopyWith<$Res> {
  factory _$$_ScanBookStateCopyWith(
          _$_ScanBookState value, $Res Function(_$_ScanBookState) then) =
      __$$_ScanBookStateCopyWithImpl<$Res>;
  @override
  $Res call({bool scanned});
}

/// @nodoc
class __$$_ScanBookStateCopyWithImpl<$Res>
    extends _$ScanBookStateCopyWithImpl<$Res>
    implements _$$_ScanBookStateCopyWith<$Res> {
  __$$_ScanBookStateCopyWithImpl(
      _$_ScanBookState _value, $Res Function(_$_ScanBookState) _then)
      : super(_value, (v) => _then(v as _$_ScanBookState));

  @override
  _$_ScanBookState get _value => super._value as _$_ScanBookState;

  @override
  $Res call({
    Object? scanned = freezed,
  }) {
    return _then(_$_ScanBookState(
      scanned: scanned == freezed
          ? _value.scanned
          : scanned // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ScanBookState implements _ScanBookState {
  const _$_ScanBookState({this.scanned = false});

  @override
  @JsonKey()
  final bool scanned;

  @override
  String toString() {
    return 'ScanBookState(scanned: $scanned)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScanBookState &&
            const DeepCollectionEquality().equals(other.scanned, scanned));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(scanned));

  @JsonKey(ignore: true)
  @override
  _$$_ScanBookStateCopyWith<_$_ScanBookState> get copyWith =>
      __$$_ScanBookStateCopyWithImpl<_$_ScanBookState>(this, _$identity);
}

abstract class _ScanBookState implements ScanBookState {
  const factory _ScanBookState({final bool scanned}) = _$_ScanBookState;

  @override
  bool get scanned;
  @override
  @JsonKey(ignore: true)
  _$$_ScanBookStateCopyWith<_$_ScanBookState> get copyWith =>
      throw _privateConstructorUsedError;
}
