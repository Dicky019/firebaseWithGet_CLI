import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasegetx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final obsecurePassword = false.obs;
  late GoogleSignIn googleSignIn;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> keyLogin = GlobalKey<FormState>();

  @override
  void onInit() {
    googleSignIn = GoogleSignIn();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void eyePassword () {
    
    obsecurePassword.value != true ? obsecurePassword.value= true : obsecurePassword.value=false;
    print(obsecurePassword.value);
  }

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

  void singIn() async {
    isLoading.value = true;
    if (keyLogin.currentState!.validate()) {
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
         defaultError(error.toString());
        isLoading.value = false;
      }
    }
    isLoading.value = false;
  }


  Future signInWithEmail() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      isLoading.value = true;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((_) => Get.offNamed(Routes.HOME));
    } on FirebaseAuthException catch (error) {
      defaultError(error.toString());
    } catch (e) {
      defaultError(e.toString());
    }
  }

  void defaultError(String error){
    Get.defaultDialog(title: "Error", middleText: error);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    // googleSignIn.disconnect()
  }
}
