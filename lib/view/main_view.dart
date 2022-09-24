import 'package:book/View/scan_book_view.dart';
import 'package:book/providers.dart';
import 'package:book/view/book_shelf_view.dart';
import 'package:book/viewmodel/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainView extends ConsumerWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(mainViewModelProvider.notifier);
    final state = ref.watch(mainViewModelProvider);
    ref.listen(mainViewModelProvider, (_, MainState next) {
      viewModel.getDisplayView(next.selectedIndex);
      if (next.closeDialog) {
        print('closeDialog: ${next.closeDialog}');
        Navigator.pop(context);
      }
    });
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: PersistentTabView(
        context,
        screens: [
          const ScanBook(),
          BookShelf(),
          const ScanBook(),
          const ScanBook()
        ],
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.camera_alt),
            activeColorPrimary: Colors.green,
            inactiveColorPrimary: Colors.blue,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.collections_bookmark),
            activeColorPrimary: Colors.brown,
            inactiveColorPrimary: Colors.blue,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.recommend),
            activeColorPrimary: Colors.purple,
            inactiveColorPrimary: Colors.blue,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.settings),
            activeColorPrimary: Colors.pink,
            inactiveColorPrimary: Colors.blue,
          ),
        ],
      ),
    );
  }
}
