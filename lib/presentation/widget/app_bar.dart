import 'package:flutter/material.dart';
import 'package:todoapp/presentation/themes/app_theme.dart';
import 'package:todoapp/presentation/widget/k_text.dart';
import 'package:todoapp/presentation/widget/popup_menu.dart';

class MyAppBar {
  static PreferredSizeWidget AppBarr({
    Color? bgColor,
    required void Function(String) onFilterChanged,
  }) {
    return AppBar(
      actions: [
        PopUpMenu(menuList: [
          PopupMenuItem(
            child: ListTile(
              onTap: () => onFilterChanged('incomplete'),
              leading: const Icon(Icons.timer_outlined),
              title: const Ktext(text: 'Incomplete'),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              onTap: () => onFilterChanged('completed'),
              leading: const Icon(Icons.check_circle_outline_outlined),
              title: const Ktext(text: 'Completed'),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              onTap: () => onFilterChanged('all'),
              leading: const Icon(Icons.all_inbox),
              title: const Ktext(text: 'All'),
            ),
          ),
        ], icon: null),
      ],
      backgroundColor: bgColor ?? AppTheme.secondaryColor,
      elevation: 0.2,
      iconTheme: const IconThemeData(color: AppTheme.primaryText),
      title: const Ktext(
        text: 'To Do\'s App',
        fontFamily: 'Puritan',
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      centerTitle: true,
      toolbarHeight: 68,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromARGB(255, 232, 230, 230),
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
