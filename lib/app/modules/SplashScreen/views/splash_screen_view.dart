import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proevent/app/routes/app_pages.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 11), ((){
      Get.offAllNamed(Routes.LOGIN);
    }));
    return Scaffold(
    body: Container(
        child: SingleChildScrollView(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Lottie.asset('assets/animation/splashscreenn.json'),
       ],
     ),
    ),
    ),
    );
  }
}
