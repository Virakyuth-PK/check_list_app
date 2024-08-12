import 'package:get/get_navigation/src/root/internacionalization.dart';
import '../const/app_const.dart';
import 'app_locale.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      AppConst.khmerCode: {
        AppLocale.home: "ទំព័រដំបូង",
        AppLocale.todoList: "បញ្ជីការងារត្រូវធ្វើ",
        AppLocale.newTodo: "កិច្ចការថ្មី",
        AppLocale.title: "ចំណងជើង",
        AppLocale.description: "ការពិពណ៌នា",
        AppLocale.priorityLevel: "កម្រិតអាទិភាព",
        AppLocale.low: "ទាប",
        AppLocale.medium: "មធ្យម",
        AppLocale.high: "ខ្ពស់",
        AppLocale.high: "ខ្ពស់",
        AppLocale.markAsCompleted: "សម្គាល់ថាបានបញ្ចប់",
        AppLocale.date: "កាលបរិច្ឆេទ",
        AppLocale.graph: "ក្រាហ្វ",
        AppLocale.thisFieldIsRequired: "ចន្លោះនេះត្រូវតែបំពេញ។",
        AppLocale.noData: "មិនមានទិន្នន័យនៅឡើយទេ",
        AppLocale.all: "ទាំងអស់",
        AppLocale.open: "មិនហើយ",
        AppLocale.closed: "ហើយ",
      },
    };
  }
}
