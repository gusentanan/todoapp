import 'package:equatable/equatable.dart';
import 'package:todoapp/utils/todo_keys.dart';

class ToDosTable extends Equatable {
  final int? id;
  final String title;
  final bool isCompleted;

  const ToDosTable({
    this.id,
    required this.title,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ToDoKeys.id: id,
      ToDoKeys.title: title,
      ToDoKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory ToDosTable.fromJson(Map<String, dynamic> map) {
    return ToDosTable(
      id: map[ToDoKeys.id],
      title: map[ToDoKeys.title],
      isCompleted: map[ToDoKeys.isCompleted] == 1 ? true : false,
    );
  }

  @override
  List<Object> get props {
    return [
      title,
      isCompleted,
    ];
  }

  ToDosTable copyWith({
    int? id,
    String? title,
    bool? isCompleted,
  }) {
    return ToDosTable(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
