import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/data/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,

  ));
  User? user = FirebaseAuth.instance.currentUser;
  runApp(GetMaterialApp(
    theme: themeLight,
    debugShowCheckedModeBanner: false,
    title: "Application",
    initialRoute: user != null ? Routes.HOME : AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
