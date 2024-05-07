import 'package:get/get.dart';

import 'package:proevent/app/modules/ChatMsgItem/bindings/chat_msg_item_binding.dart';
import 'package:proevent/app/modules/ChatMsgItem/views/chat_msg_item_view.dart';
import 'package:proevent/app/modules/ChatScreen/bindings/chat_screen_binding.dart';
import 'package:proevent/app/modules/ChatScreen/views/chat_screen_view.dart';
import 'package:proevent/app/modules/Messenger/bindings/messenger_binding.dart';
import 'package:proevent/app/modules/Messenger/views/messenger_view.dart';

import '../modules/BottomNavigationBar/bindings/bottom_navigation_bar_binding.dart';
import '../modules/BottomNavigationBar/views/bottom_navigation_bar_view.dart';
import '../modules/Events/bindings/events_binding.dart';
import '../modules/Events/views/events_view.dart';
import '../modules/Home/bindings/home_binding.dart';
import '../modules/Home/views/home_view.dart';
import '../modules/MyHeaderDrawer/bindings/my_header_drawer_binding.dart';
import '../modules/MyHeaderDrawer/views/my_header_drawer_view.dart';
import '../modules/Notification/bindings/notification_binding.dart';
import '../modules/Notification/views/notification_view.dart';
import '../modules/SendFeedback/bindings/send_feedback_binding.dart';
import '../modules/SendFeedback/views/send_feedback_view.dart';
import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/settingpassword/bindings/settingpassword_binding.dart';
import '../modules/settingpassword/views/settingpassword_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGPASSWORD,
      page: () => SettingpasswordView(),
      binding: SettingpasswordBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EVENTS,
      page: () => EventsView(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION_BAR,
      page: () => BottomNavigationBarView(),
      binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.MY_HEADER_DRAWER,
      page: () => const MyHeaderDrawerView(),
      binding: MyHeaderDrawerBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SEND_FEEDBACK,
      page: () => SendFeedbackView(),
      binding: SendFeedbackBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_SCREEN,
      page: () => ChatScreenView(),
      binding: ChatScreenBinding(),
    ),
    // GetPage(
    //   name: _Paths.CHAT_MSG_ITEM,
    //   page: () => ChatMsgItemView(),
    //   binding: ChatMsgItemBinding(),
    // ),
    GetPage(
      name: _Paths.MESSENGER,
      page: () => MessengerView(),
      binding: MessengerBinding(),
    ),
  ];
}
