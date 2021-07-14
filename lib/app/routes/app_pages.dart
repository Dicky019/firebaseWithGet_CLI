import 'package:firebasegetx/app/modules/auth/views/dasboard_auth_view.dart';
import 'package:firebasegetx/app/modules/auth/views/sing_in_view.dart';
import 'package:get/get.dart';

import 'package:firebasegetx/app/modules/auth/bindings/auth_binding.dart';
import 'package:firebasegetx/app/modules/auth/views/login_view.dart';
import 'package:firebasegetx/app/modules/home/bindings/home_binding.dart';
import 'package:firebasegetx/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => DasboardLoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SingInView(),
      binding: AuthBinding(),
    ),
  ];
}
