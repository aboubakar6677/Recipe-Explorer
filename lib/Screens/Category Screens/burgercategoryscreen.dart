import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/burgercontroller.dart';
import 'package:recipeapp/Widgets/chooseitemtext.dart';
import 'package:recipeapp/Widgets/customitemcontainer.dart';

class ChooseBurger extends StatelessWidget {
  const ChooseBurger({super.key});

  @override
  Widget build(BuildContext context) {
    BurgerScreenLogic burgercontroller = Get.find();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primarycolor,
          foregroundColor: AppColors.whitecolor,
          automaticallyImplyLeading: true,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(50.0), child: ChooseitemText())),
      body: Obx(
        () => burgercontroller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primarycolor,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: burgercontroller.recipes.length,
                      itemBuilder: (context, index) {
                        if (index < burgercontroller.recipes.length) {
                          final recipe = burgercontroller.recipes[index];
                          return CustomItemContainer(
                            image: recipe.image,
                            text: recipe.label,
                            ontap: () {
                              Get.toNamed('/burgerDetails', arguments: recipe);
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
