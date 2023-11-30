import 'package:get/get.dart';
import 'package:recipeapp/Models/Rice%20Model/ricemodel.dart';
import 'package:recipeapp/Services/HomeScreen%20API/riceapi.dart';

class RiceScreenLogic extends GetxController {
  RxList<RiceRecipe> ricerecipe = <RiceRecipe>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getRiceData();
  }

  getRiceData() async {
    isLoading.value = true;
    RiceModelClass? response = await RiceApiServices().fetchRiceData();
    ricerecipe.addAll(
      response.hits.map((hit) => hit.recipe).toList(),
    );
    isLoading.value = false;
  }
}
