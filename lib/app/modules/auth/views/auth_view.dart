import 'package:firebasegetx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purpleAccent[100],
      body: Form(
        key: controller.keyLogin,
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
                        onPressed: controller.changeTheme,
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
                  TextButton(onPressed: ()=>Get.toNamed(Routes.SIGNIN), child: Text("Registrasi"),style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 0),))
                ],
              ),
              Obx(
                () => controller.isLoading.value
                    ? LoadingButton()
                    : Container(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary : Colors.black54,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                            padding: EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Text('Google'),
                          onPressed: controller.singIn,
                        ),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => controller.isLoading.value
                    ? LoadingButton()
                    : Container(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary : Colors.black54,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                            padding: EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Text('Facebook'),
                          onPressed: controller.singIn,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        child: Container(
          width: 20.65,
          child: CircularProgressIndicator(
            // color: Colors.white,
            strokeWidth: 3,
          ),
        ),
        onPressed: null,
      ),
    );
  }
}

class TextFormLogin extends StatelessWidget {
  const TextFormLogin({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.validator,
    required this.controller,
    required this.prefix,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final validator;
  final Widget prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 22, 12, 14),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefix,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
// Obx(
                //   () => ElevatedButton(
                //     child: controller.isLoading.value == true
                //         ? CircularProgressIndicator(color: Colors.white)
                //         : Text('Sign In'),
                //     onPressed: controller.singIn,
                //   ),
                // ),