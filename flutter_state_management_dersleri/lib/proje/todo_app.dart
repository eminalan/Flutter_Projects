// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management_dersleri/proje/providers/all_providers.dart';
import 'package:flutter_state_management_dersleri/proje/widgets/future_provider_page.dart';
import 'package:flutter_state_management_dersleri/proje/widgets/title_widgets.dart';
import 'package:flutter_state_management_dersleri/proje/widgets/todo_list_item_widget.dart';
import 'package:flutter_state_management_dersleri/proje/widgets/toolbar_widget.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({super.key});
  final TextEditingController newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(todoListProvider);
    var allTodos = ref.watch(todoListProvider);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          TitleWidgets(),
          SizedBox(height: 20),
          TextField(
            controller: newTodoController,
            onSubmitted: (newTodo) {
              ref.read(todoListProvider.notifier).addTodo(newTodo);
            },
            decoration: InputDecoration(
                labelText: "Neler Yapacaksın Bugün ?",
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 20),
          ToolbarWidget(),
          SizedBox(height: 20),
          for (var i = 0; i < allTodos.length; i++)
            Dismissible(
              key: ValueKey(allTodos[i].id),
              child: ProviderScope(
                overrides: [
                  currentTodoProvider.overrideWithValue(allTodos[i]),
                ],
                child: TodoListItemWidget(),
              ),
              onDismissed: (_) {
                ref.read(todoListProvider.notifier).remove(allTodos[i]);
              },
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FutureProviderPage(),
                ),
              );
            },
            child: Text("Future Provider Example"),
          ),
        ],
      ),
    );
  }
}
