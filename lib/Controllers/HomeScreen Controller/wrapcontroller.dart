import 'package:get/get.dart';
import 'package:recipeapp/Models/Wrap%20Model/wrapmodel.dart';
import 'package:recipeapp/Services/HomeScreen%20API/wrapapi.dart';

class WrapScreenLogic extends GetxController {
  RxList<WrapRecipe> wraprecipe = <WrapRecipe>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getSaladData();
  }

  getSaladData() async {
    isLoading.value = true;
    WrapModelClass? response = await WrapApiServices().fetchWrapData();
    wraprecipe.addAll(
      response.hits.map((hit) => hit.recipe).toList(),
    );
    isLoading.value = false;
  }
}
