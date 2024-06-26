import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import '../../Events/views/events_view.dart';
import '../../Home/views/home_view.dart';
import '../../Messenger/views/messenger_view.dart';
import '../../MyHeaderDrawer/views/my_header_drawer_view.dart';

import '../../Notification/controllers/notification_controller.dart';
import '../../Notification/views/notification_view.dart';
import '../../SendFeedback/views/send_feedback_view.dart';

import '../../login/views/login_view.dart';
import '../../settingpassword/views/settingpassword_view.dart';
import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  final BottomNavigationBarController controller = Get.put(BottomNavigationBarController(), permanent: true);
  final NotificationController notificationController = Get.put(NotificationController(), permanent: true);

  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(builder: (controller) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(
              CupertinoIcons.circle_grid_3x3_fill,
              color: Colors.white,
            ),
          ),
          titleTextStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => MessengerView());
              },
              icon: Icon(
                CupertinoIcons.chat_bubble_text,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
          backgroundColor: Colors.deepPurple,
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MyHeaderDrawerView(),
                  MyDrawerList(context),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeView(),
              EventsView(),
              NotificationView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black87,
          selectedItemColor: Colors.deepPurpleAccent,
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(icon: Icon(CupertinoIcons.home, size: 25), label: "Home"),
            _bottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar, size: 25), label: "Events"),
            _bottomNavigationBarItem(
              icon: Obx(() {
                return badges.Badge(
                  badgeContent: Text(
                    notificationController.notificationCount.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  showBadge: notificationController.notificationCount > 0,
                  child: Icon(CupertinoIcons.bell, size: 25),
                );
              }),
              label: "Notifications",
            ),
          ],
        ),
      );
    });
  }

  BottomNavigationBarItem _bottomNavigationBarItem({required Widget icon, required String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }

  Widget MyDrawerList(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(CupertinoIcons.person),
            title: Text("UserName", style: TextStyle(fontSize: 18, color: Colors.black)),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 250,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "name : username ",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Enter your name",
                              content: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      SizedBox(width: 30),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.to(() => BottomNavigationBarView());
                                        },
                                        child: Text("Save"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text("Modify your  username"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail_solid),
            title: Text("Email", style: TextStyle(fontSize: 18, color: Colors.black)),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 250,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => Text(
                          "email: username@gmail.com",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                        ElevatedButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Enter your email",
                              content: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      SizedBox(width: 30),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.to(() => BottomNavigationBarView());
                                        },
                                        child: Text("Save"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text("Modify your  email"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.padlock_solid),
            title: Text("Settings Password", style: TextStyle(fontSize: 18, color: Colors.black)),
            onTap: () {
              Get.to(() => SettingpasswordView());
            },
          ),
          // ListTile(
          //   leading: Icon(CupertinoIcons.chat_bubble_text),
          //   title: Text("Send Feedback", style: TextStyle(fontSize: 18, color: Colors.black)),
          //   onTap: () {
          //     Get.to(() => SendFeedbackView());
          //   },

          ListTile(
            leading: Icon(CupertinoIcons.table),
            title: Text("Dashboard", style: TextStyle(fontSize: 18, color: Colors.black)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(CupertinoIcons.moon_fill),
            title: Text("Dark Mode", style: TextStyle(fontSize: 18, color: Colors.black)),
            onTap: () {
              Get.isDarkMode ? Get.changeTheme(ThemeData.light()) : Get.changeTheme(ThemeData.dark());
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.square_arrow_left),
            title: Text("Logout"),
            onTap: () {
              Get.to(() => LoginView());
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.share),
            title: Text("Share"),
          ),

        ],
      ),
      );
  }
}
