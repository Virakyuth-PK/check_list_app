import 'dart:math';

import 'package:check_list_app/core/const/app_color.dart';
import 'package:check_list_app/core/const/app_const.dart';
import 'package:check_list_app/core/util/app_text.dart';
import 'package:check_list_app/core/translate/app_locale.dart';
import 'package:check_list_app/core/util/app_style.dart';
import 'package:check_list_app/src/model/todo_model/todo_model.dart';
import 'package:check_list_app/src/module/home/state.dart';
import 'package:check_list_app/src/module/home/widget/todo_item_widget.dart';
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
