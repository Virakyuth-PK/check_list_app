import 'package:check_list_app/core/app/app.dart';
import 'package:check_list_app/core/app/service.dart';
import 'package:check_list_app/core/util/app_log.dart';
import 'package:check_list_app/src/data/local/todo_local.dart';
import 'package:check_list_app/src/module/home/view.dart';
import 'package:check_list_app/src/module/home/widget/todo_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hive_test/hive_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quickalert/quickalert.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return '.';
      }
      return null;
    });
    await setUpTestHive();
    await initServices();
  });


  tearDown(() async {
    xLog(message: "tearDown()");
    await tearDownTestHive();
  });

  testWidgets(
      'Open MaterialModalBottomSheet on newTodo button tap and create a new todo',
      (WidgetTester tester) async {
    xLog(message: "Running App...");

    // Arrange
    await tester.pumpWidget(const App());
    xPrettyLog(message: "App is loaded.");

    // Finds the NEWTODO BUTTON
    final newTodo = find.byKey(const ValueKey('newTodo'));
    xPrettyLog(message: "Button new todo.");

    // Act
    await tester.tap(newTodo);
    await tester
        .pumpAndSettle(); // Wait for the bottom sheet animation to complete
    xPrettyLog(
        message: "New todo tapped, waiting for ModalBottomSheet to appear.");

    // Verify that the TodoModalBottomSheet is displayed
    expect(find.byType(TodoModalBottomSheet), findsOneWidget);
    xPrettyLog(message: "TodoModalBottomSheet widget is displayed.");

    // Verify that the title and description fields are present with the correct initial values
    var titleField = find.byKey(const ValueKey('title'));
    var descriptionField = find.byKey(const ValueKey('description'));
    expect(titleField, findsOneWidget);
    expect(descriptionField, findsOneWidget);

    // Enter text into the title field
    await tester.enterText(titleField, 'Test Todo Title');
    xPrettyLog(message: "Entered text into title field.");

    // Enter text into the description field (optional)
    await tester.enterText(descriptionField, 'Test Todo Description');
    xPrettyLog(message: "Entered text into description field.");

    // Tap on the 'Completed' button
    var isCompleteButton = find.byKey(const ValueKey('isCompleted'));
    await tester.tap(isCompleteButton);
    await tester.pump(); // Rebuild after the state changes

    // Verify that the 'Completed' button now shows as checked
    expect(find.byIcon(Icons.check_circle), findsOneWidget);

    // Tap on the 'Priority' button
    var isPriorityButton = find.byKey(const ValueKey('isPriority'));
    await tester.tap(isPriorityButton);
    await tester.pump(); // Rebuild after the state changes

    // Verify that the 'Priority' button now shows as filled
    expect(find.byIcon(Icons.star_rounded), findsOneWidget);

    // Verify that the "Create" button is present and tap it
    var insertTodoButton = find.byKey(const ValueKey('insertTodoButton'));
    expect(insertTodoButton, findsOneWidget);
    xPrettyLog(message: "Found insertTodoButton, tapping it.");

    await tester.tap(insertTodoButton);
    await tester.pumpAndSettle(); // Wait for the button action to complete

    // Wait for auto close duration (1500ms) to ensure the dialog disappears as expected
    await tester.pumpAndSettle(const Duration(milliseconds: 1500));
    expect(find.byType(QuickAlert), findsNothing); // Verify dialog is closed

    // Now, verify that the todo item was saved locally
    var todoLocal =
        Get.find<TodoLocal>(); // Assuming TodoLocal is a GetxService or similar
    var result = await todoLocal.getData();
    expect(result.length, 1); // Verify there's exactly 1 item
    expect(result[0].title,
        'Test Todo Title'); // Verify the title of the stored item
    xPrettyLog(message: "Verified that the todo item was saved locally.");
  });
}
