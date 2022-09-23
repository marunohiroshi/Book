import 'package:book/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    router.go('/main_view');
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
    // return NeumorphicApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Book',
    //   themeMode: ThemeMode.light,
    //   theme: const NeumorphicThemeData(
    //     baseColor: Color(0xFFFFFFFF),
    //     lightSource: LightSource.topLeft,
    //     depth: 10,
    //   ),
    //   darkTheme: const NeumorphicThemeData(
    //     baseColor: Color(0xFF3E3E3E),
    //     lightSource: LightSource.topLeft,
    //     depth: 6,
    //   ),
    //   home: BottomNavigation(),
    //   routes: ,
    // );
  }
}
