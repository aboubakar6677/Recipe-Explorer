import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Screens/HomeScreen/HomeScreen.dart';
import 'package:recipeapp/Widgets/commondialogue.dart';

class Loginlogic extends GetxController {
  String? userId;
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();
  final loginemailcontroller = TextEditingController();
  final loginpasswordController = TextEditingController();

  void signUserin() async {
    try {
      if (loginkey.currentState!.validate()) {
        CommonDialog.showLoading();
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginemailcontroller.text.trim(),
          password: loginpasswordController.text.trim(),
        );
        print("User signed in: ${userCredential.user!.uid}");
        userId = userCredential.user!.uid;
        CommonDialog.hideLoading();
        print("Navigating to HomeScreen");
        Get.offAll(() => const HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      print('Firebase Auth Exception: $e');
      CommonDialog.showErrorDialog(description: e.code);
      if (e.code == AppStrings.invalid) {
        CommonDialog.showErrorDialog(description: e.code);
        print(e.code);
      }
    }
  }

  void onlogin() {
    print("onlogin method called");
    if (loginkey.currentState!.validate()) {
      signUserin();
    }
  }
}
