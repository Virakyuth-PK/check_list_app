
import 'package:check_list_app/core/util/app_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/const/app_color.dart';
import '../../../../core/util/app_style.dart';
import '../../../../core/util/app_text.dart';
import '../../../model/todo_model/todo_model.dart';
import '../../widget/x_button.dart';
import '../logic.dart';
import '../state.dart';

class TodoItemWidget extends StatelessWidget {
  TodoItemWidget({
    super.key,
    required this.item,
  });

  final TodoModel item;
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        XButton(
          onPress: () async =>
              logic.openTodoBottomSheet(mode: ModeEnum.Update, todoItem: item),
          child: Container(
            decoration:
            getBoxDecoration(background: Colors.white, hasShadow: true),
            padding: EdgeInsets.all(10..d),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title ?? "",
                              style: textDisplayMedium(),
                            ),
                            spaceV(),
                            Text(item.description ?? "",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: textDisplaySmall(color: Colors.grey)),
                          ]),
                    ),
                    SizedBox(
                      width: 20..d,
                    )
                  ],
                ),
                spaceV(size: 5..d),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (item.createdDate != null)
                      Text(
                        item.createdDate.formatTimeToString,
                        style: textDisplaySuperSmall(color: Colors.grey),
                      ),
                    const SizedBox()
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 10..d,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              XButton(
                onPress: () async {
                  item.isCompleted = !item.isCompleted;
                  logic.update();
                  await logic.insertTodo(item);
                },
                child: Padding(
                  padding: EdgeInsets.all(5..d),
                  child: Icon(
                    item.isCompleted == true
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    size: 25..d,
                    color:
                    item.isCompleted == true ? primaryColor : Colors.grey,
                  ),
                ),
              ),
              spaceV(size: 20..d),
              XButton(
                onPress: () async {
                  item.isPriority = !item.isPriority;
                  logic.update();
                  await logic.insertTodo(item);
                },
                child: Padding(
                  padding: EdgeInsets.all(5..d),
                  child: Icon(
                    item.isPriority == true
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    size: 25..d,
                    color: item.isPriority == true ? primaryColor : Colors.grey,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

