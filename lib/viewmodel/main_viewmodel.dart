import 'package:book/View/scan_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../view/book_shelf.dart';

part 'main_viewmodel.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(0) int selectedIndex,
    @Default(false) bool closeDialog,
  }) = _MainState;
}

class MainViewModel extends StateNotifier<MainState> {
  MainViewModel() : super(const MainState());

  void changeSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Widget getDisplayView(int index) {
    switch (index) {
      case 0:
        return const ScanBook();
      case 1:
        return BookShelf();
    }
    return const ScanBook();
  }

  void closeDialog() {
    state = state.copyWith(closeDialog: true);
  }
}
