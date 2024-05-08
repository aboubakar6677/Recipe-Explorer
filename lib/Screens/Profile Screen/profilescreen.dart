import 'dart:io';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Screens/HomeScreen/homescreen.dart';
import 'package:recipeapp/Screens/Profile%20Screen/profileedit.dart';
import 'package:recipeapp/Widgets/widgetprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  bool validate = false;
  File? image;

  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      saveImagePath(pickedFile.path);
    }
  }

  Future<void> showOptions() async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          Container(
            color: AppColors.primarycolor,
            child: Column(
              children: [
                CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  child: const Text('View Picture')
                      .textColor(AppColors.whitecolor),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _viewPhoto();
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(color: AppColors.whitecolor),
                ),
                CupertinoActionSheetAction(
                  child: const Text('Change Picture')
                      .textColor(AppColors.whitecolor),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _changePhoto();
                  },
                ),
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            // Handle the cancel action
            Get.back();
          },
          child: const Text('Cancel').textColor(AppColors.blackcolor),
        ),
      ),
    );
  }

  void _viewPhoto() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.primarycolor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.file(image!,
                          width: 300, height: 350, fit: BoxFit.cover),
                    )
                  : const Text('No picture available'),
              const SizedBox(height: 2),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: SizedBox(
                    width: Get.width,
                    height: 30,
                    child: Center(
                        child: const Text('Close')
                            .textColor(AppColors.whitecolor))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePhoto() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                Container(
                  color: AppColors.primarycolor,
                  child: Column(
                    children: [
                      CupertinoActionSheetAction(
                        child: const Text('Photo Gallery')
                            .textColor(AppColors.whitecolor),
                        onPressed: () {
                          Navigator.of(context).pop();

                          getImageFromGallery();
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(color: AppColors.whitecolor),
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('Camera')
                            .textColor(AppColors.whitecolor),
                        onPressed: () {
                          Navigator.of(context).pop();

                          getImageFromCamera();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }

  @override
  void initState() {
    super.initState();
    loadImagePath();
  }

  Future<void> loadImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('imagePath');
    if (imagePath != null) {
      setState(() {
        image = File(imagePath);
      });
    }
  }

  Future<void> saveImagePath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', path);
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      saveImagePath(pickedFile.path);
    }
  }

  User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetail() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    // SignupLogic signupLogic = Get.put(SignupLogic());

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.profilescreen.toUpperCase())
                    .textColor(AppColors.whitecolor)
                    .fontSize(29)
                    .fontFamily("PoppinsBold"),
                // Container(
                //   margin: const EdgeInsets.only(right: 10),
                //   width: 35,
                //   height: 35,
                //   decoration: BoxDecoration(
                //       color: AppColors.whitecolor,
                //       borderRadius: BorderRadius.circular(60)),
                //   child: IconButton(
                //     onPressed: () {
                //       Get.to(
                //         () => const ProfileEdit(),
                //       );
                //     },
                //     icon: const Icon(
                //       Icons.edit,
                //       size: 20,
                //       color: AppColors.primarycolor,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: getUserDetail(),
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return const Center(child: CircularProgressIndicator());
                // } else
                if (snapshot.hasError) {
                  // return Text('Error: ${snapshot.error}');
                  return const Text('User is not Logged in');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 30),
                      // SizedBox(
                      //   height: 180,
                      //   width: double.infinity,
                      //   child: Stack(
                      //     alignment: Alignment.center,
                      //     children: [
                      //       ClipOval(
                      //         child: Image.asset(
                      //           'assets/png/profile.jpg', // Placeholder image if no profile picture
                      //           fit: BoxFit.cover,
                      //           height: 162,
                      //           width: 162,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(height: 60),
                      // Container(
                      //   decoration: const BoxDecoration(),
                      //   child: const Column(
                      //     children: [
                      //       WidgetProfileDetails(
                      //         text: 'Name :',
                      //         answers: "Your Name",
                      //       ),
                      //       Divider(thickness: 1, color: AppColors.greycolor),
                      //       SizedBox(height: 8),
                      //       WidgetProfileDetails(
                      //           text: 'Email :', answers: "Your Email"),
                      //       Divider(thickness: 1, color: AppColors.greycolor),
                      //       SizedBox(height: 8),
                      //       WidgetProfileDetails(
                      //           text: 'Contact :', answers: "Your Contact"),
                      //       Divider(thickness: 1, color: AppColors.greycolor),
                      //       SizedBox(height: 8),
                      //       WidgetProfileDetails(
                      //           text: 'Address :', answers: "Your Address"),
                      //       Divider(thickness: 1, color: AppColors.greycolor),
                      //     ],
                      //   ),
                      // ),
                    ],
                  );
                } else {
                  // Use the fetched data to populate profile details
                  Map<String, dynamic>? userData = snapshot.data!.data();
                  // String profilePicture =
                  //     userData?[AppStrings.profilepic] ?? '';
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.all(20.0),
                        child: InkWell(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          onTap: showOptions,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipOval(
                                child: image != null
                                    ? Image.file(image!,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover)
                                    : Image.asset('assets/png/profile.jpg',
                                        fit: BoxFit.cover,
                                        height: 120,
                                        width: 120),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: AppColors.whitecolor,
                                      borderRadius: BorderRadius.circular(60)),
                                  child: IconButton(
                                    icon: const Icon(Icons.camera_alt,
                                        size: 20,
                                        color: AppColors.primarycolor),
                                    onPressed: showOptions,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          children: [
                            WidgetProfileDetails(
                              forPass: true,
                              text: 'Name :',
                              answers: userData![AppStrings.firebaseusername],
                              onpress: () {
                                Get.defaultDialog(
                                    title: 'Change Your Name',
                                    titleStyle: const TextStyle(
                                        fontFamily: FontRes.poppinsmedium,
                                        fontSize: 16),
                                    content: TextFormField(
                                      controller: namecontroller,
                                    ),
                                    actions: [
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          FirebaseFirestore.instance
                                              .collection("users")
                                              .doc(currentUser!.email)
                                              .update({
                                            "user_name": namecontroller.text
                                          });
                                          setState(() {});
                                        },
                                        child: updateButton(),
                                      ),
                                    ]);
                              },
                            ),
                            const Divider(
                                thickness: 1, color: AppColors.greycolor),
                            const SizedBox(height: 8),
                            WidgetProfileDetails(
                                text: 'Email :',
                                answers: userData[AppStrings.useremail],
                                forPass: false,
                                onpress: () {}),
                            const Divider(
                                thickness: 1, color: AppColors.greycolor),
                            const SizedBox(height: 8),
                            WidgetProfileDetails(
                                forPass: true,
                                text: 'Contact :',
                                answers: userData[AppStrings.userphone],
                                onpress: () {
                                  Get.defaultDialog(
                                      title: 'Change Your Contact',
                                      titleStyle: const TextStyle(
                                          fontFamily: FontRes.poppinsmedium,
                                          fontSize: 16),
                                      content: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Number is empty";
                                          }
                                          if (!GetUtils.isPhoneNumber(value)) {
                                            return "Format invalid";
                                          }
                                          return null;
                                        },
                                        controller: contactcontroller,
                                      ),
                                      actions: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                            FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(currentUser!.email)
                                                .update({
                                              "user_contact":
                                                  contactcontroller.text
                                            });
                                            setState(() {});
                                          },
                                          child: updateButton(),
                                        ),
                                      ]);
                                }),
                            const Divider(
                                thickness: 1,
                                color: Color.fromRGBO(177, 167, 167, 1)),
                            const SizedBox(height: 8),
                            WidgetProfileDetails(
                                forPass: true,
                                text: 'Address :',
                                answers: userData[AppStrings.useraddress],
                                onpress: () {
                                  Get.defaultDialog(
                                      title: 'Change Your Address',
                                      titleStyle: const TextStyle(
                                          fontFamily: FontRes.poppinsmedium,
                                          fontSize: 16),
                                      content: TextFormField(
                                        controller: addresscontroller,
                                      ),
                                      actions: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                            FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(currentUser!.email)
                                                .update({
                                              "user_address":
                                                  addresscontroller.text
                                            });
                                            setState(() {});
                                          },
                                          child: updateButton(),
                                        ),
                                      ]);
                                }),
                            const Divider(
                                thickness: 1, color: AppColors.greycolor),
                            const SizedBox(height: 100),
                            InkWell(
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              onTap: () {
                                Get.defaultDialog(
                                    title: 'Logout',
                                    content: const Text(
                                        'Do you really want to Logout'),
                                    actions: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Container(
                                              // margin: const EdgeInsets.all(10),
                                              height: 30,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: AppColors.primarycolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: const Text('No')
                                                    .textColor(
                                                        AppColors.whitecolor)
                                                    .fontSize(14)
                                                    .fontFamily("PoppinsBold"),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              signOut();
                                            },
                                            child: Container(
                                              // margin: const EdgeInsets.all(10),
                                              height: 30,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: AppColors.primarycolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: const Text('Yes')
                                                    .textColor(
                                                        AppColors.whitecolor)
                                                    .fontSize(14)
                                                    .fontFamily("PoppinsBold"),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )
                                    ]);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                height: 55,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: AppColors.primarycolor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: const Text('Logout')
                                      .textColor(AppColors.whitecolor)
                                      .fontSize(22)
                                      .fontFamily("PoppinsBold"),
                                ),
                              ),
                            )
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

  Container updateButton() {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 80,
      decoration: BoxDecoration(
          color: AppColors.primarycolor,
          borderRadius: BorderRadius.circular(10)),
      child: const Text("Change")
          .textColor(AppColors.whitecolor)
          .fontSize(14)
          .fontFamily("Poppinsmedium"),
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
