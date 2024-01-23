import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_cubit/model/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final todo = TodoModel(
      name: title,
      createdAt: DateTime.now(),
    );
    emit([...state, todo]);
  }

  // delete todo
  void removeTodo(int index) {
    state.removeAt(index);
    emit([...state]);
  }
}
