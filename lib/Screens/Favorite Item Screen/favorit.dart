import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/fav_controller.dart';
import 'package:recipeapp/Screens/HomeScreen/HomeScreen.dart';
import 'package:recipeapp/Widgets/customitemcontainer.dart';

class FavouriteListScreen extends StatelessWidget {
  const FavouriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteCounterController favouriteCounterController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      appBar: AppBar(
        backgroundColor: AppColors.primarycolor,
        foregroundColor: AppColors.whitecolor,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 18, bottom: 20),
            child: Row(
              children: [
                Text(AppStrings.fav.toUpperCase())
                    .textColor(AppColors.whitecolor)
                    .fontSize(29)
                    .fontFamily("PoppinsBold  "),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (favouriteCounterController.favoriteItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Uh-oh! Your favorite list is Empty',
                ).textColor(AppColors.blackcolor).fontSize(18),
                TextButton(
                  onPressed: () {
                    Get.off(() => const HomeScreen());
                  },
                  child: const Text("Add your favorite bites!\nTap me")
                      .textColor(AppColors.primarycolor)
                      .fontSize(18)
                      .fontWeight(FontWeight.bold)
                      .textAlignment(TextAlign.center),
                )
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: favouriteCounterController.favoriteItems.length,
            itemBuilder: (context, index) {
              final currentitem =
                  favouriteCounterController.favoriteItems[index];
              return CustomItemContainer(
                  image: currentitem.image,
                  text: currentitem.name,
                  ontap: currentitem.ontap);
            },
          );
        }
      }),
    );
  }
}
