import 'package:get/get.dart';
import 'package:recipeapp/Models/Roast%20Model/roastmodel.dart';
import 'package:recipeapp/Services/HomeScreen%20API/roastapi.dart';

class RoastScreenLogic extends GetxController {
  RxList<RoastRecipe> roastrecipe = <RoastRecipe>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getRoastData();
  }

  getRoastData() async {
    isLoading.value = true;
    RoastModelClass? response = await RoastApiService().fetchRoastData();
    roastrecipe.addAll(
      response.hits.map((hit) => hit.recipe).toList(),
    );
    isLoading.value = false;
  }
}
