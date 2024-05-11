import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proevent/app/modules/login/views/login_view.dart';
import '../../../../component/authtextfromfield.dart';

import '../controllers/registration_controller.dart';
bool _isString(String value) {

  return true;
}
class RegistrationView extends GetView<RegistrationController> {
   RegistrationView({Key? key}) : super(key: key);
  final  RegistrationController controller = Get.put(RegistrationController(),permanent: true);
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   TextEditingController usernameController = TextEditingController();
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
    'assets/animation/signupapp.json',
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
              controller:usernameController,
              obscureText: !controller.isPasswordHidden.value,
              validator: controller.validateUsername,
              prefixIcon: Icon(
                CupertinoIcons.person,
                color: Colors.purple,
                size: 30,
              ),
              hintText: "UserName",
              obscuredText: false,
            ),
          ),
        ),
      ),
      SizedBox(height: 30),
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
    SizedBox(height: 30),
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
    hintText: 'Password', obscuredText: true,
    ),
    ),
    ),
    ),
    SizedBox(height: 40),
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: getColor(Colors.deepPurple, Colors.white),
          foregroundColor: getColor(Colors.white, Colors.deepPurple),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Get.to(LoginView());
          }
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
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