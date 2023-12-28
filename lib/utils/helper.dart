import 'package:flutter/material.dart';
import 'package:todoapp/presentation/themes/app_theme.dart';
import 'package:todoapp/presentation/widget/k_text.dart';

class Helper {
  static List<BoxShadow> getShadow({
    Color? color,
    BlurStyle? blurStyle,
    double? blurRadius,
    double? spreadRadius,
    Offset? offset,
  }) {
    return [
      BoxShadow(
        color: color ?? Colors.black.withOpacity(.1),
        blurRadius: blurRadius ?? 5,
        offset: offset ?? const Offset(1.0, 5.0),
        blurStyle: blurStyle ?? BlurStyle.normal,
        spreadRadius: spreadRadius ?? 1,
      )
    ];
  }

  static BorderRadiusGeometry getRadius(
    double radius, {
    bool? isAll = true,
    double? radiusTopRight = 0.0,
    double? radiusBottomRight = 0.0,
    double? radiusBottomLeft = 0.0,
  }) {
    return isAll == true
        ? BorderRadius.all(Radius.circular(radius))
        : BorderRadius.only(
            topLeft: Radius.circular(radius),
            bottomLeft: Radius.circular(radiusBottomLeft!),
            bottomRight: Radius.circular(radiusBottomRight!),
            topRight: Radius.circular(radiusTopRight!),
          );
  }

  static displaySnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Ktext(
          text: message,
          fontFamily: 'Puritan',
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
    );
  }
}
