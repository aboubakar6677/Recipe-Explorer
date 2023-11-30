// // import 'package:awesome_extensions/awesome_extensions.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:recipeapp/Constants/constants.dart';
// // import 'package:recipeapp/Models/Burger%20Model/burgermodel.dart';

// // class BurgerDetailsScreen extends StatelessWidget {
// //   const BurgerDetailsScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final Recipe selectedBurger = Get.arguments as Recipe;
// //     //  final dynamic selectedItem = Get.arguments;
// //     return Scaffold(
// //       appBar: AppBar(
// //           backgroundColor: AppColors.primarycolor,
// //           foregroundColor: AppColors.whitecolor,
// //           automaticallyImplyLeading: false,
// //           leading: IconButton(
// //               onPressed: () {
// //                 Get.back();
// //               },
// //               icon: const Icon(Icons.arrow_back, size: 30)),
// //           bottom: PreferredSize(
// //               preferredSize: const Size.fromHeight(50.0),
// //               child: Padding(
// //                   padding: const EdgeInsets.only(left: 18, bottom: 20),
// //                   child: Row(children: [
// //                     Text(AppStrings.itemdetails.toUpperCase())
// //                         .textColor(AppColors.whitecolor)
// //                         .fontSize(29)
// //                         .fontFamily("PoppinsBold")
// //                   ])))),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             const SizedBox(height: 10),
// //             Image(
// //               width: MediaQuery.sizeOf(context).width,
// //               height: 200,
// //               fit: BoxFit.cover,
// //               image: NetworkImage(
// //                 selectedBurger.image,
// //               ),
// //             ),
// //             const SizedBox(height: 10),
// //             Padding(
// //               padding: const EdgeInsets.all(12.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(selectedBurger.label.toUpperCase())
// //                       .textColor(AppColors.primarycolor)
// //                       .fontSize(18)
// //                       .fontFamily(FontRes.poppinssemibold)
// //                       .textAlignment(TextAlign.left),
// //                   const SizedBox(height: 20),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Expanded(
// //                         child: Text("Dish type :".toUpperCase())
// //                             .textColor(AppColors.primarycolor)
// //                             .fontSize(22)
// //                             .fontFamily(FontRes.poppins),
// //                       ),
// //                       Expanded(
// //                         child: Text(selectedBurger.dishType.toString())
// //                             .textColor(AppColors.whitecolor)
// //                             .fontSize(12)
// //                             .italic(),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 20),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Expanded(
// //                         child: Text("Cuisine Type :".toUpperCase())
// //                             .textColor(AppColors.primarycolor)
// //                             .fontSize(22)
// //                             .fontFamily(FontRes.poppins),
// //                       ),
// //                       Expanded(
// //                         child: Text(selectedBurger.cuisineType.toString())
// //                             .textColor(AppColors.whitecolor)
// //                             .fontSize(13)
// //                             .italic(),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 20),
// //                   Column(
// //                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text("Ingrediants :".toUpperCase())
// //                           .textColor(AppColors.primarycolor)
// //                           .fontSize(22)
// //                           .fontFamily(FontRes.poppins),
// //                       Text(selectedBurger.ingredientLines.toString())
// //                           .textColor(AppColors.whitecolor)
// //                           .fontSize(14),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 20),
// //                   Column(
// //                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text("health labels :".toUpperCase())
// //                           .textColor(AppColors.primarycolor)
// //                           .fontSize(22)
// //                           .fontFamily(FontRes.poppins),
// //                       Text(selectedBurger.healthLabels.toString())
// //                           .textColor(AppColors.whitecolor)
// //                           .fontSize(14),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );

// //   }
// // }
// import 'package:awesome_extensions/awesome_extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipeapp/Constants/constants.dart';

// class GeneralDetailsScreen extends StatelessWidget {
//   const GeneralDetailsScreen({super.key});

//   static Widget buildDetailsScreen({
//     required dynamic selectedItem,
//     required BuildContext context,
//   }) {
//     return Scaffold(
//       backgroundColor: AppColors.whitecolor,
//       appBar: AppBar(
//           backgroundColor: AppColors.primarycolor,
//           foregroundColor: AppColors.whitecolor,
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//               onPressed: () {
//                 Get.back();
//               },
//               icon: const Icon(Icons.arrow_back, size: 30)),
//           bottom: PreferredSize(
//               preferredSize: const Size.fromHeight(50.0),
//               child: Padding(
//                   padding: const EdgeInsets.only(left: 18, bottom: 20),
//                   child: Row(children: [
//                     Text(AppStrings.itemdetails.toUpperCase())
//                         .textColor(AppColors.whitecolor)
//                         .fontSize(29)
//                         .fontFamily("PoppinsBold")
//                   ])))),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image(
//               width: MediaQuery.sizeOf(context).width,
//               height: 200,
//               fit: BoxFit.cover,
//               image: NetworkImage(
//                 selectedItem.image,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(selectedItem.label)
//                       .textColor(AppColors.blackcolor)
//                       .fontSize(20)
//                       .fontFamily(FontRes.poppinssemibold)
//                       .textAlignment(TextAlign.left),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: const Text("Dish Type :")
//                             .textColor(AppColors.blackcolor)
//                             .fontSize(18)
//                             .fontFamily(FontRes.poppins),
//                       ),
//                       Expanded(
//                         child: Text(selectedItem.dishType.toString())
//                             .textColor(AppColors.blackcolor)
//                             .fontSize(12)
//                             .italic(),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: const Text("Cuisine Type :")
//                             .textColor(AppColors.blackcolor)
//                             .fontSize(18)
//                             .fontFamily(FontRes.poppins),
//                       ),
//                       Expanded(
//                         child: Text(selectedItem.cuisineType.toString())
//                             .textColor(AppColors.blackcolor)
//                             .fontSize(13)
//                             .italic(),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text("Meal Type :")
//                           .textColor(AppColors.blackcolor)
//                           .fontSize(18)
//                           .fontFamily(FontRes.poppins),
//                       Text(selectedItem.mealType.toString())
//                           .textColor(AppColors.blackcolor)
//                           .fontSize(14)
//                           .italic(),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("Ingrediants :")
//                           .textColor(AppColors.blackcolor)
//                           .fontSize(18)
//                           .fontFamily(FontRes.poppinsmedium),
//                       const SizedBox(height: 5),
//                       Card(
//                         elevation: 2,
//                         margin: const EdgeInsets.symmetric(horizontal: 8),
//                         child: Column(
//                           children:
//                               (selectedItem.ingredientLines as List<String>)
//                                   .map((ingredient) {
//                             return ListTile(
//                               dense: true,
//                               leading: const Icon(Icons.check),
//                               title: Text(
//                                 ingredient,
//                                 style: const TextStyle(
//                                   color: AppColors.blackcolor,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("Health Labels :")
//                           .textColor(AppColors.blackcolor)
//                           .fontSize(18)
//                           .fontFamily(FontRes.poppinsmedium),
//                       const SizedBox(height: 5),
//                       Card(
//                         color: Colors.orange,
//                         elevation: 2,
//                         margin: const EdgeInsets.symmetric(horizontal: 8),
//                         child: Column(
//                           children: (selectedItem.healthLabels as List<String>)
//                               .map((healthLabels) {
//                             return ListTile(
//                               dense: true,
//                               leading: const Icon(Icons.check,
//                                   color: AppColors.whitecolor),
//                               title: Text(
//                                 healthLabels,
//                                 style: const TextStyle(
//                                   color: AppColors.whitecolor,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),

//                       // Text(selectedItem.healthLabels.toString())
//                       //     .textColor(AppColors.blackcolor)
//                       //     .fontSize(14),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("How To Cook :".toUpperCase())
//                           .textColor(AppColors.blackcolor)
//                           .fontSize(18)
//                           .fontFamily(FontRes.poppinsmedium),
//                       const SizedBox(height: 5),
//                       Text(
//                         selectedItem.uri,
//                         style: const TextStyle(
//                           color: AppColors.blackcolor,
//                           fontSize: 14,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dynamic selectedItem = Get.arguments;

//     return buildDetailsScreen(selectedItem: selectedItem, context: context);
//   }
// }

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';

class GeneralDetailsScreen extends StatefulWidget {
  const GeneralDetailsScreen({super.key});

  @override
  State<GeneralDetailsScreen> createState() => _GeneralDetailsScreenState();
}

class _GeneralDetailsScreenState extends State<GeneralDetailsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  Widget buildDetailsScreen({
    required dynamic selectedItem,
    required BuildContext context,
  }) {
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
            icon: const Icon(Icons.arrow_back, size: 30),
          ),
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
      body: ListView(
        children: [
          Image(
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
              image: NetworkImage(selectedItem.image)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                Text(selectedItem.label)
                    .textColor(AppColors.blackcolor)
                    .fontSize(20)
                    .fontFamily(FontRes.poppinssemibold)
                    .textAlignment(TextAlign.left),
                const SizedBox(height: 20),
                TabBar(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    indicatorColor: AppColors.primarycolor,
                    labelColor: AppColors.primarycolor,
                    indicatorPadding: const EdgeInsets.all(8),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                    controller: tabController,
                    tabs: const [
                      Tab(text: 'Ingredients'),
                      Tab(text: 'Health Labels'),
                      Tab(text: 'Other Info')
                    ]),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 2,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            // const Text("Ingredients :")
                            //     .textColor(AppColors.blackcolor)
                            //     .fontSize(18)
                            //     .fontFamily(FontRes.poppinsmedium),
                            const SizedBox(height: 5),
                            Card(
                              elevation: 2,
                              margin: const EdgeInsets.all(8),
                              child: Column(
                                children: (selectedItem.ingredientLines
                                        as List<String>)
                                    .map((ingredient) {
                                  return ListTile(
                                    leading: Container(
                                      height: 8.0,
                                      width: 8.0,
                                      decoration: const BoxDecoration(
                                        color: Colors.black54,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    title: Text(
                                      ingredient,
                                      style: const TextStyle(
                                        color: AppColors.blackcolor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            // const Text("Health Labels :")
                            //     .textColor(AppColors.blackcolor)
                            //     .fontSize(18)
                            //     .fontFamily(FontRes.poppinsmedium),
                            const SizedBox(height: 5),
                            Card(
                              elevation: 2,
                              margin: const EdgeInsets.all(8),
                              child: Column(
                                children:
                                    (selectedItem.healthLabels as List<String>)
                                        .map((healthLabel) {
                                  return ListTile(
                                    leading: Container(
                                      height: 8.0,
                                      width: 8.0,
                                      decoration: const BoxDecoration(
                                        color: Colors.black54,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    title: Text(
                                      healthLabel,
                                      style: const TextStyle(
                                        color: AppColors.blackcolor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Card(
                              margin: const EdgeInsets.all(8.0),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Dish Type :")
                                        .textColor(AppColors.blackcolor)
                                        .fontSize(18),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(selectedItem.dishType.toString())
                                            .textColor(AppColors.blackcolor)
                                            .fontSize(12)
                                            .italic(),
                                      ],
                                    ),
                                    const Text("Cuisine Type :")
                                        .textColor(AppColors.blackcolor)
                                        .fontSize(18),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(selectedItem.cuisineType
                                                .toString())
                                            .textColor(AppColors.blackcolor)
                                            .fontSize(13)
                                            .italic(),
                                      ],
                                    ),
                                    const Text("Meal Type")
                                        .textColor(AppColors.blackcolor)
                                        .fontSize(18),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(selectedItem.mealType.toString())
                                            .textColor(AppColors.blackcolor)
                                            .fontSize(14)
                                            .italic(),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Text("How To Cook")
                                        .textColor(AppColors.blackcolor)
                                        .fontSize(18),
                                    const SizedBox(height: 5),
                                    Text(
                                      selectedItem.uri,
                                      style: const TextStyle(
                                        color: AppColors.blackcolor,
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 20),
                // const Text("Meal Type :")
                //     .textColor(AppColors.blackcolor)
                //     .fontSize(18)
                //     .fontFamily(FontRes.poppinsmedium),
                // Text(selectedItem.mealType.toString())
                //     .textColor(AppColors.blackcolor)
                //     .fontSize(14)
                //     .italic(),
                // const SizedBox(height: 20),
                // const Text("How To Cook :")
                //     .textColor(AppColors.blackcolor)
                //     .fontSize(18)
                //     .fontFamily(FontRes.poppinsmedium),
                // const SizedBox(height: 5),
                // Text(
                //   selectedItem.uri,
                //   style: const TextStyle(
                //     color: AppColors.blackcolor,
                //     fontSize: 14,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),
                // const SizedBox(height: 20),
              ],
            ),
          ),
        
        ],
      ),
    );
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic selectedItem = Get.arguments;

    return buildDetailsScreen(selectedItem: selectedItem, context: context);
  }
}
