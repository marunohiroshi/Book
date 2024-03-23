import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_viewmodel.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool closeDialog,
  }) = _MainState;
}

class MainViewModel extends StateNotifier<MainState> {
  MainViewModel() : super(const MainState());

  void closeDialog() {
    state = state.copyWith(closeDialog: true);
  }
}
