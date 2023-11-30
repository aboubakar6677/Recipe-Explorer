// import 'package:awesome_extensions/awesome_extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipeapp/Constants/constants.dart';
// import 'package:recipeapp/Controllers/HomeScreen%20Controller/burgercontroller.dart';

// class RecipieScreen extends StatelessWidget {
//   const RecipieScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<BurgerScreenLogic>();

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Obx(
//             () => controller.isLoading.value
//                 ? const Center(
//                     child: CircularProgressIndicator(
//                       color: AppColors.primarycolor,
//                     ),
//                   )
//                 : Column(
//                     children: [
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: controller.recipes.length,
//                           itemBuilder: (context, index) {
//                             if (index < controller.recipes.length) {
//                               final recipe = controller.recipes[index];
//                               return Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(8),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey.withOpacity(0.5),
//                                         spreadRadius: 2,
//                                         blurRadius: 5,
//                                         offset: const Offset(0, 2),
//                                       )
//                                     ],
//                                   ),
//                                   child: ListTile(
//                                     dense: true,
//                                     // leading: Image.network(
//                                     //   recipe.image,
//                                     //   width: 100, // Adjust the size as needed
//                                     //   height: 100, // Adjust the size as needed
//                                     // ),
//                                     title: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text("Label".toUpperCase())
//                                             .textColor(AppColors.primarycolor)
//                                             .fontSize(20)
//                                             .fontWeight(FontWeight.bold),
//                                         Text(recipe.label.toUpperCase())
//                                             .textColor(AppColors.primarycolor)
//                                             .fontSize(12)
//                                             .fontWeight(FontWeight.bold),
//                                       ],
//                                     ),
//                                     subtitle: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text("Dishtype".toUpperCase())
//                                             .textColor(AppColors.primarycolor)
//                                             .fontSize(18)
//                                             .fontWeight(FontWeight.bold),
//                                         Text(recipe.dishType.toString())
//                                             .textColor(AppColors.primarycolor),
//                                       ],
//                                     ),
//                                     trailing: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text("Cuisine Type".toUpperCase())
//                                             .textColor(AppColors.primarycolor)
//                                             .fontSize(18)
//                                             .fontWeight(FontWeight.bold),
//                                         Text(recipe.cuisineType.toString())
//                                             .textColor(AppColors.primarycolor),
//                                       ],
//                                     ),
//                                   ),
                                
//                                 ),
//                               );
//                             } else {
//                               return Container();
//                             }
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:recipeapp/Constants/constants.dart';
// // import 'package:recipeapp/Services/burgergetxservices.dart';

// // class RecipieScreen extends StatelessWidget {
// //   const RecipieScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final controller = Get.put(BurgerScreenLogic());

// //     return Scaffold(
// //       body: SafeArea(
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Obx(
// //             () => controller.isLoading.value
// //                 ? const Center(
// //                     child: CircularProgressIndicator(
// //                       color: AppColors.primarycolor,
// //                     ),
// //                   )
// //                 : Column(
// //                     children: [
// //                       Expanded(
// //                         child: ListView.builder(
// //                           itemCount: controller.ingredients.length,
// //                           itemBuilder: ((context, index) {
// //                             return ListTile(
// //                               title: Image.network(
// //                                 controller.ingredients[index].image,
// //                                 width: 50, // Set the width as needed
// //                                 height: 50, // Set the height as needed
// //                               ),
// //                               // Text(
// //                               //   controller.ingredients[index].image.toString(),
// //                               //   style: const TextStyle(
// //                               //       color: AppColors.primarycolor),
// //                               // ),
// //                               subtitle: Text(
// //                                 controller.ingredients[index].measure
// //                                     .toString(),
// //                                 style: const TextStyle(
// //                                     color: AppColors.whitecolor),
// //                               ),
// //                             );
// //                           }),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
