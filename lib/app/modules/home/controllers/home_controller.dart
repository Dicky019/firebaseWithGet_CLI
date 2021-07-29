import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasegetx/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void logOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((_) {
        GoogleSignIn().signOut();
        Get.offNamed(Routes.AUTH);
      });
    } on FirebaseAuthException catch (error) {
      Get.defaultDialog(title: "${error.message!}");
    }
  }
}
