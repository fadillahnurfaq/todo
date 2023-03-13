import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../db/todo_db.dart';
import '../utils/state_util.dart';
import 'home/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initializeDateFormatting();
    TodoDb.initDB();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAll(page: const HomeView()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset("assets/union.png"),
            ),
          ),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 30.0,
          )
        ],
      ),
    );
  }
}
