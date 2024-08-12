import 'package:check_list_app/core/util/app_log.dart';
import 'package:check_list_app/src/model/todo_model/todo_model.dart';
import 'package:check_list_app/src/module/home/logic.dart';
import 'package:check_list_app/src/module/home/state.dart';
import 'package:check_list_app/src/module/widget/x_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flag/flag.dart';
import 'package:integration_test/integration_test.dart';

class AppConst {
  static const khmerCode = 'km';
  static const englishCode = 'en';
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('FloatingActionButton updates locale',
      (WidgetTester tester) async {
    xLog(message: "FloatingActionButton updates locale");
    // Arrange
    await tester.pumpWidget(
      GetMaterialApp(
        locale: const Locale(AppConst.englishCode),
        home: Scaffold(
          floatingActionButton: FloatingActionButton.small(
            key: const Key('updateLocale'),
            onPressed: () {
              if (Get.locale?.languageCode == AppConst.khmerCode) {
                Get.updateLocale(const Locale(AppConst.englishCode));
              } else {
                Get.updateLocale(const Locale(AppConst.khmerCode));
              }
            },
            child: Flag.fromCode(
              Get.locale?.languageCode == AppConst.khmerCode
                  ? FlagsCode.KH
                  : FlagsCode.US,
              borderRadius: 10,
              fit: BoxFit.fitWidth,
              flagSize: FlagSize.size_1x1,
            ),
          ),
        ),
      ),
    );

    // Assert initial locale is English
    expect(Get.locale?.languageCode, AppConst.englishCode);
    xPrettyLog(message: "Assert initial locale is English");

    // Act: Tap the FloatingActionButton to change the locale to Khmer
    await tester.tap(find.byKey(const Key('updateLocale')));
    await tester.pumpAndSettle();
    xPrettyLog(
        message: "Tap the FloatingActionButton to change the locale to Khmer");

    // Assert: The locale should now be Khmer
    expect(Get.locale?.languageCode, AppConst.khmerCode);
    xPrettyLog(message: "The locale should now be Khmer");

    // Act: Tap the FloatingActionButton to change the locale back to English
    await tester.tap(find.byKey(const Key('updateLocale')));
    await tester.pumpAndSettle();
    xPrettyLog(
        message:
            "Tap the FloatingActionButton to change the locale back to English");

    // Assert: The locale should now be English again
    expect(Get.locale?.languageCode, AppConst.englishCode);
    xPrettyLog(message: "The locale should now be English again");
  });

  testWidgets('New Todo button triggers the openTodoBottomSheet function',
      (WidgetTester tester) async {
    xLog(message: "New Todo button triggers the openTodoBottomSheet function");
    // Arrange
    final logic = HomeLogic();
    Get.put(logic);

    // Act
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: XButton(
            key: const Key('newTodo'),
            onPress: () => logic.openTodoBottomSheet(
              mode: ModeEnum.Create,
              todoItem: TodoModel(),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.blue.shade100),
              child: const Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'New Todo',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Assert - Before tap
    xPrettyLog(message: "Before tap");
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('New Todo'), findsOneWidget);

    // Tap the button and trigger a frame.
    await tester.tap(find.byKey(const Key('newTodo')));
    await tester.pumpAndSettle();
    xPrettyLog(message: "Tap the button and trigger a frame.");

    // Assert - After tap
    expect(logic.state.modeTodo, ModeEnum.Create);
    expect(logic.state.todoList.isNotEmpty, isTrue); // Ensure the item is added
  });
}
