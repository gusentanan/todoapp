import 'package:flutter/material.dart';
import 'package:todoapp/presentation/themes/app_theme.dart';

class PopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  const PopUpMenu({super.key, required this.menuList, required this.icon});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: AppTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        itemBuilder: ((context) => menuList),
        icon: icon);
  }
}
