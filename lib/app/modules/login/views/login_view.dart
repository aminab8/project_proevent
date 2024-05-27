import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lottie/lottie.dart';

import '../../../../component/authtextfromfield.dart';

import '../../BottomNavigationBar/views/bottom_navigation_bar_view.dart';
import '../../registration/views/registration_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(

          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Lottie.asset(
                      'assets/animation/login.json',
                      height: 300,
                      repeat: true,
                      reverse: true,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 50),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child:
                              Obx(
                                    () => AuthTextFromField(
                                controller:emailController,
                                obscureText: !controller.isPasswordHidden.value,
                                validator: controller.validateEmail,
                                prefixIcon: Icon(
                                  CupertinoIcons.mail,
                                  color: Colors.purple,
                                  size: 30,
                                ),
                                hintText: "E-mail",
                                 obscuredText: false,
                              ),
                            ),
                          ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child:
                              Obx(
                                    () =>
                                    AuthTextFromField(
                                controller: passwordController,
                                obscureText: controller.isPasswordHidden.value,
                                validator: controller.validatePassword,
                                prefixIcon: Icon(
                                  CupertinoIcons.lock,
                                  color: Colors.purple,
                                  size: 30,
                                ),
                                      // suffixIcon: IconButton(
                                      //   icon: Icon(
                                      //     controller.isPasswordHidden.value
                                      //         ? CupertinoIcons.eye_slash
                                      //         : CupertinoIcons.eye,
                                      //   ),
                                      //   onPressed: controller.togglePasswordVisibility,
                                      // ),
                                hintText: 'Password', obscuredText: true,
                              ),
                            ),
                          ),
                          ),
                          SizedBox(height: 80),
                          ElevatedButton(
                           style:ButtonStyle(
                            backgroundColor : getColor(Colors.deepPurple,Colors.white ),
                            foregroundColor : getColor(Colors.white,Colors.deepPurple ),
                           ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.to(BottomNavigationBarView());
                              }
                            },
                            child: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 18),),
                          ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("You Don't have an account? "),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => RegistrationView());
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurple,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  }
  MaterialStateProperty<Color> getColor(Color color,Color colorPressed){
    final getColor = (Set<MaterialState>states){
      if (states.contains(MaterialState.pressed)){
        return colorPressed;
      }else{
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }

}