import 'package:firebasegetx/app/modules/auth/widget/button_login.dart';
import 'package:firebasegetx/app/modules/auth/widget/change_theme_and_image.dart';
import 'package:firebasegetx/app/modules/auth/widget/text_form_login.dart';
import 'package:firebasegetx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.keyLogin,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 30),
              ChangeThemeAndImage(
                asset: Container(
                  width: double.infinity,
                  height: 300,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person_rounded,
                      size: 290,
                      color: Get.isDarkMode == true ? Colors.deepPurple :Colors.purple,
                    ),
                  ),
                ),
                onPres: controller.changeTheme,
              ),
              SizedBox(height: 40),
              TextFormLogin(
                controller: controller.emailController,
                labelText: "Email",
                hintText: "example@gmail.com",
                validator: controller.validateEmail,
                prefix: Icon(Icons.person),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormLogin(
                controller: controller.passwordController,
                labelText: "Password",
                hintText: "123456Ab@",
                validator: controller.validatePassword,
                prefix: Icon(Icons.lock),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => controller.isLoading.value
                    ? LoadingButton()
                    : Container(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Text('Sign Up'),
                          onPressed: controller.singIn,
                        ),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum Punya Akun?"),
                  TextButton(
                      onPressed: () => Get.toNamed(Routes.SIGNIN),
                      child: Text("Registrasi"),
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
