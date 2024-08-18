import 'package:book/providers.dart';
import 'package:book/view/book_shelf_view.dart';
import 'package:book/view/chart_view.dart';
import 'package:book/view/home_view.dart';
import 'package:book/view/settings_view.dart';
import 'package:book/viewmodel/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainView extends ConsumerWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(mainViewModelProvider, (_, MainState next) {
      if (next.closeDialog) {
        print('closeDialog: ${next.closeDialog}');
        Navigator.pop(context);
      }
    });
    return Scaffold(
      backgroundColor: Colors.white10,
      body: PersistentTabView(
        popAllScreensOnTapAnyTabs: true,
        context,
        navBarStyle: NavBarStyle.style5,
        backgroundColor: Colors.white70,
        hideNavigationBarWhenKeyboardShows: true,
        screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease),
        screens: [HomeView(), BookShelf(), ChartView(), SettingsView()],
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
