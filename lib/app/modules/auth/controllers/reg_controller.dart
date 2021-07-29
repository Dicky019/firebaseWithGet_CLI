import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasegetx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegController extends GetxController {
  final isLoading = false.obs;
  final obsecureConfirm = false.obs;
  final obsecurePassword = false.obs;
  late TextEditingController emailController ;
  late TextEditingController passwordController ;
  late TextEditingController confirmPasswordController ;
  final GlobalKey<FormState> keySignIn = GlobalKey<FormState>();

  void eyeConfirm () {
    // ignore: unnecessary_statements
    obsecureConfirm.value != true ? obsecureConfirm.value= true : obsecureConfirm.value=false;
    print(obsecureConfirm.value);
  }
  void eyePassword () {
    // ignore: unnecessary_statements
    obsecurePassword.value != true ? obsecurePassword.value= true : obsecurePassword.value=false;
    print(obsecurePassword.value);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
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
       defaultError(error.message!);
        isLoading.value = false;
      }
    }
    isLoading.value = false;
  }

  void defaultError(String error){
     Get.defaultDialog(title: "Error",middleText: error);
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
