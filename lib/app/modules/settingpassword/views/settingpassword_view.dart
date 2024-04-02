import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settingpassword_controller.dart';

class SettingpasswordView extends GetView<SettingpasswordController> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Settings'),
      //   leading: IconButton(onPressed: () {
      //    Get.to((BottomNavigationBarView()));
      //   }, icon: Icon(CupertinoIcons.back),),
       ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextField(
              onChanged: (value) {
                controller.newPassword.value = value;
              },
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
            ),
            TextField(
              onChanged: (value) {
                controller.newPassword.value = value;
              },
              obscureText: false,
              decoration: InputDecoration(
                labelText: ' Confirm New Password',
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Access the new password using controller.newPassword.value
                String newPassword = controller.newPassword.value;
                // Implement your logic to save or update the password
                print('New Password: $newPassword');



              },
              child: Text('Save Password'),
            ),

          ],
        ),
      ),

    );
  }



}
