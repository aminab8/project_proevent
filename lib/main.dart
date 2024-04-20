import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proevent/app/data/services/theme.dart';
import 'package:proevent/app/data/services/theme_service.dart';

import 'app/data/db/db_helper.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  DBHelper.initDb();
  await GetStorage.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,


    );
  }
}







