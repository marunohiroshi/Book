import 'package:book/View/scan_book.dart';
import 'package:book/view/book_shelf.dart';
import 'package:book/view/main_view.dart';
import 'package:go_router/go_router.dart';

final bookRoutes = [
  GoRoute(
    path: '/main_view',
    builder: (context, state) => const MainView(),
  ),
  GoRoute(
    path: '/scan_book',
    builder: (context, state) => const MainView(),
    pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: ScanBook(),
        transitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child),
    // ページ内で遷移したい画
  ),
  GoRoute(
    path: '/book_shelf',
    builder: (context, state) => BookShelf(),
  ),
];
