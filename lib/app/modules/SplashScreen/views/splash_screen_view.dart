
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:proevent_project/app/modules/login/views/login_view.dart';

class SplashScreenView extends StatelessWidget {

  const SplashScreenView({super.key});
get splash => null ;

  @override
  Widget build(BuildContext context) {
   return AnimatedSplashScreen(
     splash: Column(
       children: [
         Center(
           child: LottieBuilder.asset("C:/Users/Admin/AndroidStudioProjects/proevent_project/lib/assets/lottie/name.json"),
         ),
       ],
     ), nextScreen:  LoginView(),
     backgroundColor: Colors.blue,
     splashIconSize: 200,

   );
  }

}

