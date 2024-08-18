import 'dart:async';

import 'package:book/drift/app_db_drift_impl.dart' as model;
import 'package:book/drift/app_db_drift_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_viewmodel.freezed.dart';

@freezed
class ChartState with _$ChartState {
  const factory ChartState({
    @Default(<model.Book>[]) List<model.Book> bookList,
  }) = _ChartStateState;
}

class ChartViewModel extends StateNotifier<ChartState> {
  ChartViewModel(this._appDb) : super(const ChartState()) {
    fetch();
  }
  late final AppDbDriftImpl _appDb;
  late final List<model.Book> _bookList;

  Future<void> fetch() async {
    _bookList = await _appDb.getHasReadBookList;
  }

  /// 合計金額
  String getSumPrice() {
    int sum = _bookList.iterator.current.price;
    return sum.toString();
  }

  /// 合計ページ数
  String getSumPage() {
    int sum = _bookList.iterator.current.totalPage;
    return sum.toString();
  }

  // 本のジャンル別
}
