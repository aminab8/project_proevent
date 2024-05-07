import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proevent/app/modules/BottomNavigationBar/views/bottom_navigation_bar_view.dart';

import '../controllers/settingpassword_controller.dart';

class SettingpasswordView extends GetView<SettingpasswordController> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(onPressed: () {
         Get.to((BottomNavigationBarView()));
        }, icon: Icon(CupertinoIcons.back),),
       ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
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
                Get.defaultDialog(
                    title: "Are you sure you want to change  your password ? ",
                    content: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              onPressed: (){
                                Get.back();
                              },
                              child: const Text("Cancle"),
                            ),
                            SizedBox(width: 30,),
                            ElevatedButton( onPressed: (){
                              Get.to(BottomNavigationBarView());
                            },
                              child: const Text("Save"),
                            ),

                          ],
                        )
                      ],
                    )
                );
                // Access the new password using controller.newPassword.value
                String newPassword = controller.newPassword.value;
                // Implement your logic to save or update the password
                print('New Password: $newPassword');
              },
              child: Text('Save Password'),
            ),
            Lottie.asset('assets/animation/change password.json',

            ),
          ],
        ),
      ),
      ),

    );
  }



}


