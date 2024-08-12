import 'app_ext.dart';
import 'package:flutter/material.dart';

getBoxDecoration({
  Color? background,
  Color? borderColor,
  bool hasShadow = false,
  bool hasBorder = false,
  BorderRadius? borderRadius,
  BoxShape? shape,
  bool shadowAngleTop = false,
}) =>
    BoxDecoration(
        color: background ?? Colors.white,
        shape: shape ?? BoxShape.rectangle,
        borderRadius: shape == null
            ? borderRadius ?? BorderRadius.circular(10.0.d)
            : null,
        boxShadow: hasShadow == true
            ? [
                BoxShadow(
                    color: const Color.fromRGBO(0, 0, 0, 0.15),
                    offset: Offset(0, shadowAngleTop ? -2 : 2),
                    blurRadius: 2)
              ]
            : null,
        border: hasBorder == true
            ? Border.all(
                color: borderColor ?? Colors.white.withOpacity(0.25), width: 1)
            : Border.all(color: Colors.transparent));

getPaddingScreen() => EdgeInsets.symmetric(horizontal: 30.0.d);

spaceV({double? size}) => SizedBox(height: size ?? 15.0.d);

spaceH({double? size}) => SizedBox(width: size ?? 10.0.d);
