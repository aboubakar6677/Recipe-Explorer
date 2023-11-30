import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Screens/Auth%20with%20Firebase/login.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ForgetPasswordApi {
  foregtpassword(email, BuildContext context) async {
    Dio dio = Dio();
    String forgeturl =
        "https://demopos.cgit.pk/api/index.php?action=forget_password&user_email=$email";
    try {
      var response = await dio.get(forgeturl);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.data.toString());
        print(data["msg"]);
        if (data["sts"] == "success") {
          var pref = await SharedPreferences.getInstance();
          pref.setString("userEmail", email);
          var snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Success',
                message: data["msg"],
                contentType: ContentType.success,
              ));

          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
              (route) => false);
        } else {
          var snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Oh! Snap,',
                message: data["msg"],
                contentType: ContentType.failure,
              ));

          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
