import 'package:flutter/material.dart';

import '../db/todo_db.dart';
import '../models/todo_model.dart';

class HomeController extends ChangeNotifier {
  static ValueNotifier<List<TodoModel>?> listTodo = ValueNotifier(null);

  static Future<void> getTodo() async {
    listTodo.value = [];
    listTodo.notifyListeners();

    try {
      listTodo.value = null;
      listTodo.notifyListeners();
      await Future.delayed(const Duration(seconds: 2));
      List<Map<String, dynamic>> todoData = await TodoDb.query();
      List<TodoModel> data =
          todoData.map((e) => TodoModel.fromJson(e)).toList();
      listTodo.value = data;
      listTodo.notifyListeners();
    } catch (e) {}
  }

  static void init() async {
    listTodo = ValueNotifier(null);
  }

  static Future<void> disposes() async {
    listTodo.dispose();
  }
}
