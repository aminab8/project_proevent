import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:proevent/app/modules/BottomNavigationBar/views/bottom_navigation_bar_view.dart';

import '../../registration/views/registration_view.dart';
import '../controllers/login_controller.dart';


class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController forgetEmailController = TextEditingController();
  TextEditingController emailController = TextEditingController(); // Nom plus clair
  TextEditingController passwordController = TextEditingController(); // Nom plus clair

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>(); // Assurez-vous que le contrôleur est initialisé

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Get Started!",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController, // Ajout du contrôleur
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter Email',
                    ),
                    validator: controller.validateEmail, // Correction de la syntaxe
                  ),
                  const SizedBox(height: 20),
                  Obx(
                        () => TextFormField(
                      controller: passwordController, // Ajout du contrôleur
                      obscureText: controller.isPasswordHidden.value,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password',
                        suffix: IconButton(
                          icon: Icon(
                            controller.isPasswordHidden.value
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
                            color: Colors.black,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                      validator: controller.validatePassword, // Correction de la syntaxe
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Forget Password?',
                        content: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                controller: forgetEmailController, // Correction du contrôleur
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  icon: Icon(CupertinoIcons.lock_fill,),
                                  labelText: 'Enter your email',
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: Get.height * 0.02),
                      child: Text( // Correction de l'utilisation de myText
                        'Forget Password?',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                       Get.to(BottomNavigationBarView());// Assurez-vous que login est bien défini
                      }
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't have an account?"),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Get.to(() => RegistrationView()); // Correction de l'appel
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
