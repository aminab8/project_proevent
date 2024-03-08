import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:proevent_project/app/modules/loginemployee/views/loginemployee_view.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
   RegistrationView({Key? key}) : super(key: key);
  final  RegistrationController controller = Get.put(RegistrationController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height - 20,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Employee Registration",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Create an account to get started",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  _buildTextField('Username', controller.usernameController),
                  SizedBox(height: 5),
                  _buildTextField("Email", controller.emailController),
                  SizedBox(height: 5),
                  _buildTextField("Password", obscureText: true, controller.passwordController),
                  _buildTextField('Confirm Password', controller.confirmPasswordController, obscureText: true),
                  SizedBox(height: 5),
                  _buildTextField('ID', controller.idController),
                  ElevatedButton(
                    onPressed: controller.handleRegistration,
                    child: Text("Sign up "),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
