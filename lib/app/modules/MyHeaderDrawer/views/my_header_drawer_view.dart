import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_header_drawer_controller.dart';

class MyHeaderDrawerView extends GetView<MyHeaderDrawerController> {
  const MyHeaderDrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('lib/assets/images/profile.png'),
                fit: BoxFit.contain, // ajustez en fonction de vos besoins
              ),
            ),),

        ],
      ),
    );
  }
}
