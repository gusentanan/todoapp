import 'package:equatable/equatable.dart';
import 'package:todoapp/data/models/todo_table.dart';

class TodoState extends Equatable {
  final List<ToDosTable> todos;

  const TodoState({
    required this.todos,
  });
  const TodoState.initial({
    this.todos = const [],
  });

  TodoState copyWith({
    List<ToDosTable>? todos,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object> get props => [todos];
}
