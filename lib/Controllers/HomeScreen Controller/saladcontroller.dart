import 'package:get/get.dart';
import 'package:recipeapp/Models/Salad%20Model/saladmodel.dart';
import 'package:recipeapp/Services/HomeScreen%20API/saladapi.dart';

class SaladScreenLogic extends GetxController {
  RxList<SaladRecipe> saladrecipe = <SaladRecipe>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getSaladData();
  }

  getSaladData() async {
    isLoading.value = true;
    SaladModelClass? response = await SaladApiServices().fetchSaladData();
    saladrecipe.addAll(
      response.hits.map((hit) => hit.recipe).toList(),
    );
    isLoading.value = false;
  }
}
