import 'package:get/get.dart';
import 'package:recipeapp/Models/Pizza%20Model/pizzamodel.dart';
import 'package:recipeapp/Services/HomeScreen%20API/pizaaapi.dart';

class PizzaScreenLogic extends GetxController {
  RxList<PizzaRecipe> pizzarecipes = <PizzaRecipe>[].obs;
  RxBool isLoading = true.obs;

  @override
  onInit() {
    super.onInit();
    getPizzadata();
  }

  getPizzadata() async {
    isLoading.value = true;
    PizzaModelClass? response = await PizzaApiServices().fetchPizzaData();
    pizzarecipes.addAll(
      response.hits.map((hit) => hit.recipe).toList(),
    );

    isLoading.value = false;
  }
}
