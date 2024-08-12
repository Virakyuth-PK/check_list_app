import 'package:check_list_app/core/util/app_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCustomSnackBar({
  required String title,
  required String message,
  Color? backgroundColor,
  Color? color,
  bool isError = false,
  IconData? icons = Icons.sms_outlined,
}) {
  if (isError) {
    icons = Icons.error_outline;
    color = Colors.red;
    backgroundColor = Colors.white;
  }
  Get.snackbar(title, message,
      backgroundColor: backgroundColor,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      colorText: color ?? Colors.white,
      icon: Icon(icons, color: color ?? Colors.white),
      margin: EdgeInsets.symmetric(vertical: 10.0.d, horizontal: 20.0.d));
}
