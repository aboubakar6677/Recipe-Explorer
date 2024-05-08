import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/saladcontroller.dart';
import 'package:recipeapp/Widgets/chooseitemtext.dart';
import 'package:recipeapp/Widgets/customitemcontainer.dart';

class ChooseSalad extends StatelessWidget {
  const ChooseSalad({super.key});

  @override
  Widget build(BuildContext context) {
    // final saladcontroller = Get.find<SaladScreenLogic>();
    final saladcontroller = Get.put(SaladScreenLogic());

    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primarycolor,
            foregroundColor: AppColors.whitecolor,
            automaticallyImplyLeading: true,
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(50.0), child: ChooseitemText())),
        body: Obx(
          () => saladcontroller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primarycolor,
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: saladcontroller.saladrecipe.length,
                            itemBuilder: (context, index) {
                              if (index < saladcontroller.saladrecipe.length) {
                                final recipe =
                                    saladcontroller.saladrecipe[index];
                                return CustomItemContainer(
                                    image: recipe.image,
                                    text: recipe.label,
                                    ontap: () {
                                      Get.toNamed('/saladDetails',
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
