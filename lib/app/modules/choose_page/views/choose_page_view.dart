import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/choose_page_controller.dart';

class ChoosePageView extends GetView<ChoosePageController> {
   ChoosePageView({Key? key}) : super(key: key);

  final  ChoosePageController  controller = Get.put(ChoosePageController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 100),
        color: Colors.blue,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcome to our application",
                style: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: ElevatedButton(
                onPressed: () => controller.navigateToAdminPage(),
                child: Text(
                  " Super Admin",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: ElevatedButton(
                onPressed: () => controller.navigateToEmployeePage(),
                child: Text(
                  "Employee",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
