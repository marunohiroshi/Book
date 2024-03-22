// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainState {
  int get selectedIndex => throw _privateConstructorUsedError;
  bool get closeDialog => throw _privateConstructorUsedError;
  bool get isDisplayDialog => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call({int selectedIndex, bool closeDialog, bool isDisplayDialog});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? closeDialog = null,
    Object? isDisplayDialog = null,
  }) {
    return _then(_value.copyWith(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      closeDialog: null == closeDialog
          ? _value.closeDialog
          : closeDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      isDisplayDialog: null == isDisplayDialog
          ? _value.isDisplayDialog
          : isDisplayDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedIndex, bool closeDialog, bool isDisplayDialog});
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? closeDialog = null,
    Object? isDisplayDialog = null,
  }) {
    return _then(_$MainStateImpl(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      closeDialog: null == closeDialog
          ? _value.closeDialog
          : closeDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      isDisplayDialog: null == isDisplayDialog
          ? _value.isDisplayDialog
          : isDisplayDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MainStateImpl implements _MainState {
  const _$MainStateImpl(
      {this.selectedIndex = 0,
      this.closeDialog = false,
      this.isDisplayDialog = false});

  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final bool closeDialog;
  @override
  @JsonKey()
  final bool isDisplayDialog;

  @override
  String toString() {
    return 'MainState(selectedIndex: $selectedIndex, closeDialog: $closeDialog, isDisplayDialog: $isDisplayDialog)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.closeDialog, closeDialog) ||
                other.closeDialog == closeDialog) &&
            (identical(other.isDisplayDialog, isDisplayDialog) ||
                other.isDisplayDialog == isDisplayDialog));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedIndex, closeDialog, isDisplayDialog);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);
}

abstract class _MainState implements MainState {
  const factory _MainState(
      {final int selectedIndex,
      final bool closeDialog,
      final bool isDisplayDialog}) = _$MainStateImpl;

  @override
  int get selectedIndex;
  @override
  bool get closeDialog;
  @override
  bool get isDisplayDialog;
  @override
  @JsonKey(ignore: true)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
