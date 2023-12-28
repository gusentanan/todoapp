import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/data/models/todo_table.dart';
import 'package:todoapp/utils/todo_keys.dart';

class ToDosDatabaseHelper {
  static final ToDosDatabaseHelper _instance = ToDosDatabaseHelper._();

  factory ToDosDatabaseHelper() => _instance;

  ToDosDatabaseHelper._() {
    _initDb();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todosapp.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos (
        ${ToDoKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ToDoKeys.title} TEXT,
        ${ToDoKeys.isCompleted} INTEGER
      )
    ''');
  }

  Future<int> addTodo(ToDosTable todo) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        'todos',
        todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<ToDosTable>> getAllTodo() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'todos',
      orderBy: "id DESC",
    );
    return List.generate(
      maps.length,
      (index) {
        return ToDosTable.fromJson(maps[index]);
      },
    );
  }

  Future<int> updateTodo(ToDosTable todo) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        'todos',
        todo.toJson(),
        where: 'id = ?',
        whereArgs: [todo.id],
      );
    });
  }

  Future<int> deleteTodo(ToDosTable todo) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          'todos',
          where: 'id = ?',
          whereArgs: [todo.id],
        );
      },
    );
  }
}
