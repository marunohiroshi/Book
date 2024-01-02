import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_viewmodel.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(0) int id,
  }) = _SettingsState;
}

class SettingsViewModel extends StateNotifier<SettingsState> {
  SettingsViewModel(super.state);
}
