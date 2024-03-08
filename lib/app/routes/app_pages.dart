import 'package:get/get.dart';

import '../modules/addevents/bindings/addevents_binding.dart';
import '../modules/addevents/views/addevents_view.dart';
import '../modules/choose_page/bindings/choose_page_binding.dart';
import '../modules/choose_page/views/choose_page_view.dart';

import '../modules/homeemployee/bindings/homeemployee_binding.dart';
import '../modules/homeemployee/views/homeemployee_view.dart';
import '../modules/inforamtionadmin/bindings/inforamtionadmin_binding.dart';
import '../modules/inforamtionadmin/views/inforamtionadmin_view.dart';
import '../modules/loginadmin/bindings/loginadmin_binding.dart';
import '../modules/loginadmin/views/loginadmin_view.dart';
import '../modules/loginemployee/bindings/loginemployee_binding.dart';
import '../modules/loginemployee/views/loginemployee_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/settingpassword/bindings/settingpassword_binding.dart';
import '../modules/settingpassword/views/settingpassword_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CHOOSE_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.CHOOSE_PAGE,
      page: () =>  ChoosePageView(),
      binding: ChoosePageBinding(),
    ),
    GetPage(
      name: _Paths.HOMEEMPLOYEE,
      page: () =>  HomeemployeeView(),
      binding: HomeemployeeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () =>  RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.INFORAMTIONADMIN,
      page: () => InforamtionadminView(
        password: '',
        email: '',
      ),
      binding: InforamtionadminBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGPASSWORD,
      page: () => const SettingpasswordView(),
      binding: SettingpasswordBinding(),
    ),
    GetPage(
      name: _Paths.ADDEVENTS,
      page: () =>  AddeventsView(),
      binding: AddeventsBinding(),
    ),
    GetPage(
      name: _Paths.LOGINEMPLOYEE,
      page: () =>  LoginemployeeView(),
      binding: LoginemployeeBinding(),
    ),
    GetPage(
      name: _Paths.LOGINADMIN,
      page: () => LoginadminView(),
      binding: LoginadminBinding(),
    ),

  ];
}
