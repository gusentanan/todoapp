import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/db/todo_db_provider.dart';
import 'package:todoapp/data/todo_repository.dart';
import 'package:todoapp/data/todo_repository_impl.dart';

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final datasource = ref.read(todoDatasourceProvider);
  return TodoRepositoryImpl(datasource);
});
