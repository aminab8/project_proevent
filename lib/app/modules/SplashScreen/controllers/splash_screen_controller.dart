
import 'dart:ffi';

import 'package:get/get.dart';



class SplashScreenController extends GetxController {
  RxDouble width = 50.0.obs;
  RxDouble height  = 50.0.obs;
  RxDouble mWidth = 0.0.obs;
  RxDouble mFontSize  = 0.0.obs;
  RxDouble footerWidth = 100.0.obs;
  RxDouble footerMargin = 100.0.obs;
  RxDouble footerFontsSize = 20.0.obs;
  final count = 0.obs;

  @override
   onInit() {
    Future.delayed(Duration(seconds: 2),(){
      width.value = 150;
      height.value= 150;
    });
    Future.delayed(Duration(seconds: 1),(){
      width.value = 90 ;
      mFontSize.value = 100 ;
    });
    Future.delayed(Duration(seconds: 1),(){
      footerWidth.value = 100.0.obs as double;
      footerFontsSize.value = 20;
      footerMargin.value = 0;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
