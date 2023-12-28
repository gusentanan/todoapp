import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/todo_repository_provider.dart';
import 'package:todoapp/providers/todo_notifier.dart';
import 'package:todoapp/providers/todo_state.dart';

final todoProvider = StateNotifierProvider<ToDoNotifier, TodoState>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return ToDoNotifier(repository);
});
