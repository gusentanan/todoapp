import 'package:flutter/material.dart';
import 'package:todoapp/presentation/data/models/todo_table.dart';
import 'package:todoapp/presentation/themes/app_theme.dart';
import 'package:todoapp/presentation/widget/k_text.dart';

class TaskBlock extends StatelessWidget {
  final ToDosTable todo;
  final Function(bool?)? onCompleted;
  final VoidCallback onToDoTap;
  final VoidCallback onDelete;

  const TaskBlock({
    Key? key,
    required this.todo,
    required this.onToDoTap,
    required this.onCompleted,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToDoTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        color: AppTheme.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                children: [
                  Checkbox(
                    activeColor: const Color.fromARGB(255, 161, 161, 161),
                    value: todo.isCompleted,
                    onChanged: onCompleted,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Ktext(
                    text: todo.title,
                    color: todo.isCompleted
                        ? Color.fromARGB(255, 167, 167, 167)
                        : AppTheme.primaryText,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 224, 92, 83),
                    width: 0.5, // Adjust the width of the border as needed
                  ),
                ),
                child: IconButton(
                  iconSize: 24.0,
                  color: const Color.fromARGB(255, 224, 92, 83),
                  onPressed: () {
                    onDelete();
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
