import 'package:flutter/material.dart';
import 'package:todo_app/views/splash_screen.dart';
import 'utils/state_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: NoSplashColor(),
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      home: const SplashScreen(),
    );
  }
}

class NoSplashColor extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
