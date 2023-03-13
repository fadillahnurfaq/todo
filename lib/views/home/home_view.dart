import 'package:flutter/material.dart';
import '../../controllers/home_controller.dart';
import '../../models/todo_model.dart';
import '../../utils/colors.dart';
import '../../utils/state_util.dart';
import '../add/add_todo_view.dart';
import 'widgets/container_todo.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    HomeController.init();
    HomeController.getTodo();
    super.initState();
  }

  @override
  void dispose() {
    HomeController.disposes();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TO DO LIST",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
                ),
                const Icon(Icons.settings_outlined),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Image.asset("assets/menu.png"),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    "LIST OF TODO",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: boldOrangeColor,
                    ),
                  ),
                ),
                Image.asset("assets/filter.png"),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            ValueListenableBuilder<List<TodoModel>?>(
                valueListenable: HomeController.listTodo,
                builder: (_, listTodo, __) {
                  if (listTodo == null) {
                    return const CircularProgressIndicator();
                  } else if (listTodo.isEmpty) {
                    return const SizedBox();
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: listTodo.length,
                      itemBuilder: (context, index) {
                        TodoModel data = listTodo[index];

                        return ContainerTodo(
                          data: data,
                        );
                      },
                    );
                  }
                })
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 60.0,
        width: 60.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: boldOrangeColor,
            shape: const CircleBorder(),
          ),
          onPressed: () {
            Get.to(
              page: const AddTodoView(),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
