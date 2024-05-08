import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/wrapcontroller.dart';
import 'package:recipeapp/Widgets/chooseitemtext.dart';
import 'package:recipeapp/Widgets/customitemcontainer.dart';

class ChooseWrap extends StatelessWidget {
  const ChooseWrap({super.key});

  @override
  Widget build(BuildContext context) {
    // final sandwichcontroller = Get.find<SandwichScreenLogic>();
    final wrapcontroller = Get.put(WrapScreenLogic());

    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primarycolor,
            foregroundColor: AppColors.whitecolor,
            automaticallyImplyLeading: true,
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(50.0), child: ChooseitemText())),
        body: Obx(
          () => wrapcontroller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primarycolor,
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: wrapcontroller.wraprecipe.length,
                            itemBuilder: (context, index) {
                              if (index <
                                  wrapcontroller.wraprecipe.length) {
                                final recipe =
                                    wrapcontroller.wraprecipe[index];
                                return CustomItemContainer(
                                    image: recipe.image,
                                    text: recipe.label,
                                    ontap: () {
                                      Get.toNamed('/sandwichDetails',
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
