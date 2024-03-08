import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../model/employee.dart';
import '../controllers/homeemployee_controller.dart';

class HomeemployeeView extends GetView<HomeemployeeController> {
   HomeemployeeView({Key? key}) : super(key: key);
   final  HomeemployeeController controller = Get.put(HomeemployeeController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Welcome to ProEvent'),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              controller.navigateToChoosePage();
              break;
            case 1:
              controller.navigateToSettingsPage();
              break;
          }
        },
      ),
    );
  }


}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page'),
    );
  }
}


