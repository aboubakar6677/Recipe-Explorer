import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/AuthControllers/logingetx.dart';
import 'package:recipeapp/Screens/Auth%20with%20Firebase/signup.dart';
import 'package:recipeapp/Screens/Forget%20Password/forgetpsswordfirebase.dart';
import 'package:recipeapp/Widgets/custom_button.dart';
import 'package:recipeapp/Widgets/customauthtextfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Loginlogic loginlogic = Get.put(Loginlogic());

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetBuilder<Loginlogic>(builder: (_) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Form(
              key: loginlogic.loginkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      child: Image.asset(
                        AppResources.appLogopng,
                        width: 118,
                        height: 118,
                      ),
                    ),
                    const Text(AppStrings.login)
                        .textColor(AppColors.whitecolor)
                        .fontSize(35)
                        .fontFamily("PoppinsLight"),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          CustomAuthTextfield(
                              textEditingController:
                                  loginlogic.loginemailcontroller,
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
                              }),
                          const SizedBox(height: 20),
                          CustomAuthTextfield(
                            obscureText: true,
                            textEditingController:
                                loginlogic.loginpasswordController,
                            labeltext: AppStrings.password,
                            keyboardType: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.passworderror1;
                              }
                              if (value.length < 6) {
                                return AppStrings.passworderror3;
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                ),
                                onPressed: () {
                                  Get.to(() => const ForgetPassword());
                                },
                                child: const Text(AppStrings.forget)
                                    .textColor(AppColors.whitecolor)
                                    .fontSize(13)
                                    .fontFamily("PoppinsExtraLight"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                              labelText: AppStrings.login,
                              onTap: () {
                                loginlogic.onlogin();
                                loginlogic.loginemailcontroller.clear();
                                loginlogic.loginpasswordController.clear();
                              }),
                          const SizedBox(height: 30),
                          TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent)),
                            onPressed: () {
                              Get.offAll(() => const SignUp());

                              loginlogic.loginemailcontroller.clear();
                              loginlogic.loginpasswordController.clear();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(AppStrings.dont)
                                    .textColor(AppColors.whitecolor)
                                    .fontSize(15)
                                    .fontFamily("PoppinsExtraLight"),
                                const SizedBox(width: 4),
                                const Text(AppStrings.signup)
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
