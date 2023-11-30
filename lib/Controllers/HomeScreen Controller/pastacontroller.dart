import 'package:get/get.dart';
import 'package:recipeapp/Models/Pasta%20Model/pastamodel.dart';
import 'package:recipeapp/Services/HomeScreen%20API/pastaapi.dart';

class PastaScreenLogic extends GetxController {
  RxList<PastaRecipe> pastarecipes = <PastaRecipe>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getPastaData();
  }

  getPastaData() async {
    isLoading.value = true;
    PastaModelClass? response = await PastaApiServices().fetchPastaData();
    pastarecipes.addAll(
      response.hits.map((hit) => hit.recipe).toList(),
    );
    isLoading.value = false;
  }
}
