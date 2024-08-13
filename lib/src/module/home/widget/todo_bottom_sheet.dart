
import 'package:check_list_app/core/util/app_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/const/app_color.dart';
import '../../../../core/translate/app_locale.dart';
import '../../../../core/util/app_style.dart';
import '../../../../core/util/app_text.dart';
import '../../../model/todo_model/todo_model.dart';
import '../../widget/x_button.dart';
import '../../widget/x_label.dart';
import '../../widget/x_text_field.dart';
import '../logic.dart';
import '../state.dart';

class TodoModalBottomSheet extends StatelessWidget {
  TodoModalBottomSheet({
    super.key,
    required this.todoItem,
  });

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;
  TodoModel? todoItem;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(builder: (logic) {
      var enable = (state.modeTodo == ModeEnum.Create ||
          state.modeTodo == ModeEnum.Update)
          ? true
          : false;
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: 500..d,
          width: Get.width,
          padding: EdgeInsets.all(20..d),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    XButton(
                      enable: enable,
                      key: const ValueKey("isCompleted"),
                      onPress: () {
                        todoItem?.isCompleted =
                        !(todoItem?.isCompleted ?? false);
                        logic.update();
                      },
                      child: Icon(
                        todoItem?.isCompleted == true
                            ? Icons.check_circle
                            : Icons.circle_outlined,
                        size: 25..d,
                        color: todoItem?.isCompleted == true
                            ? primaryColor
                            : Colors.grey,
                      ),
                    ),
                    spaceH(),
                    Builder(builder: (context) {
                      var text = "";
                      if (state.modeTodo == ModeEnum.Create) {
                        text = AppLocale.newTodo.tr;
                      } else if (state.modeTodo == ModeEnum.Update) {
                        text = AppLocale.editTodo.tr;
                      } else {
                        text = AppLocale.todo.tr;
                      }
                      return Text(text,
                          style: textDisplaySmall(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ));
                    })
                  ]),
                  Row(
                    children: [
                      XButton(
                        key: const ValueKey("isPriority"),
                        enable: enable,
                        onPress: () {
                          todoItem?.isPriority =
                          !(todoItem?.isPriority ?? false);
                          logic.update();
                        },
                        child: Icon(
                          todoItem?.isPriority == true
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          size: 25..d,
                          color: todoItem?.isPriority == true
                              ? primaryColor
                              : Colors.grey,
                        ),
                      ),
                      if (state.modeTodo == ModeEnum.Update)
                        Row(
                          children: [
                            spaceH(),
                            XButton(
                              key: const ValueKey("deleteTodo"),
                              onPress: () async =>
                              await logic.deleteTodo(todoItem!),
                              child: Icon(
                                Icons.delete_forever_outlined,
                                size: 25..d,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ],
              ),
              spaceV(size: 30..d),
              XLabel(
                label: AppLocale.title.tr,
                require: true,
                child: XTextField(
                  enable: enable,
                  key: const ValueKey("title"),
                  onChanged: (value) => todoItem?.title = value,
                  initialValue: todoItem?.title,
                  hintText: AppLocale.title.tr,
                  maxLines: 1,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
              ),
              spaceV(),
              XLabel(
                label: AppLocale.description.tr,
                child: XTextField(
                  enable: enable,
                  key: const ValueKey("description"),
                  onChanged: (value) => todoItem?.description = value,
                  initialValue: todoItem?.description,
                  hintText: AppLocale.description.tr,
                  maxLines: 5,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                ),
              ),
              const Spacer(),
              XButton(
                key: const ValueKey("insertTodoButton"),
                enable: enable,
                onPress: () async => await logic.insertTodo(todoItem!),
                child: Container(
                  decoration: getBoxDecoration(background: primaryColor),
                  padding: EdgeInsets.all(10..d),
                  child: Center(
                    child: Builder(builder: (context) {
                      var text = "";
                      if (state.modeTodo == ModeEnum.Create) {
                        text = AppLocale.create.tr;
                      } else if (state.modeTodo == ModeEnum.Update) {
                        text = AppLocale.edit.tr;
                      }
                      return Text(text,
                          style: textDisplaySmall(color: Colors.white));
                    }),
                  ),
                ),
              ),
              spaceV(),
            ],
          ),
        ),
      );
    });
  }
}