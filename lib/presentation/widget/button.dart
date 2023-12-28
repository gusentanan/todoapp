import 'package:flutter/material.dart';
import 'package:todoapp/presentation/themes/app_theme.dart';
import 'package:todoapp/presentation/widget/k_text.dart';
import 'package:todoapp/utils/helper.dart';

class MyPrimaryButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final bool isSecondary;

  MyPrimaryButton({
    Key? key,
    this.onTap,
    this.text,
    this.isSecondary = false, // Default value is false for primary button
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSecondary ? Colors.white : AppTheme.bluePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: Helper.getRadius(20),
          side: BorderSide(
              color: isSecondary
                  ? AppTheme.bluePrimary
                  : Colors.transparent), // Add outline for secondary button
        ),
        minimumSize: const Size(120, 0),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        elevation: 0,
      ),
      child: Ktext(
        text: text,
        fontFamily: 'Puritan',
        fontSize: 16,
        color: isSecondary ? AppTheme.bluePrimary : Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
