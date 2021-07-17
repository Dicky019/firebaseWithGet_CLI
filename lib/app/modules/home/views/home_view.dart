import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasegetx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance
                        .signOut()
                        .then((_) {
                          GoogleSignIn().signOut();
                           Get.offNamed(Routes.AUTH);});
                  } on FirebaseAuthException catch (error) {
                    Get.defaultDialog(title: "${error.message!}");
                  }
                }),
          ],
        ),
        body: Center(child: Text("Home")));
  }
}
