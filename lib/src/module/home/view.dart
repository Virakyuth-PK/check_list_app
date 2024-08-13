import 'dart:math';

import 'package:check_list_app/core/const/app_color.dart';
import 'package:check_list_app/core/const/app_const.dart';
import 'package:check_list_app/core/util/app_text.dart';
import 'package:check_list_app/core/translate/app_locale.dart';
import 'package:check_list_app/core/util/app_style.dart';
import 'package:check_list_app/src/model/todo_model/todo_model.dart';
import 'package:check_list_app/src/module/home/state.dart';
import 'package:check_list_app/src/module/widget/x_button.dart';
import 'package:check_list_app/src/module/widget/x_label.dart';
import 'package:check_list_app/src/module/widget/x_text_field.dart';
import 'package:flag/flag.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../core/util/app_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      floatingActionButton: FloatingActionButton.small(
        shape: const CircleBorder(),
        key: const Key('updateLocale'),
        onPressed: () {
          if (Get.locale?.languageCode == AppConst.khmerCode) {
            Get.updateLocale(Locale(AppConst.englishCode));
          } else {
            Get.updateLocale(Locale(AppConst.khmerCode));
          }
        },
        child: Flag.fromCode(
          Get.locale?.languageCode == AppConst.khmerCode
              ? FlagsCode.KH
              : FlagsCode.US,
          borderRadius: 30.0.d,
          fit: BoxFit.fitWidth,
          flagSize: FlagSize.size_1x1,
        ),
      ),
      body: GetBuilder<HomeLogic>(
          builder: (logic) => RefreshIndicator(
                onRefresh: () async => await logic.onRefresh(),
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      pinned: true,
                      expandedHeight: kToolbarHeight + 60
                        ..d,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding:
                            EdgeInsets.only(left: 20..d, bottom: 30..d),
                        title: Text(AppLocale.todoList.tr,
                            style: textDisplayMedium(color: primaryColor)),
                        background: SizedBox(
                          height: kToolbarHeight + 60
                            ..d,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: kToolbarHeight + 30.0.d,
                                  left: 20..d,
                                ),
                                child: Text(DateTime.now().formatDayToString,
                                    style:
                                        textDisplaySmall(color: Colors.grey)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: kToolbarHeight - 10
                                    ..d,
                                  right: 20..d,
                                ),
                                child: XButton(
                                    key: const Key('newTodo'),
                                    onPress: () => logic.openTodoBottomSheet(
                                          mode: ModeEnum.Create,
                                          todoItem: TodoModel(),
                                        ),
                                    child: Container(
                                      padding: EdgeInsets.all(10..d),
                                      decoration: getBoxDecoration(
                                          background: primaryColor.shade100),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 15..d,
                                            color: primaryColor,
                                          ),
                                          spaceH(),
                                          Text(
                                            AppLocale.newTodo.tr,
                                            style: textDisplaySuperSmall(
                                                color: primaryColor),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: spaceV()),
                    SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.d),
                        sliver: SliverToBoxAdapter(
                          child: Obx(() => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      XButton(
                                          onPress: () async {
                                            state.statusTodo.value =
                                                StatusTodoEnum.All;
                                            await logic.onRefresh();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(10..d),
                                            child: Text(
                                              AppLocale.all.tr,
                                              style: textDisplaySmall(
                                                  color:
                                                      state.statusTodo.value ==
                                                              StatusTodoEnum.All
                                                          ? primaryColor
                                                          : Colors.grey),
                                            ),
                                          )),
                                      XButton(
                                          onPress: () async {
                                            state.statusTodo.value =
                                                StatusTodoEnum.Open;
                                            await logic.onRefresh();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(10..d),
                                            child: Text(
                                              AppLocale.open.tr,
                                              style: textDisplaySmall(
                                                  color: state.statusTodo
                                                              .value ==
                                                          StatusTodoEnum.Open
                                                      ? primaryColor
                                                      : Colors.grey),
                                            ),
                                          )),
                                      XButton(
                                          onPress: () async {
                                            state.statusTodo.value =
                                                StatusTodoEnum.Closed;
                                            await logic.onRefresh();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(10..d),
                                            child: Text(
                                              AppLocale.closed.tr,
                                              style: textDisplaySmall(
                                                  color: state.statusTodo
                                                              .value ==
                                                          StatusTodoEnum.Closed
                                                      ? primaryColor
                                                      : Colors.grey),
                                            ),
                                          )),
                                    ],
                                  ),
                                  XButton(
                                      onPress: () async {
                                        state.isDesc.toggle();
                                        await logic.onRefresh();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(10..d),
                                        child: Obx(() => Row(
                                              children: [
                                                Text(AppLocale.date.tr,
                                                    style:
                                                        textDisplaySuperSmall(
                                                            color: Colors
                                                                .grey[400])),
                                                Icon(
                                                  state.isDesc.value == true
                                                      ? Icons
                                                          .keyboard_arrow_down_rounded
                                                      : Icons
                                                          .keyboard_arrow_up_rounded,
                                                  size: 20..d,
                                                  color: Colors.grey[400],
                                                ),
                                              ],
                                            )),
                                      ))
                                ],
                              )),
                        )),
                    if (state.statusTodo.value == StatusTodoEnum.All &&
                        state.todoList.isNotEmpty)
                      SliverToBoxAdapter(
                          child: Column(
                        children: [
                          spaceV(),
                          Container(
                            decoration: getBoxDecoration(
                                background: Colors.white, hasShadow: true),
                            padding: EdgeInsets.all(10..d),
                            margin: EdgeInsets.only(
                                left: 10..d, right: 10..d, bottom: 5..d),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppLocale.graph.tr,
                                        style: textDisplaySmall(
                                            color: primaryColor)),
                                    spaceV(),
                                    SizedBox(
                                      width: Get.width * 0.6,
                                      child: SfLinearGauge(
                                        minimum: 0.0,
                                        maximum:
                                            state.todoList.length.toDouble(),
                                        showTicks: false,
                                        showLabels: false,
                                        animateAxis: true,
                                        axisTrackStyle: LinearAxisTrackStyle(
                                          thickness: 10..d,
                                          edgeStyle: LinearEdgeStyle.bothCurve,
                                          borderWidth: 1,
                                          borderColor: Colors.grey[350],
                                          color: Colors.grey[350],
                                        ),
                                        barPointers: <LinearBarPointer>[
                                          LinearBarPointer(
                                              value: state.todoList
                                                  .where((element) =>
                                                      element.isCompleted ==
                                                      true)
                                                  .toList()
                                                  .length
                                                  .toDouble(),
                                              thickness: 10..d,
                                              edgeStyle:
                                                  LinearEdgeStyle.bothCurve,
                                              color: primaryColor),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                    "${state.todoList.where((element) => element.isCompleted == true).toList().length}/${state.todoList.length}",
                                    style:
                                        textDisplaySmall(color: primaryColor))
                              ],
                            ),
                          )
                        ],
                      )),
                    if (state.todoList.isNotEmpty) ...[
                      SliverPadding(
                        padding: EdgeInsets.all(10..d),
                        sliver: SliverList.separated(
                          itemCount: state.todoList.length,
                          itemBuilder: (context, index) =>
                              TodoItemWidget(item: state.todoList[index]),
                          separatorBuilder: (context, index) => spaceV(),
                        ),
                      ),
                      SliverToBoxAdapter(child: spaceV(size: 60.0.d)),
                    ] else ...[
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: Get.height * 0.75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.playlist_remove_rounded,
                                  size: 30..d, color: primaryColor),
                              spaceV(),
                              Text(AppLocale.noData.tr,
                                  style: textDisplaySmall(color: primaryColor)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ],
                ),
              )),
    );
  }
}

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
