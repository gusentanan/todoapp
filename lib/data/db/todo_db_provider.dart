import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/db/todo_database.dart';

final todoDatasourceProvider = Provider<ToDosDatabaseHelper>((ref) {
  return ToDosDatabaseHelper();
});
