import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navigation_viewmodel.freezed.dart';

@freezed
class BottomNavigationState with _$BottomNavigationState {
  const factory BottomNavigationState({
    @Default(0) int selectedIndex,
  }) = _BottomNavigationState;
}

class BottomNavigationViewModel extends StateNotifier<BottomNavigationState> {
  BottomNavigationViewModel() : super(const BottomNavigationState());

  void changeSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}
