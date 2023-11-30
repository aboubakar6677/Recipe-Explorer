import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Screens/Auth%20with%20Firebase/login.dart';

import 'package:recipeapp/Widgets/commondialogue.dart';

class SignupLogic extends GetxController {
  GlobalKey<FormState> signupkey = GlobalKey<FormState>();
  final signupemailcontroller = TextEditingController();
  final signuppasswordController = TextEditingController();
  final signupconfirmPasswordController = TextEditingController();
  final namecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  //  String username = '';

  void onsignup() async {
    try {
      if (signupkey.currentState!.validate()) {
        CommonDialog.showLoading();
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signupemailcontroller.text,
          password: signuppasswordController.text.toString(),
        );

        print(userCredential);

        try {
          var response = await FirebaseFirestore.instance
              .collection(AppStrings.userslist)
              .add({
            AppStrings.userid: userCredential.user!.uid,
            AppStrings.firebaseusername: namecontroller.text.trim(),
            AppStrings.userpass: signuppasswordController.text,
            AppStrings.useremail: signupemailcontroller.text.trim(),
            AppStrings.userphone: phonenumbercontroller.text.trim(),
            AppStrings.useraddress: addresscontroller.text.trim()
          });
          print("Firebase response 1111 ${response.id}");
          CommonDialog.hideLoading();
          // Navigate to Login screen
          Get.offAll(() => const Login());
        } catch (exception) {
          CommonDialog.hideLoading();
          CommonDialog.showErrorDialog(
              description: "Account Created successfully");
          print("Error Saving Data at firestore $exception");
        }
      }
    } on FirebaseAuthException catch (e) {
      // CommonDialog.hideLoading();
      // if (e.code == 'weak-password') {
      //   CommonDialog.showErrorDialog(
      //       description: "The password provided is too weak.");
      // } else
      if (e.code == AppStrings.emailalready) {
        CommonDialog.showErrorDialog(description: AppStrings.emailalready);
      }
    } catch (e) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(description: AppStrings.somewent);

      Get.snackbar(AppStrings.error, e.toString());
    }
  }

  Future<Map<String, dynamic>?> fetchUserData(String userId) async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection(AppStrings.userslist)
          .where(AppStrings.userid, isEqualTo: userId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first.data();
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}

// bool signupcontainsSpecialCharacter(String password) {
//   return password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
// }

bool signupcontainsUppercaseLetter(String password) {
  return password.contains(RegExp(r'[A-Z]'));
}
