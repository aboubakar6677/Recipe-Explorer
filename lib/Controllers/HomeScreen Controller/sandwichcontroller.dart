import 'package:get/get.dart';
import 'package:recipeapp/Models/Sandwich%20Model/sandwichmodel.dart';
import 'package:recipeapp/Services/HomeScreen%20API/sandwichapi.dart';

class SandwichScreenLogic extends GetxController {
  RxList<SandwichRecipe> sandwichrecipe = <SandwichRecipe>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getSandwichData();
  }

  getSandwichData() async {
    isLoading.value = true;
    SandwichModelClass? response = await SandwichApiServices().fetchSandwichData();
    sandwichrecipe.addAll(
      response.hits.map((hit) => hit.recipe).toList(),
    );
    isLoading.value = false;
  }
}
