import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import 'package:get/get.dart';
import 'package:proevent_project/app/modules/homeemployee/views/homeemployee_view.dart';
import 'package:proevent_project/app/modules/settingpassword/views/settingpassword_view.dart';

import '../../addevents/views/addevents_view.dart';
import '../../choose_page/views/choose_page_view.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Enable custom theme'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Account'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.email),
                title: Text('Email'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.lock),
                title: Text('Password'),
                onPressed: (BuildContext context) {
                  Get.to(SettingpasswordView());
                },
              ),
              SettingsTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sign Out'),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offAll(ChoosePageView());
              break;
            case 1:
              Get.offAll(AddeventsView());
              break;
            case 2:
              Get.offAll(SettingsView());
              break;
          }
        },
      ),
    );
  }
}
