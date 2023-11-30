import 'package:get/get.dart';
import 'package:recipeapp/Models/Burger%20Model/burgermodel.dart';
import 'package:recipeapp/Services/HomeScreen%20API/burgerfetchapi.dart';

class BurgerScreenLogic extends GetxController {
  RxList<Recipe> recipes = <Recipe>[].obs;
  RxBool isLoading = true.obs;
  

  @override
  onInit() {
    super.onInit();
    getdata();
  }

  getdata() async {
    isLoading.value = true;
    ModelClass? response = await BurgerApiServices().fetchData();
    recipes.addAll(
      response.hits.map((hit) => hit.recipe).toList(),
    );

    isLoading.value = false;
  }
}





// import 'package:get/get.dart';
// import 'package:recipeapp/Model/burgermodel.dart';
// import 'package:recipeapp/Services/burgerfetchapi.dart';

// class BurgerScreenLogic extends GetxController {
//   RxList<Ingredient> ingredients = <Ingredient>[].obs;
//   RxBool isLoading = true.obs;
//   @override
//   onInit() {
//     super.onInit();
//     getdata();
//   }

//   getdata() async {
//     isLoading.value = true;
//     ModelClass? response = await BurgerApiServices().fetchData();
//     ingredients.addAll(
//       response.hits
//         .map((hit) => hit.recipe.ingredients)
//         .expand((i) => i)
//         .toList()
//         );
//     isLoading.value = false;
//   }
// }
