import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../local_config/hive_manager.dart';

initServices() async {
  await Get.put(HiveManager.init(), permanent: true);
  // Initialize date formatting for the desired locale(s)
  await initializeDateFormatting('en_US', null);
  await initializeDateFormatting('km', null);
}
