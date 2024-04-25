
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Events/views/events_view.dart';
import '../../Home/views/home_view.dart';
import '../../MyHeaderDrawer/views/my_header_drawer_view.dart';
import '../../Notification/views/notification_view.dart';
import '../../SendFeedback/views/send_feedback_view.dart';
import '../../login/views/login_view.dart';
import '../../settingpassword/views/settingpassword_view.dart';
import '../controllers/bottom_navigation_bar_controller.dart';


class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  final BottomNavigationBarController controller = Get.put(
      BottomNavigationBarController(), permanent: true);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(builder: (controller) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          }, icon: Icon(CupertinoIcons.circle_grid_3x3_fill),),
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.chat_bubble_text)),

          ],
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MyHeaderDrawerView(),
                  MyDrawerList(),
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
          selectedItemColor: Colors.blue,
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(icon: CupertinoIcons.home, label: "Home"),
            _bottomNavigationBarItem(
                icon: CupertinoIcons.calendar, label: "events"),
            _bottomNavigationBarItem(
                icon: CupertinoIcons.bell, label: "Notifications"),
          ],
        ),
      );
    });
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      {required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  Widget MyDrawerList() {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(CupertinoIcons.person),
            title:Text( "UserName",style: TextStyle(fontSize: 18,color: Colors.black),),
            onTap: () {
              Get.defaultDialog(
                title: "Enter you name",
                content: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: TextFormField(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            onPressed: (){
                              Get.back();
                            },
                            child: const Text("Cancle"),
                        ),
                        SizedBox(width: 30,),
                        ElevatedButton( onPressed: (){
                          Get.to(BottomNavigationBarView());
                        },
                          child: const Text("Save"),
                        ),

                      ],
                    )
                  ],
                )
              );
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail_solid),
            title:Text( "Email",style: TextStyle(fontSize: 18,color: Colors.black),),
            onTap: (){
              Get.defaultDialog(
                  title: "Enter your email",
                  content: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: TextFormField(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: (){
                              Get.back();
                            },
                            child: const Text("Cancle"),
                          ),
                          SizedBox(width: 30,),
                          ElevatedButton( onPressed: (){
                            Get.to(BottomNavigationBarView());
                          },
                            child: const Text("Save"),
                          ),

                        ],
                      )
                    ],
                  )
              );
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.padlock_solid),
            title:Text( "Settings Password",style: TextStyle(fontSize: 18,color: Colors.black),),
            onTap: (){ Get.to(SettingpasswordView());},
          ),
          ListTile(
            leading: Icon(CupertinoIcons.chat_bubble_text),
            title:Text( "Send_Feedback",style: TextStyle(fontSize: 18,color: Colors.black),),
            onTap: (){ Get.to(SendFeedbackView());},
          ),
          ListTile(
            leading: Icon(CupertinoIcons.moon_fill),
            title:Text( "Dark_Mode",style: TextStyle(fontSize: 18,color: Colors.black),),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon( CupertinoIcons.square_arrow_left),
            title: Text("Logout"),
            onTap: (){ Get.to(LoginView());},
          ),
          ListTile(
            leading: Icon( CupertinoIcons.share),
            title: Text("Share"),
          )
        ],
      ),
    );

  }


}




