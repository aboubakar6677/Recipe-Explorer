// import 'package:awesome_extensions/awesome_extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipeapp/Constants/constants.dart';
// import 'package:recipeapp/Controllers/welcomecontroller.dart';
// import 'package:recipeapp/Widgets/custom_button.dart';
// import 'package:recipeapp/Screens/HomeScreen/HomeScreen.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           children: [
//             Expanded(
//                 flex: 4,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 70),
//                     Text(AppStrings.welcome.toUpperCase())
//                         .textColor(AppColors.primarycolor)
//                         .fontSize(53)
//                         .fontFamily("PoppinsBold"),
//                     Text(AppStrings.food.toUpperCase())
//                         .textColor(AppColors.whitecolor)
//                         .fontSize(59)
//                         .fontFamily("PoppinsSemiBold  "),
//                     const Text(AppStrings.descrip)
//                         .textColor(AppColors.whitecolor)
//                         .fontSize(18)
//                         .fontFamily("PoppinsLight")
//                         .textAlignment(TextAlign.left),
//                   ],
//                 )),
//             const SizedBox(height: 50),
//             Expanded(
//               child: Column(
//                 children: [
//                   CustomButton(
//                       labelText: AppStrings.getstart,
//                       onTap: () async {
//                         savewelcomeshown();
//                         Get.offAll(() => const HomeScreen());
//                       }),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
