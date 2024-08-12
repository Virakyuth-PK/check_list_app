import 'package:check_list_app/core/translate/app_locale.dart';
import 'package:check_list_app/core/util/app_alert.dart';
import 'package:check_list_app/core/util/app_ext.dart';
import 'package:check_list_app/core/util/app_log.dart';
import 'package:check_list_app/src/data/local/todo_local.dart';
import 'package:check_list_app/src/model/todo_model/todo_model.dart';
import 'package:check_list_app/src/module/widget/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quickalert/quickalert.dart';

import 'state.dart';
import 'view.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  final TodoLocal _todoLocal = Get.find<TodoLocal>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await 1.delay();
    await onRefresh();
  }

  openTodoBottomSheet(
      {required ModeEnum mode, required TodoModel todoItem}) async {
    if (mode == ModeEnum.Create) {
      //region Create Todo
      todoItem = TodoModel(
        createdDate: DateTime.now(),
        updatedDate: DateTime.now(),
      );
      state.modeTodo = mode;
      //endregion
    } else if (mode == ModeEnum.Update) {
      state.modeTodo = mode;
    }
    update();

    //region Open Todo
    showMaterialModalBottomSheet(
        context: Get.context!,
        builder: (context) => TodoModalBottomSheet(todoItem: todoItem),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(20..d),
          topLeft: Radius.circular(20..d),
        )));
    //endregion
  }

  insertTodo(TodoModel todoItem) async {
    try {
      if ((todoItem.title ?? "") == "") {
        showCustomSnackBar(
          title: AppLocale.title.tr,
          message: AppLocale.thisFieldIsRequired.tr,
          isError: true,
        );
        return;
      }
      showLoading();
      await TodoLocal().setData(todoItem);
      Get.back();
      await showSuccess();
      await onRefresh();
    } catch (e) {
      await showError();
      xPrettyLog(message: "insertTodo() : $e");
    }
  }

  deleteTodo(TodoModel todoItem) async {
    try {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.warning,
        title: AppLocale.delete.tr,
        showCancelBtn: true,
        showConfirmBtn: true,
        onConfirmBtnTap: () async {
          Get.back();
          showLoading();
          await TodoLocal().deleteData(todoItem);
          Get.back();
          await showSuccess();
          await onRefresh();
        },
      );
    } catch (e) {
      await showError();
      xPrettyLog(message: "deleteTodo() : $e");
    }
  }

  onRefresh() async {
    try {
      var result = await _todoLocal.getData();
      var resultFilter = <TodoModel>[];
      switch (state.statusTodo.value) {
        case StatusTodoEnum.All:
          {
            resultFilter = result;
            break;
          }
        case StatusTodoEnum.Open:
          {
            resultFilter = result
                .where((element) => element.isCompleted == false)
                .toList();
            break;
          }
        case StatusTodoEnum.Closed:
          {
            resultFilter = result
                .where(
                  (element) => element.isCompleted == true,
                )
                .toList();
            break;
          }
      }
      state.todoList.clear();
      state.todoList.addAllIf(result.isNotEmpty, resultFilter);
      if (state.isDesc.value == true) {
        state.todoList = state.todoList.reversed.toList();
      }
      update();
    } catch (e) {
      await showError();
      xPrettyLog(message: "onRefresh() : $e");
    }
  }
}
