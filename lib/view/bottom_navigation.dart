import 'package:book/providers.dart';
import 'package:book/viewmodel/bottom_navigation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigation extends ConsumerWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(bottomNavigationProvider.notifier);
    final state = ref.read(bottomNavigationProvider);
    final router = ref.read(routerProvider);
    ref.listen(bottomNavigationProvider, (_, BottomNavigationState next) {
      switch (next.selectedIndex) {
        case 0:
          router.go('/scan_book');
          break;
        case 1:
          router.go('/book_shelf');
          break;
      }
    });

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.selectedIndex,
        onTap: (index) {
          print('index: ${index}');
          viewModel.changeSelectedIndex(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            activeIcon: Icon(Icons.book_online),
            label: 'Book',
            tooltip: "This is a Book Page",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            activeIcon: Icon(Icons.business_center),
            label: 'Business',
            tooltip: "This is a Business Page",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            activeIcon: Icon(Icons.school_outlined),
            label: 'School',
            tooltip: "This is a School Page",
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.settings_accessibility),
            label: 'Settings',
            tooltip: "This is a Settings Page",
            backgroundColor: Colors.pink,
          ),
        ],

        type: BottomNavigationBarType.shifting,
        // ここで色を設定していても、shiftingにしているので
        // Itemの方のbackgroundColorが勝ちます。
        backgroundColor: Colors.red,
        enableFeedback: true,
        // IconTheme系統の値が優先されます。
        iconSize: 18,
        // 横向きレイアウトは省略します。
        // landscapeLayout: 省略
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(size: 30, color: Colors.green),
        selectedLabelStyle: const TextStyle(color: Colors.red),
        // ちなみに、LabelStyleとItemColorの両方を選択した場合、ItemColorが勝ちます。
        selectedItemColor: Colors.black,
        unselectedFontSize: 15,
        unselectedIconTheme: const IconThemeData(size: 25, color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.purple),
        // IconTheme系統の値が優先されるのでこの値は適応されません。
        unselectedItemColor: Colors.red,
      ),
    );
  }
}
