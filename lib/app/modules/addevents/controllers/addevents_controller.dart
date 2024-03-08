import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddeventsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final eventNameController = TextEditingController();
  final deptController = TextEditingController();
  final lieuController = TextEditingController();
  final dateController = TextEditingController();
  var selectedTypeEvents = 'Conferences'.obs;

  void onSubmit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final eventName = eventNameController.text;
      final dept = deptController.text;
      final lieu = lieuController.text;
      final date = dateController.text;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(("Envoi en cours ..."))),
      );
      FocusScope.of(context).requestFocus(FocusNode());
      print("ajouter l evenment $eventName en sépcifiant nom departement $dept par le lieu $lieu et la date $date");
      print("type d events $selectedTypeEvents");
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
