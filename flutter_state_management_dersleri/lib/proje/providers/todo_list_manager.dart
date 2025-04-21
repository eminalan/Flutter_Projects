import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management_dersleri/proje/models/todo_model.dart';
import 'package:uuid/uuid.dart';



class TodoListManager extends StateNotifier<List<TodoModel>> {
  TodoListManager([List<TodoModel>? todos]) : super(todos ?? []);

  void addTodo(String description) {
    var eklenecekTodo = TodoModel(id: Uuid().v4(), description: description);
    state = [...state, eklenecekTodo];
  }

  void toggle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
            id: todo.id,
            description: todo.description,
            completed: !todo.completed,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String newdescription}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
            id: todo.id,
            description: newdescription,
            completed: todo.completed,
          )
        else
          todo,
    ];
  }

  void remove(TodoModel silinecekTodo) {
    state = state.where((todo) => todo.id != silinecekTodo.id).toList();
  }
  int onComplatedTodoCount() {
    return state.where((element) => !element.completed).length;
  }
}

