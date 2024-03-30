import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {

  @override
  void onInit() {
  // Votre code d'initialisation ici
  super.onInit(); // Appel facultatif si vous avez des besoins spécifiques
  }

  @override
  void onReady() {
  // Votre code à exécuter lorsque le contrôleur est prêt
  super.onReady(); // Appel facultatif si vous avez des besoins spécifiques
  }

  @override
  void onClose() {
  // Votre code de nettoyage ici
  super.onClose(); // Appel facultatif si vous avez des besoins spécifiques
  }
  }


    // Get.offNamed('/home', arguments: employee);
   // Get.to(HomeemployeeView());


  final count = 0.obs;

  void increment() => count.value++;

