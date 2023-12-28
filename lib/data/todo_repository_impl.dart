import 'package:todoapp/data/db/todo_database.dart';
import 'package:todoapp/data/models/todo_table.dart';
import 'package:todoapp/data/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final ToDosDatabaseHelper _datasource;
  TodoRepositoryImpl(this._datasource);

  @override
  Future<void> addTodoDb(ToDosTable todo) async {
    try {
      await _datasource.addTodo(todo);
    } catch (exception) {
      throw '$exception';
    }
  }

  @override
  Future<void> deleteTodoDb(ToDosTable todo) async {
    try {
      await _datasource.deleteTodo(todo);
    } catch (exception) {
      throw '$exception';
    }
  }

  @override
  Future<List<ToDosTable>> getAllTodoDb() async {
    try {
      return await _datasource.getAllTodo();
    } catch (exception) {
      throw '$exception';
    }
  }

  @override
  Future<void> updateTodoDb(ToDosTable todo) async {
    try {
      await _datasource.updateTodo(todo);
    } catch (exception) {
      throw '$exception';
    }
  }
}
