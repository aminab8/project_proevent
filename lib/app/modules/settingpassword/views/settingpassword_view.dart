import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:proevent_project/app/modules/choose_page/views/choose_page_view.dart';
import 'package:proevent_project/app/modules/homeemployee/views/homeemployee_view.dart';
import 'package:proevent_project/app/modules/inforamtionadmin/views/inforamtionadmin_view.dart';
import 'package:proevent_project/app/modules/settings/views/settings_view.dart';

import '../controllers/settingpassword_controller.dart';

class SettingpasswordView extends GetView<SettingpasswordController> {
  const SettingpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                controller.newPassword.value = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Access the new password using controller.newPassword.value
                String newPassword = controller.newPassword.value;
                // Implement your logic to save or update the password
                print('New Password: $newPassword');

                // Navigate to the Home page
                Get.to(() => HomeemployeeView());
              },
              child: Text('Save Password'),
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
              Get.offAll(SettingsView());
              break;
          }
        },
      ),
    );
  }
}
