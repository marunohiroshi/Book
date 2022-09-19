import 'package:book/drift/app_db_drift_impl.dart';
import 'package:book/router.dart';
import 'package:book/viewmodel/book_shelf_viewmodel.dart';
import 'package:book/viewmodel/bottom_navigation_viewmodel.dart';
import 'package:book/viewmodel/scan_book_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// ルータープロバイダー
final routerProvider = Provider<GoRouter>((ref) => GoRouter(
      initialLocation: '/book_shelf',
      routes: bookRoutes,
      // navigatorBuilder: (context, state, child) {
      //   return Navigator(
      //     onPopPage: (route, dynamic __) => false,
      //     pages: [
      //       MaterialPage<Widget>(
      //         child: BottomNavigation(),
      //       ),
      //     ],
      //   );
      // },
    ));

/// データベースプロバイダー
final appDbProvider = Provider<AppDbDriftImpl>((_) => AppDbDriftImpl());

final bottomNavigationProvider =
    StateNotifierProvider<BottomNavigationViewModel, BottomNavigationState>(
        (ref) => BottomNavigationViewModel());

/// scan_bookプロバイダー
final scanBookViewModelProvider =
    StateNotifierProvider<ScanBookViewModel, ScanBookState>(
        (ref) => ScanBookViewModel(ref.read(appDbProvider)));

/// book_shelfプロバイダー
final bookShelfViewModelProvider =
    StateNotifierProvider.autoDispose<BookShelfViewModel, BookShelfState>(
        (ref) => BookShelfViewModel(ref.read(appDbProvider)));
