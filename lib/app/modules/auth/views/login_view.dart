import 'package:firebasegetx/app/modules/auth/controllers/change_theme_controller.dart';
import 'package:firebasegetx/app/modules/auth/widget/button_login.dart';
import 'package:firebasegetx/app/modules/auth/widget/change_theme_and_image.dart';
import 'package:firebasegetx/app/modules/auth/widget/text_form_login.dart';
import 'package:firebasegetx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  final ganti = Get.put(ChengeThemeCustom());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.keyLogin,
          child: ListView(
            children: [
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ChangeThemeAndImage(
                  asset: Container(
                    margin: EdgeInsets.only(top: 50),
                    width: double.infinity,
                    height: 240,
                    child: CircleAvatar(
                      backgroundColor: Get.isDarkMode == true
                              ? Colors.grey[900]
                              : null,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18)),
                        child: SvgPicture.asset(
                          "assets/icons/user.svg",
                          height: 180,
                          color: Get.isDarkMode == true
                              ? Colors.white70
                              : Colors.purple[600],
                        ),
                      ),
                    ),
                  ),
                  onPres: ganti.changeTheme,
                  back: Positioned(
                    top: 0,
                    left: 0,
                    child: Changebutton(
                      iconDark: Icons.arrow_back_outlined,
                      iconLight: Icons.arrow_back_rounded,
                      onPres: () => Get.back(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
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
                      hintText: "Ab@123456",
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
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum Punya Akun?"),
                        TextButton(
                            onPressed: () {
                              controller.passwordController.clear();
                              controller.emailController.clear();
                              Get.toNamed(Routes.SIGNIN);
                            },
                            child: Text("Registrasi"),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 0),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
