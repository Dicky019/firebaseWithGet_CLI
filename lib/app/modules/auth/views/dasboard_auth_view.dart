import 'package:firebasegetx/app/modules/auth/controllers/auth_controller.dart';
import 'package:firebasegetx/app/modules/auth/views/login_view.dart';
import 'package:firebasegetx/app/modules/auth/widget/change_theme_and_image.dart';
import 'package:firebasegetx/app/modules/auth/widget/sosial_medial_button.dart';
import 'package:firebasegetx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DasboardLoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            ChangeThemeAndImage(
              asset: LottieBuilder.asset(
                'assets/lottie/login.json',
                width: double.infinity,
                height: 350,
              ),
              onPres: controller.changeTheme,
            ),
            SizedBox(
              height: 20,
            ),
            SosialMediaButton(
              label: 'Email',
              sosialMedia: Icon(
                Icons.mail
              ),
              onPres: () => Get.toNamed(Routes.LOGIN),
              color: null,
            ),
            SizedBox(
              height: 10,
            ),
            SosialMediaButton(
              onPres: controller.singIn,
              sosialMedia: FaIcon(FontAwesomeIcons.google),
              label: 'Google',
              color: Colors.blueAccent,
            ),
            SizedBox(
              height: 10,
            ),
            SosialMediaButton(
              onPres: controller.singIn,
              sosialMedia: FaIcon(
                FontAwesomeIcons.facebook,
              ),
              label: 'Facebook',
              color: Colors.blueAccent,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum Punya Akun?"),
                TextButton(
                    onPressed: () => Get.toNamed(Routes.SIGNIN),
                    child: Text("Registrasi"),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
