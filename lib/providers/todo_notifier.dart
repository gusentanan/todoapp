import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/models/todo_table.dart';
import 'package:todoapp/data/todo_repository.dart';
import 'package:todoapp/providers/todo_state.dart';

class ToDoNotifier extends StateNotifier<TodoState> {
  final TodoRepository _repository;

  ToDoNotifier(this._repository) : super(const TodoState.initial()) {
    getToDosTables();
  }

  Future<void> createToDosTable(ToDosTable todo) async {
    try {
      await _repository.addTodoDb(todo);
      getToDosTables();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteToDosTable(ToDosTable todo) async {
    try {
      await _repository.deleteTodoDb(todo);
      getToDosTables();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateToDosTable(ToDosTable todo) async {
    try {
      final isCompleted = !todo.isCompleted;
      final updatedToDosTable = todo.copyWith(isCompleted: isCompleted);
      await _repository.updateTodoDb(updatedToDosTable);
      getToDosTables();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getToDosTables() async {
    try {
      final todo = await _repository.getAllTodoDb();
      state = state.copyWith(todos: todo);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
