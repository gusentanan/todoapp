import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todoapp/presentation/themes/app_theme.dart';
import 'package:todoapp/presentation/widget/button.dart';
import 'package:todoapp/utils/helper.dart';

class MyBottomBar {
  static Widget BottomBarr({required VoidCallback? onTap}) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: Helper.getShadow(
            color: AppTheme.greyPrimary,
            blurRadius: 15,
            offset: const Offset(0, -4),
          ),
        ),
        child: MyPrimaryButton(
          onTap: onTap,
          text: 'Add new To Do',
        ),
      ),
    );
  }
}
