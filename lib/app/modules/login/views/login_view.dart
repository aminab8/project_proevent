import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:proevent_project/app/modules/BottomNavigationBar/views/bottom_navigation_bar_view.dart';
import 'package:proevent_project/app/modules/registration/views/registration_view.dart';
import '../controllers/login_controller.dart';


class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController(), permanent: true);
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Text("Get Started !",
                        style: TextStyle(fontSize: 40, color: Colors.black,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20),
                      Form(
                      key: _formKey,
                      child: Column(
                          children: <Widget>[
                      TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter Email'
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "* Required";
                    } else if (!value.isEmail) {
                      return "Check your email";
                    } else
                      return null;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                     labelText: 'Password',
                       hintText: 'Enter secure password'),
                   obscureText: true,
                       validator: (value) {
                          if (value!.isEmpty) {
                              return "* Required";
                         } else if (value.length < 6) {
                               return "Password should be atleast 6 characters";
                       } else if (value.length > 15) {
                     return "Password should not be greater than 15 characters";}
                          else return null;},
                  ),
                      const SizedBox(height: 22,),
                ElevatedButton(
                  onPressed: () {
      if (_formKey.currentState!.validate()) {
                    Get.to(BottomNavigationBarView());}
                  }, child: Text('Login '),
                   )
                    ],
               ),
                  ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Didn't  have an account ?",style: TextStyle(height: 10.0),),
                          GestureDetector(
                            onTap: () {
                              //Get.toNamed('/signup');
                              Get.to(RegistrationView());
                            },
                            child: Text(" Sign up", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),),
          ],
        ),
      ),
    );
  }
}

