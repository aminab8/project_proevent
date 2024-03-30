import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proevent_project/app/routes/app_pages.dart';
void main() {
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

    );
  }
}





