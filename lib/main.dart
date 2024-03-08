import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proevent_project/app/modules/loginadmin/views/loginadmin_view.dart';
import 'package:proevent_project/app/modules/registration/views/registration_view.dart';
import 'package:proevent_project/app/routes/app_pages.dart';
import 'app/modules/choose_page/views/choose_page_view.dart';



void main (){
  runApp( GetMaterialApp(
    title: "Weclome to our application ",
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,

  ));
}




