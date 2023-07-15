// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  bool get closeDialog => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanBookStateCopyWith<ScanBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanBookStateCopyWith<$Res> {
  factory $ScanBookStateCopyWith(
          ScanBookState value, $Res Function(ScanBookState) then) =
      _$ScanBookStateCopyWithImpl<$Res, ScanBookState>;
  @useResult
  $Res call({bool scanned, bool closeDialog});
}

/// @nodoc
class _$ScanBookStateCopyWithImpl<$Res, $Val extends ScanBookState>
    implements $ScanBookStateCopyWith<$Res> {
  _$ScanBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanned = null,
    Object? closeDialog = null,
  }) {
    return _then(_value.copyWith(
      scanned: null == scanned
          ? _value.scanned
          : scanned // ignore: cast_nullable_to_non_nullable
              as bool,
      closeDialog: null == closeDialog
          ? _value.closeDialog
          : closeDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScanBookStateCopyWith<$Res>
    implements $ScanBookStateCopyWith<$Res> {
  factory _$$_ScanBookStateCopyWith(
          _$_ScanBookState value, $Res Function(_$_ScanBookState) then) =
      __$$_ScanBookStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool scanned, bool closeDialog});
}

/// @nodoc
class __$$_ScanBookStateCopyWithImpl<$Res>
    extends _$ScanBookStateCopyWithImpl<$Res, _$_ScanBookState>
    implements _$$_ScanBookStateCopyWith<$Res> {
  __$$_ScanBookStateCopyWithImpl(
      _$_ScanBookState _value, $Res Function(_$_ScanBookState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanned = null,
    Object? closeDialog = null,
  }) {
    return _then(_$_ScanBookState(
      scanned: null == scanned
          ? _value.scanned
          : scanned // ignore: cast_nullable_to_non_nullable
              as bool,
      closeDialog: null == closeDialog
          ? _value.closeDialog
          : closeDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ScanBookState implements _ScanBookState {
  const _$_ScanBookState({this.scanned = false, this.closeDialog = false});

  @override
  @JsonKey()
  final bool scanned;
  @override
  @JsonKey()
  final bool closeDialog;

  @override
  String toString() {
    return 'ScanBookState(scanned: $scanned, closeDialog: $closeDialog)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScanBookState &&
            (identical(other.scanned, scanned) || other.scanned == scanned) &&
            (identical(other.closeDialog, closeDialog) ||
                other.closeDialog == closeDialog));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scanned, closeDialog);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScanBookStateCopyWith<_$_ScanBookState> get copyWith =>
      __$$_ScanBookStateCopyWithImpl<_$_ScanBookState>(this, _$identity);
}

abstract class _ScanBookState implements ScanBookState {
  const factory _ScanBookState({final bool scanned, final bool closeDialog}) =
      _$_ScanBookState;

  @override
  bool get scanned;
  @override
  bool get closeDialog;
  @override
  @JsonKey(ignore: true)
  _$$_ScanBookStateCopyWith<_$_ScanBookState> get copyWith =>
      throw _privateConstructorUsedError;
}
