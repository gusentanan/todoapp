import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/presentation/widget/app_bar.dart';
import 'package:todoapp/presentation/widget/bottom_sheet.dart';
import 'package:todoapp/presentation/widget/k_text.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MyAppBar.AppBarr(
        onFilterChanged: (criteria) {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Ktext(
              text: 'No Task Available.',
              fontFamily: 'Puritan',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 112, 112, 112),
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
              child: const CustomBottomSheetTodo(),
            );
          },
        );
      }),
    );
  }
}
