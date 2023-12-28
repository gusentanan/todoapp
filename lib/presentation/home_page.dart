import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/models/todo_table.dart';
import 'package:todoapp/presentation/widget/app_bar.dart';
import 'package:todoapp/presentation/widget/bottom_bar.dart';
import 'package:todoapp/presentation/widget/bottom_sheet.dart';
import 'package:todoapp/presentation/widget/k_text.dart';
import 'package:todoapp/presentation/widget/todo_block.dart';
import 'package:todoapp/providers/todo_provider.dart';

final filterCriteriaProvider = StateProvider<String>((ref) => 'all');

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterCriteria = ref.watch(filterCriteriaProvider);

    return Scaffold(
      appBar: MyAppBar.AppBarr(
        onFilterChanged: (criteria) {
          ref.read(filterCriteriaProvider.notifier).update((state) => criteria);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            filteredToDosTable(filterCriteria, ref).isEmpty
                ? const SizedBox(
                    height: 600,
                    child: Align(
                      alignment: Alignment.center,
                      child: Ktext(
                        text: 'No Task Available.',
                        fontFamily: 'Puritan',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 112, 112, 112),
                      ),
                    ))
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: filteredToDosTable(filterCriteria, ref).length,
                    itemBuilder: (context, index) {
                      final todo =
                          filteredToDosTable(filterCriteria, ref)[index];

                      return TaskBlock(
                        todo: todo,
                        onCompleted: (value) async {
                          ref
                              .read(todoProvider.notifier)
                              .updateToDosTable(todo);
                        },
                        onDelete: () async {
                          await ref
                              .read(todoProvider.notifier)
                              .deleteToDosTable(todo);
                        },
                        onToDoTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: CustomBottomSheetTodo(
                                  todo: todo,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomBar.BottomBarr(onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const CustomBottomSheetTodo(
                todo: null,
              ),
            );
          },
        );
      }),
    );
  }

  List<ToDosTable> filteredToDosTable(String filterCriteria, WidgetRef ref) {
    final todoState = ref.watch(todoProvider);
    switch (filterCriteria) {
      case 'completed':
        return _compltedToDosTable(todoState.todos, ref);
      case 'incomplete':
        return _incompltedToDosTable(todoState.todos, ref);
      case 'all':
      default:
        return todoState.todos;
    }
  }

  List<ToDosTable> _incompltedToDosTable(
      List<ToDosTable> todos, WidgetRef ref) {
    final List<ToDosTable> filteredToDosTable = [];

    for (var todo in todos) {
      if (!todo.isCompleted) {
        filteredToDosTable.add(todo);
      }
    }
    return filteredToDosTable;
  }

  List<ToDosTable> _compltedToDosTable(List<ToDosTable> todos, WidgetRef ref) {
    final List<ToDosTable> filteredToDosTable = [];

    for (var todo in todos) {
      if (todo.isCompleted) {
        filteredToDosTable.add(todo);
      }
    }
    return filteredToDosTable;
  }
}
