import 'package:book/View/scan_book_view.dart';
import 'package:book/providers.dart';
import 'package:book/view/book_search_view.dart';
import 'package:book/view/book_shelf_view.dart';
import 'package:book/viewmodel/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainView extends ConsumerWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(mainViewModelProvider.notifier);
    ref.listen(mainViewModelProvider, (_, MainState next) {
      viewModel.getDisplayView(next.selectedIndex);
      if (next.closeDialog) {
        print('closeDialog: ${next.closeDialog}');
        Navigator.pop(context);
      }
    });
    return Scaffold(
      backgroundColor: Colors.white10,
      body: PersistentTabView(
        context,
        navBarStyle: NavBarStyle.style5,
        backgroundColor: Colors.white70,
        hideNavigationBarWhenKeyboardShows: true,
        screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease),
        screens: [
          const ScanBook(),
          BookShelf(),
          const BookSearch('DaiGo'),
          const ScanBook()
        ],
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.camera_alt),
            activeColorPrimary: Colors.green,
            inactiveColorPrimary: Colors.black,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.menu_book_rounded),
            activeColorPrimary: Colors.brown,
            inactiveColorPrimary: Colors.black,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.area_chart_outlined),
            activeColorPrimary: Colors.purple,
            inactiveColorPrimary: Colors.black,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.settings),
            activeColorPrimary: Colors.pink,
            inactiveColorPrimary: Colors.black,
          ),
        ],
      ),
    );
  }
}
