import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/AuthControllers/signupgetx.dart';
import 'package:recipeapp/Screens/Profile%20Screen/profileedit.dart';
import 'package:recipeapp/Widgets/widgetprofile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignupLogic signupLogic = Get.put(SignupLogic());

    return Scaffold(
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
                Text(AppStrings.profilescreen.toUpperCase())
                    .textColor(AppColors.whitecolor)
                    .fontSize(29)
                    .fontFamily("PoppinsBold"),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: signupLogic
                  .fetchUserData(FirebaseAuth.instance.currentUser?.uid ?? ""),
              builder:
                  (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return const Center(child: CircularProgressIndicator());
                // } else
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/png/profile.jpg', // Placeholder image if no profile picture
                                fit: BoxFit.cover,
                                height: 162,
                                width: 162,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 110,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: AppColors.whitecolor,
                                    borderRadius: BorderRadius.circular(60)),
                                child: IconButton(
                                  onPressed: () {
                                    Get.to(
                                      () => const ProfileEdit(),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: AppColors.primarycolor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60),
                      Container(
                        decoration: const BoxDecoration(),
                        child: const Column(
                          children: [
                            WidgetProfileDetails(
                              text: 'Name :',
                              answers: "Your Name",
                            ),
                            Divider(thickness: 1, color: AppColors.greycolor),
                            SizedBox(height: 8),
                            WidgetProfileDetails(
                                text: 'Email :', answers: "Your Email"),
                            Divider(thickness: 1, color: AppColors.greycolor),
                            SizedBox(height: 8),
                            WidgetProfileDetails(
                                text: 'Contact :', answers: "Your Contact"),
                            Divider(thickness: 1, color: AppColors.greycolor),
                            SizedBox(height: 8),
                            WidgetProfileDetails(
                                text: 'Address :', answers: "Your Address"),
                            Divider(thickness: 1, color: AppColors.greycolor),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  // Use the fetched data to populate profile details
                  Map<String, dynamic> userData = snapshot.data!;
                  String profilePicture = userData[AppStrings.profilepic] ?? '';
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: userData[AppStrings.profilepic] != null
                                  ? Image.asset(
                                      profilePicture,
                                      fit: BoxFit.cover,
                                      height: 162,
                                      width: 162,
                                    )
                                  : Image.asset(
                                      'assets/png/profile.jpg', // Placeholder image if no profile picture
                                      fit: BoxFit.cover,
                                      height: 162,
                                      width: 162,
                                    ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 110,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: AppColors.whitecolor,
                                    borderRadius: BorderRadius.circular(60)),
                                child: IconButton(
                                  onPressed: () {
                                    Get.to(
                                      () => const ProfileEdit(),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: AppColors.primarycolor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60),
                      Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          children: [
                            WidgetProfileDetails(
                              text: 'Name :',
                              answers: userData[AppStrings.firebaseusername],
                            ),
                            const Divider(
                                thickness: 1, color: AppColors.greycolor),
                            const SizedBox(height: 8),
                            WidgetProfileDetails(
                                text: 'Email :',
                                answers: userData[AppStrings.useremail]),
                            const Divider(
                                thickness: 1, color: AppColors.greycolor),
                            const SizedBox(height: 8),
                            WidgetProfileDetails(
                                text: 'Contact :',
                                answers: userData[AppStrings.userphone]),
                            const Divider(
                                thickness: 1, color: AppColors.greycolor),
                            const SizedBox(height: 8),
                            WidgetProfileDetails(
                                text: 'Address :',
                                answers: userData[AppStrings.useraddress]),
                            const Divider(
                                thickness: 1, color: AppColors.greycolor),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}

// customRowWidgt(
//   String title,
//   String subtitle,
// ) {
//   return Container(
//     height: 50,
//     decoration: BoxDecoration(
//         border: Border.all(color: AppColors.primarycolor),
//         color: AppColors.whitecolor,
//         boxShadow: const [BoxShadow(offset: Offset(0, 2))]),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         CustomText(
//           text: title,
//           fontSize: 15.0,
//           color: AppColors.blackcolor,
//         ),
//         CustomText(
//           text: subtitle,
//           fontSize: 16.0,
//           color: AppColors.blackcolor,
//           fontWeight: FontWeight.w700,
//         ),
//       ],
//     ),
//   );
// }
