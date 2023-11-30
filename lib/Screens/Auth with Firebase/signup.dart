import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/AuthControllers/signupgetx.dart';
import 'package:recipeapp/Screens/Auth%20with%20Firebase/login.dart';

import 'package:recipeapp/Widgets/custom_button.dart';
import 'package:recipeapp/Widgets/customauthtextfield.dart';

class SignUp extends GetView<SignupLogic> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignupLogic signupLogic = Get.put(SignupLogic());

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetBuilder<SignupLogic>(builder: (_) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Form(
              key: signupLogic.signupkey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        AppResources.appLogopng,
                        width: 118,
                        height: 118,
                      ),
                    ),
                    const Text(AppStrings.signupsignup)
                        .textColor(AppColors.whitecolor)
                        .fontSize(35)
                        .fontFamily("PoppinsLight"),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          CustomAuthTextfield(
                            textEditingController: signupLogic.namecontroller,
                            labeltext: AppStrings.name,
                            keyboardType: TextInputType.name,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z ]'))
                            ],
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.namereq;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomAuthTextfield(
                            textEditingController:
                                signupLogic.signupemailcontroller,
                            labeltext: AppStrings.email,
                            keyboardType: TextInputType.emailAddress,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.emailerror1;
                              }
                              if (!GetUtils.isEmail(value)) {
                                return AppStrings.emailerror2;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomAuthTextfield(
                            textEditingController:
                                signupLogic.phonenumbercontroller,
                            labeltext: "Contact Number",
                            keyboardType: TextInputType.phone,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return "Number is empty";
                              }
                              if (!GetUtils.isPhoneNumber(value)) {
                                return "Format invalid";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomAuthTextfield(
                            textEditingController:
                                signupLogic.addresscontroller,
                            labeltext: "Address",
                            keyboardType: TextInputType.streetAddress,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return "Address is empty";
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomAuthTextfield(
                            obscureText: true,
                            textEditingController:
                                signupLogic.signuppasswordController,
                            labeltext: AppStrings.password,
                            keyboardType: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.passworderror1;
                              }
                              if (value.length < 6) {
                                return AppStrings.passworderror2;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomAuthTextfield(
                            obscureText: true,
                            textEditingController:
                                signupLogic.signupconfirmPasswordController,
                            labeltext: "Confirm Password",
                            keyboardType: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.passworderror1;
                              }
                              if (value.length < 6) {
                                return AppStrings.passworderror2;
                              }
                              if (value !=
                                  signupLogic.signuppasswordController.text) {
                                return "Password does not match";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                              labelText: AppStrings.create,
                              onTap: () {
                                signupLogic.onsignup();
                              }),
                          const SizedBox(height: 30),
                          TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent)),
                            onPressed: () {
                              Get.offAll(() => const Login());
                              signupLogic.namecontroller.clear();
                              signupLogic.signupemailcontroller.clear();
                              signupLogic.signuppasswordController.clear();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(AppStrings.already)
                                    .textColor(AppColors.whitecolor)
                                    .fontSize(15)
                                    .fontFamily("PoppinsExtraLight"),
                                const SizedBox(width: 4),
                                const Text(AppStrings.login)
                                    .textColor(AppColors.whitecolor)
                                    .withUnderLine()
                                    .fontSize(15)
                                    .fontFamily("PoppinsExtraLight")
                                    .textStyle(
                                      const TextStyle(
                                          decorationColor:
                                              AppColors.whitecolor),
                                    ),
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
        );
      }),
    );
  }
}
