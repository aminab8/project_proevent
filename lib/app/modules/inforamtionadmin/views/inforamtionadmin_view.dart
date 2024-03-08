import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:proevent_project/app/modules/addevents/views/addevents_view.dart';
import 'package:proevent_project/app/modules/choose_page/views/choose_page_view.dart';
import 'package:proevent_project/app/modules/settings/views/settings_view.dart';

import '../controllers/inforamtionadmin_controller.dart';

class InforamtionadminView extends GetView<InforamtionadminController> {
  final String email;
  final String password;
    InforamtionadminView(  {Key? key, required this.password, required this.email}) : super(key: key);

  final InforamtionadminController controller = Get.put(InforamtionadminController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    controller.setEmail(email);
    controller.setPassword(password);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'email  : ${controller.email}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          height: 10,
                        ),
                      ),
                      Text(
                        'password  : ${controller.password}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          height: 10,
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offAll(ChoosePageView());
              break;
            case 1:
              Get.offAll(AddeventsView());
              break;
            case 2:
              Get.offAll(SettingsView());
              break;
          }
        },
      ),
    );
  }
}
