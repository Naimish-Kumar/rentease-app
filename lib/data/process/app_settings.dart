// import 'package:rentease/app/default_app_setting.dart';
// import 'package:rentease/utils/Queue/queue.dart';
// import 'package:rentease/utils/hive_keys.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';
//
// class AppSettingsLoadTask extends Task<bool> {
//   @override
//   Future<bool> process() async {
//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       Hive.init(directory.path);
//       await Hive.openBox(HiveKeys.userDetailsBox);
//       await Hive.openBox(HiveKeys.svgBox);
//       await Hive.openBox(HiveKeys.themeColorBox);
//       await LoadAppSettings().load(false);
//
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
// }
