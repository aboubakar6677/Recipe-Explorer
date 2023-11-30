import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/pizzacontroller.dart';
import 'package:recipeapp/Widgets/chooseitemtext.dart';
import 'package:recipeapp/Widgets/customitemcontainer.dart';

class ChoosePizza extends StatelessWidget {
  const ChoosePizza({super.key});

  @override
  Widget build(BuildContext context) {
    final pizzacontroller = Get.find<PizzaScreenLogic>();

    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primarycolor,
            foregroundColor: AppColors.whitecolor,
            automaticallyImplyLeading: true,
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(50.0), child: ChooseitemText())),
        body: Obx(
          () => pizzacontroller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primarycolor,
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: pizzacontroller.pizzarecipes.length,
                            itemBuilder: (context, index) {
                              if (index < pizzacontroller.pizzarecipes.length) {
                                final recipe =
                                    pizzacontroller.pizzarecipes[index];
                                return CustomItemContainer(
                                    image: recipe.image,
                                    text: recipe.label,
                                    ontap: () {
                                      Get.toNamed('/pizzaDetails',
                                          arguments: recipe);
                                    });
                              } else {
                                return Container();
                              }
                            }))
               
                  ],
                ),
        ));
  }
}
