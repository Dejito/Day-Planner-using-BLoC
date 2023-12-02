import 'package:day_planner/todo/bloc.dart';
import 'package:day_planner/todo/event.dart';
import 'package:day_planner/todo/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  addTodo(Todo todo) {
    context.read<TodoBloc>().add(
      AddTodo(todo)
    );
  }

  removeTodo(Todo todo) {
    context.read<TodoBloc>().add(
      RemoveTodo(todo)
    );
  }

  alertTodo(int index) {
    context.read<TodoBloc>().add(
      AlterTodo(index)
    );
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController controller1 = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) =>
            AlertDialog(
              title: const Text(
                "Add a task"
              ),
              content: Column(
                children: [
                  TextField(
                    controller: controller1,
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    decoration: InputDecoration(
                      hintText: "Task title",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary
                        )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey
                        )
                      )
                    ),
                  )
                ],
              ),
            ),
          );
        },
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.black,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: const Text(
          'My Day Planner',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (BuildContext context, state) {
            if (state.status == TodoStatus.success) {
              return Container();
            } else if (state.status == TodoStatus.initial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
