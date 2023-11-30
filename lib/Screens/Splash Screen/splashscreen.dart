// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/AuthControllers/splashcontroller.dart';

class SplashScreen extends GetView<SplashLogic> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashLogic>(
        init: SplashLogic(),
        builder: (controller) {
          return const Image(
            image: AssetImage(AppResources.appLogo),
            // width: 191,
            // height: 114,
          );
        });
  }
}
