import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/ricecontroller.dart';
import 'package:recipeapp/Widgets/chooseitemtext.dart';
import 'package:recipeapp/Widgets/customitemcontainer.dart';

class ChooseRice extends StatelessWidget {
  const ChooseRice({super.key});

  @override
  Widget build(BuildContext context) {
    // final ricecontroller = Get.find<RiceScreenLogic>();
    final ricecontroller = Get.put(RiceScreenLogic());
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primarycolor,
            foregroundColor: AppColors.whitecolor,
            automaticallyImplyLeading: true,
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(50.0), child: ChooseitemText())),
        body: Obx(
          () => ricecontroller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primarycolor,
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: ricecontroller.ricerecipe.length,
                            itemBuilder: (context, index) {
                              if (index < ricecontroller.ricerecipe.length) {
                                final recipe = ricecontroller.ricerecipe[index];
                                return CustomItemContainer(
                                    image: recipe.image,
                                    text: recipe.label,
                                    ontap: () {
                                      Get.toNamed('/riceDetails',
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
