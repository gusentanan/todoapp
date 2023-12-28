import 'package:todoapp/data/models/todo_table.dart';

abstract class TodoRepository {
  Future<void> addTodoDb(ToDosTable todo);
  Future<void> updateTodoDb(ToDosTable todo);
  Future<void> deleteTodoDb(ToDosTable todo);
  Future<List<ToDosTable>> getAllTodoDb();
}
