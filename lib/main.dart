import 'package:book/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsFlutterBinding.ensureInitialized();
    // final router = ref.watch(routerProvider);
    // router.go('/main_view');
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   themeMode: ThemeMode.light,
    //   routeInformationProvider: router.routeInformationProvider,
    //   routeInformationParser: router.routeInformationParser,
    //   routerDelegate: router.routerDelegate,
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.light,
      home: const MainView(),
      routes: const {},
    );
  }
}
