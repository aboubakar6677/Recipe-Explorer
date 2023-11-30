import 'package:get/get.dart';
import 'package:recipeapp/Screens/Welcome%20Screen/welcomescreen.dart';

class SplashLogic extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const WelcomeScreen());
    });
    super.onInit();
  }
}
