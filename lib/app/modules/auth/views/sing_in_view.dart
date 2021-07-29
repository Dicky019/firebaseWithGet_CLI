import 'package:firebasegetx/app/modules/auth/controllers/change_theme_controller.dart';
import 'package:firebasegetx/app/modules/auth/controllers/reg_controller.dart';
import 'package:firebasegetx/app/modules/auth/widget/button_login.dart';
import 'package:firebasegetx/app/modules/auth/widget/text_form_login.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SingInView extends GetView<RegController> {
  final ganti = Get.put(ChengeThemeCustom());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.keySignIn,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Stack(
                children: [
                  LottieBuilder.asset(
                    'assets/lottie/login.json',
                    width: double.infinity,
                    height: 330,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                        splashRadius: 20,
                        onPressed: ganti.changeTheme,
                        icon: Icon(
                          Get.isDarkMode
                              ? Icons.color_lens_outlined
                              : Icons.color_lens_rounded,
                          color:
                              Get.isDarkMode ? Colors.white70 : Colors.black87,
                        )),
                  ),
                ],
              ),
              TextFormLogin(
                controller: controller.emailController,
                labelText: "Email",
                hintText: "example@gmail.com",
                validator: controller.validateEmail,
                prefix: Icon(Icons.person),
              ),
              SizedBox(
                height: 8,
              ),
              Obx(() => TextFormLogin(
                    controller: controller.passwordController,
                    labelText: "Password",
                    hintText: "123456Ab@",
                    validator: controller.validatePassword,
                    obscure: controller.obsecurePassword.value,
                    suffix: IconButton(
                      splashRadius: 20,
                      icon: Icon(
                        controller.obsecurePassword.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                      ),
                      onPressed: controller.eyePassword,
                    ),
                    prefix: Icon(Icons.lock),
                  )),
              SizedBox(
                height: 8,
              ),
              Obx(
                () => TextFormLogin(
                  controller: controller.confirmPasswordController,
                  labelText: "Confirm Password",
                  obscure: controller.obsecureConfirm.value,
                  validator: controller.validateConfirmPassword,
                  prefix: Icon(
                    Icons.lock_outline_rounded,
                  ),
                  suffix: IconButton(
                    splashRadius: 20,
                    icon: Icon(
                      controller.obsecureConfirm.value
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                    ),
                    onPressed: controller.eyeConfirm,
                  ),
                ),
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
                          child: Text('Sing In'),
                          onPressed: controller.singIn,
                        ),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah Punya Akun?"),
                  TextButton(
                      onPressed: () => Get.back(),
                      child: Text("Login"),
                      style: TextButton.styleFrom(
                        minimumSize: Size(45, 30),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
