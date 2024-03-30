import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:proevent_project/app/modules/login/views/login_view.dart';
import '../controllers/registration_controller.dart';
bool _isString(String value) {

  return true;
}
class RegistrationView extends GetView<RegistrationController> {
   RegistrationView({Key? key}) : super(key: key);
  final  RegistrationController controller = Get.put(RegistrationController(),permanent: true);
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
         padding: EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height - 5,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    " Registration",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Create an account ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),SizedBox(height: 15),
                  Form(key: _formKey,
          child: Column(children: <Widget>[
          TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
                    labelText: 'UserName',
                    hintText: 'Enter your username',
                  ),
        validator: (value) {
          if (value!.isEmpty) {
            return "* Required";
          } else if (!_isString(value)) {
            return "Username should be a string";
          }
          return null; // Retourne null si la validation est réussie
        },
      ),

// Fonction pour vérifier si une valeur est une chaîne de caractères

    SizedBox(height: 8),
                      TextFormField(
              decoration: const InputDecoration(
        border: OutlineInputBorder(),
          labelText: 'Email',
        hintText: 'Enter Email'),
          validator: (value) {
          if (value!.isEmpty) {
    return "* Required";
    } else if (!value.isEmail) {
    return "Check your email";
    } else
    return null;
    },),
    const SizedBox(height: 8,),
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
    ),const SizedBox(height: 8,),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
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
            SizedBox(height: 8),


    const SizedBox(height: 22,),
    ElevatedButton(
    onPressed: () {
      if (_formKey.currentState!.validate()) {
Get.to(LoginView());}
    }, child: Text('Sign Up'),
    )
    ],
    ),
    ),
            ],
          ),
        ),),
    );
  }
}