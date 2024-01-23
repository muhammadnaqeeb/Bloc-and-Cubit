import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_cubit/cubit/todo_cubit.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final todoTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: todoTitleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TodoCubit>(context).addTodo(
                  todoTitleController.text.trim(),
                );
                // OR
                // context.read<TodoCubit>().addTodo(
                //       todoTitleController.text.trim(),
                //     );
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
