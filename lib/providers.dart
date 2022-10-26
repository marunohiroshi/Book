import 'package:book/drift/app_db_drift_impl.dart';
import 'package:book/router.dart';
import 'package:book/viewmodel/book_detail_viewmodel.dart';
import 'package:book/viewmodel/book_search_viewmodel.dart';
import 'package:book/viewmodel/book_shelf_viewmodel.dart';
import 'package:book/viewmodel/main_viewmodel.dart';
import 'package:book/viewmodel/scan_book_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// ルータープロバイダー
final routerProvider = Provider<GoRouter>((ref) => GoRouter(
      routes: bookRoutes,
    ));

/// データベースプロバイダー
final appDbProvider = Provider<AppDbDriftImpl>((_) => AppDbDriftImpl());

/// Mainプロバイダー
final mainViewModelProvider =
    StateNotifierProvider<MainViewModel, MainState>((ref) => MainViewModel());

/// scan_bookプロバイダー
final scanBookViewModelProvider =
    StateNotifierProvider<ScanBookViewModel, ScanBookState>(
        (ref) => ScanBookViewModel(ref.read(appDbProvider)));

/// book_shelfプロバイダー
final bookShelfViewModelProvider =
    StateNotifierProvider.autoDispose<BookShelfViewModel, BookShelfState>(
        (ref) => BookShelfViewModel(ref.read(appDbProvider)));

/// book_detail_viewプロバイダー
final bookDetailViewModelProvider = StateNotifierProvider.family
    .autoDispose<BookDetailViewModel, BookDetailState, Book>(
        (ref, book) => BookDetailViewModel(ref.read(appDbProvider), book));

/// book_sarch_viewプロバイダー
final bookSearchViewModelProvider =
    StateNotifierProvider.autoDispose<BookSearchViewModel, BookSearchState>(
        (ref) => BookSearchViewModel(ref.read(appDbProvider)));
