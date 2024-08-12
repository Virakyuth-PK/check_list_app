import 'package:check_list_app/core/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

showLoading() => QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.loading,
      disableBackBtn: true,
    );

showSuccess() {
  Get.back();
  QuickAlert.show(
    context: Get.context!,
    type: QuickAlertType.success,
    autoCloseDuration: const Duration(milliseconds: 1500),
    disableBackBtn: true,
  );
}

showError() {
  Get.back();
  QuickAlert.show(
    context: Get.context!,
    type: QuickAlertType.error,
    autoCloseDuration: const Duration(milliseconds: 1500),
    disableBackBtn: true,
  );
}
