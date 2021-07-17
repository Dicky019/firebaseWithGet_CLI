import '../../../data/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChengeThemeCustom extends GetxController {


  void changeTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          Get.isDarkMode ? Brightness.dark : Brightness.light,
    ));
    Get.changeTheme(Get.isDarkMode ? themeLight : themeDark);
  }

}
