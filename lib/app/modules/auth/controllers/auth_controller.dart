import '../../../data/theme/theme.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasegetx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> keyLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> keySignIn = GlobalKey<FormState>();

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty)
      return 'E-mail address is required.';

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty)
      return 'Password is required.';

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword))
      return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';

    return null;
  }

  String? validateConfirmPassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty)
      return 'Password is required.';

    if (confirmPasswordController.text != passwordController.text)
      return 'Password does not match';

    return null;
  }

  void singIn() async {
    isLoading.value = true;
    if (keySignIn.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
            .then((value) {
          isLoading.value = false;
          Get.offNamed(Routes.HOME);
        });
      } on FirebaseAuthException catch (error) {
        Get.defaultDialog(title: error.message!) ;
        isLoading.value = false;
      }
    }
    isLoading.value = false;
  }

  void singUp() async {
    isLoading.value = true;
    if (keyLogin.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            )
            .then((value) => isLoading.value = false);
      } on FirebaseAuthException catch (error) {
        Get.defaultDialog(title: error.message!);
        isLoading.value = false;
      }
    }
    isLoading.value = false;
  }

  void changeTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          Get.isDarkMode ? Brightness.dark : Brightness.light,
    ));
    Get.changeTheme(Get.isDarkMode ? themeLight : themeDark);
  }

  @override
  void onInit() {
    
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
