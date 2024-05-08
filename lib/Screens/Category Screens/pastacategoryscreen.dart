import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/pastacontroller.dart';
import 'package:recipeapp/Widgets/chooseitemtext.dart';
import 'package:recipeapp/Widgets/customitemcontainer.dart';

class ChoosePasta extends StatelessWidget {
  const ChoosePasta({super.key});

  @override
  Widget build(BuildContext context) {
    // final pastacontroller = Get.find<PastaScreenLogic>();
    final pastacontroller = Get.put(PastaScreenLogic());

    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primarycolor,
            foregroundColor: AppColors.whitecolor,
            automaticallyImplyLeading: true,
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(50.0), child: ChooseitemText())),
        body: Obx(
          () => pastacontroller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primarycolor,
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: pastacontroller.pastarecipes.length,
                            itemBuilder: (context, index) {
                              if (index < pastacontroller.pastarecipes.length) {
                                final recipe =
                                    pastacontroller.pastarecipes[index];
                                return CustomItemContainer(
                                    image: recipe.image,
                                    text: recipe.label,
                                    ontap: () {
                                      Get.toNamed('/pastaDetails',
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
