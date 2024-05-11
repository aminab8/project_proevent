
import 'package:flutter/cupertino.dart';


import '../model/menu_model.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: CupertinoIcons.home, title: 'Dashboard'),
    MenuModel(icon: CupertinoIcons.person, title: 'Profile'),
    //MenuModel(icon: Icons.run_circle, title: 'Exersice'),
    MenuModel(icon:CupertinoIcons.settings, title: 'Settings'),
   // MenuModel(icon:CupertinoIcons.history, title: 'History'),
   // MenuModel(icon: CupertinoIcons.logout, title: 'SignOut'),
  ];
}
