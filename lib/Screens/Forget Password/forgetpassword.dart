import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Screens/Auth%20With%20API/login.txt';
import 'package:recipeapp/Services/Authentication%20API/forgetpasswrodapi.dart';

import 'package:recipeapp/Widgets/loader.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetpassword = TextEditingController();

    GlobalKey<FormState> forgetpasswordkey = GlobalKey<FormState>();

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
                      .fontFamily("PoppinsLight")
                      ,
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
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.primarycolor),
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent)),
                          onPressed: () async {
                            if (forgetpasswordkey.currentState!.validate()) {
                              // FocusManager.instance.primaryFocus?.unfocus();
                              startLoader(context);
                              ForgetPasswordApi()
                                  .foregtpassword(
                                      forgetpassword.text.trim(), context)
                                  .whenComplete(() {
                                stopLoader(context);
                              });
                            }
                          },
                          child: const Text("VERIFY")
                              .textColor(AppColors.whitecolor)
                              .fontSize(20)
                              .fontFamily("PoppinsLight")
                              ,
                        ),
                        const SizedBox(height: 70),
                        TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                          ),
                          onPressed: () {
                            Get.to(() => const LoginScreen());
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
