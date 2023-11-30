

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Models/Burger%20Model/burgermodel.dart';

class BurgerDetailsScreen extends StatelessWidget {
  const BurgerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Recipe selectedBurger = Get.arguments as Recipe;
      //  final dynamic selectedItem = Get.arguments;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primarycolor,
          foregroundColor: AppColors.whitecolor,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, size: 30)),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: Padding(
                  padding: const EdgeInsets.only(left: 18, bottom: 20),
                  child: Row(children: [
                    Text(AppStrings.itemdetails.toUpperCase())
                        .textColor(AppColors.whitecolor)
                        .fontSize(29)
                        .fontFamily("PoppinsBold")
                  ])))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image(
              width: MediaQuery.sizeOf(context).width,
              height: 200,
              fit: BoxFit.cover,
              image: NetworkImage(
                selectedBurger.image,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(selectedBurger.label.toUpperCase())
                      .textColor(AppColors.primarycolor)
                      .fontSize(18)
                      .fontFamily(FontRes.poppinssemibold)
                      .textAlignment(TextAlign.left),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Dishtype :".toUpperCase())
                          .textColor(AppColors.primarycolor)
                          .fontSize(22)
                          .fontFamily(FontRes.poppins),
                      Text(selectedBurger.dishType.toString())
                          .textColor(AppColors.primarycolor)
                          .fontSize(12)
                          .italic(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Cuisine Type :".toUpperCase())
                          .textColor(AppColors.primarycolor)
                          .fontSize(22)
                          .fontFamily(FontRes.poppins),
                      Text(selectedBurger.cuisineType.toString())
                          .textColor(AppColors.primarycolor)
                          .fontSize(13)
                          .italic(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ingrediants :".toUpperCase())
                          .textColor(AppColors.primarycolor)
                          .fontSize(22)
                          .fontFamily(FontRes.poppins),
                      Text(selectedBurger.ingredientLines.toString())
                          .textColor(AppColors.primarycolor)
                          .fontSize(14),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("health labels :".toUpperCase())
                          .textColor(AppColors.primarycolor)
                          .fontSize(22)
                          .fontFamily(FontRes.poppins),
                      Text(selectedBurger.healthLabels.toString())
                          .textColor(AppColors.primarycolor)
                          .fontSize(14),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class DetailsScreen extends StatelessWidget {
//   final String itemName;
//   final String itemImage;
//   final List<String> ingredientLines;
//   final List<String> healthLabels;
//   final List<String> dishType;

//   const DetailsScreen({
//     super.key,
//     required this.itemName,
//     required this.itemImage,
//     required this.ingredientLines,
//     required this.healthLabels,
//     required this.dishType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(itemName),
//       ),
//       body: Column(
//         children: [
//           // Display item details, such as image, ingredients, etc.
//           Image.network(itemImage),
//           Text('Ingredients: ${ingredientLines.join(', ')}'),
//           Text('Health Labels: ${healthLabels.join(', ')}'),
//           Text('Dish Type: ${dishType.join(', ')}'),
//           // Add more widgets to display additional details
//         ],
//       ),
//     );
//   }
// }
