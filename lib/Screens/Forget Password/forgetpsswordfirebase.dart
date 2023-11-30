import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Screens/Auth%20with%20Firebase/login.dart';
import 'package:recipeapp/Widgets/commondialogue.dart';
import 'package:recipeapp/Widgets/customauthtextfield.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final forgetpassword = TextEditingController();

  GlobalKey<FormState> forgetpasswordkey = GlobalKey<FormState>();
  // UserCredential? _passwordResetUser;
  @override
  void dispose() {
    forgetpassword.dispose();
    super.dispose();
  }

  Future passwrodReset() async {
    try {
      CommonDialog.showLoading();

      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgetpassword.text.trim());
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(
          title: "Success",
          description: "Reset Link sent successfully, Check youe Email.");
      forgetpassword.clear();
    } on FirebaseAuthException catch (e) {
      print(e);
      CommonDialog.showErrorDialog(description: e.message.toString());
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // Listen for the password reset link
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (_passwordResetUser != null && user == null) {
  //       // User logged out after resetting password
  //       // Navigate to the new password screen here
  //       Get.to(() => const ChangePasswordScreen());
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Form(
            key: forgetpasswordkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text("RESET PASSWORD")
                      .textColor(AppColors.whitecolor)
                      .fontSize(35)
                      .fontFamily("PoppinsLight"),
                  const SizedBox(height: 5),
                  const Text(
                          "Enter Your Email and we will send you a reset password link")
                      .textColor(AppColors.whitecolor)
                      .fontSize(14)
                      .fontFamily("PoppinsLight")
                      .textAlignment(TextAlign.center),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        TextFormField(
                          style: const TextStyle(
                              color: AppColors.whitecolor,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            }
                            if (!GetUtils.isEmail(value)) {
                              return "Email is invalid!";
                            }
                            return null;
                          },
                          controller: forgetpassword,
                          decoration: InputDecoration(
                            errorStyle:
                                const TextStyle(color: AppColors.whitecolor),
                            labelStyle: const TextStyle(
                                color: AppColors.greycolor,
                                fontFamily: "PoppinsLight",
                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                            isDense: true,
                            labelText: AppStrings.email,
                            errorBorder: errorBorder(),
                            focusedErrorBorder: errorBorder(),
                            focusedBorder: border(),
                            enabledBorder: border(),
                            floatingLabelStyle:
                                const TextStyle(color: AppColors.whitecolor),
                          ),
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          style: ButtonStyle(
                              fixedSize: const MaterialStatePropertyAll(
                                  Size.fromWidth(180)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.primarycolor),
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent)),
                          onPressed: () async {
                            passwrodReset();
                          },
                          child: const Text("VERIFY")
                              .textColor(AppColors.whitecolor)
                              .fontSize(20)
                              .fontFamily("PoppinsLight"),
                        ),
                        const SizedBox(height: 70),
                        TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                          ),
                          onPressed: () {
                            Get.to(() => const Login());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Remember Password?")
                                  .textColor(AppColors.whitecolor)
                                  .fontSize(16),
                              const SizedBox(width: 4),
                              const Text("Login")
                                  .textColor(AppColors.primarycolor)
                                  .fontSize(16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
