import 'package:get/get.dart';
import 'package:recipeapp/Screens/HomeScreen/homescreen.dart';

class SplashLogic extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const HomeScreen());
    });
    super.onInit();
  }
}
