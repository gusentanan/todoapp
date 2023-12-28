import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/models/todo_table.dart';
import 'package:todoapp/presentation/widget/button.dart';
import 'package:todoapp/presentation/widget/k_text.dart';
import 'package:todoapp/providers/todo_provider.dart';

class CustomBottomSheetTodo extends ConsumerStatefulWidget {
  final ToDosTable? todo;
  final void Function()? onPressedCreate;
  final void Function()? onPressedCancel;

  const CustomBottomSheetTodo(
      {Key? key,
      required this.todo,
      this.onPressedCreate,
      this.onPressedCancel})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTodoScreenState();
}

class _CreateTodoScreenState extends ConsumerState<CustomBottomSheetTodo> {
  final TextEditingController _titleController = TextEditingController();
  late bool _isEditMode;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.todo != null;
    _titleController.text = widget.todo?.title ?? '';
    _titleController.selection = TextSelection.fromPosition(
      TextPosition(offset: _titleController.text.length),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                        )
                      ],
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.note_alt_outlined,
                      color: Color.fromARGB(255, 143, 128, 128),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Ktext(
                      text: 'New task',
                      fontFamily: 'Puritan',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  focusNode: focusNode,
                  maxLines: null,
                  controller: _titleController,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue, // Border color when focused
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: false,
                    hintText: 'What are you planning?',
                  ),
                  onChanged: (value) {
                    if (!_isEditMode) {
                      _titleController.text = value;
                    }
                  },
                  onTapOutside: (event) {
                    focusNode.unfocus();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: MyPrimaryButton(
                      text: "Cancel",
                      onTap: () {
                        Navigator.pop(context);
                      },
                      isSecondary: true,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MyPrimaryButton(
                      text: _isEditMode ? "Update" : "Create",
                      onTap: () {
                        _createOrUpdateTask();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _createOrUpdateTask() async {
    final title = _titleController.text.trim();

    if (title.isNotEmpty) {
      if (widget.todo == null) {
        // Create a new task if widget.todo is null
        final todo = ToDosTable(
          title: title,
          isCompleted: false,
        );
        await ref.read(todoProvider.notifier).createToDosTable(todo);
      } else {
        await ref
            .read(todoProvider.notifier)
            .updateToDosTable(widget.todo!.copyWith(title: title));
      }
    }
  }
}
