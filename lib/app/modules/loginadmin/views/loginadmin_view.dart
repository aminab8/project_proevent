import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:proevent_project/app/modules/choose_page/views/choose_page_view.dart';
import '../../../../component/mytextfield.dart';
import '../controllers/loginadmin_controller.dart';

class LoginadminView extends GetView<LoginadminController> {
   LoginadminView({Key? key}) : super(key: key);
   final LoginadminController controller = Get.put(LoginadminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.to(ChoosePageView());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              "Get Started !",
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: controller.emailController,
              hintText: 'Email : ',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: controller.passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: controller.login,
              child: Text("Login "),
            ),
          ],
        ),
      ),

    );
  }
}
