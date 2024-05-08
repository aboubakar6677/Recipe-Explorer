// import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'dart:io';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/fav_controller.dart';
import 'package:recipeapp/Screens/Auth%20with%20Firebase/login.dart';
import 'package:recipeapp/Screens/Category%20Screens/burgercategoryscreen.dart';
import 'package:recipeapp/Screens/Category%20Screens/pastacategoryscreen.dart';
import 'package:recipeapp/Screens/Category%20Screens/pizzacategoryscreen.dart';
import 'package:recipeapp/Screens/Category%20Screens/ricecategoryscreen.dart';
import 'package:recipeapp/Screens/Category%20Screens/roastcategoryscreen.dart';
import 'package:recipeapp/Screens/Category%20Screens/saladcategoryscreen.dart';
import 'package:recipeapp/Screens/Category%20Screens/sandwichcategoryscreen.dart';
import 'package:recipeapp/Screens/Category%20Screens/wrapcategoryscreen.dart';
import 'package:recipeapp/Screens/Favorite%20Item%20Screen/favorit.dart';
import 'package:recipeapp/Screens/Forget%20Password/forgetpsswordfirebase.dart';
import 'package:recipeapp/Screens/Profile%20Screen/profilescreen.dart';
import 'package:recipeapp/Screens/about/details.dart';
import 'package:recipeapp/Services/HomeScreen%20API/burgerfetchapi.dart';
import 'package:recipeapp/Services/HomeScreen%20API/pastaapi.dart';
import 'package:recipeapp/Services/HomeScreen%20API/pizaaapi.dart';
import 'package:recipeapp/Services/HomeScreen%20API/riceapi.dart';
import 'package:recipeapp/Services/HomeScreen%20API/roastapi.dart';
import 'package:recipeapp/Services/HomeScreen%20API/saladapi.dart';
import 'package:recipeapp/Services/HomeScreen%20API/sandwichapi.dart';
import 'package:recipeapp/Services/HomeScreen%20API/wrapapi.dart';
import 'package:recipeapp/Widgets/customhomerow.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  int searchCount = 0;
  final TextEditingController _searchController = TextEditingController();
  User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetail() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.email)
        .get();
  }

  late SharedPreferences sp;

  File? image;
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

  getData() async {
    sp = await SharedPreferences.getInstance();
    getImagePath();
  }

  Future<void> getImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('imagePath');
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

  _shareApp() {
    const String appLink =
        'https://play.google.com/store/apps/details?id=com.app.recipeapp';
    const String message = 'Check out this awesome  Recipe_app: $appLink';

    Share.share(message);
  }

  // final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    FavouriteCounterController favouriteCounterController = Get.find();
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
                highlightColor: Colors.transparent,
                icon:
                    const Icon(Icons.filter_list, color: AppColors.whitecolor),
                onPressed: () {
                  _key.currentState?.openDrawer();
                })),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(children: [
                  Expanded(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColors.whitecolor,
                            borderRadius: BorderRadius.circular(6)),
                        child: TextField(
                            textInputAction: TextInputAction.search,
                            controller: _searchController,
                            onChanged: (text) {
                              // You can perform live search as the user types, if needed
                              // For example, you can call a function to fetch data here
                              // fetchData(text);
                            },
                            onSubmitted: (text) {
                              // Handle search when the user submits the text
                              // You can call your search function here
                              // SearchAPiServices().fetchSearchData(text.trim());
                              // String trimmedText = text.trim();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => SearchResultsScreen(
                              //         searchData: trimmedText),
                              //   ),
                              // );
                              if (_searchController.text.toLowerCase() ==
                                  'pizza') {
                                Get.to(() => const ChoosePizza());
                              } else if (_searchController.text.toLowerCase() ==
                                  'burger') {
                                Get.to(() => const ChooseBurger());
                              } else if (_searchController.text.toLowerCase() ==
                                  'pasta') {
                                Get.to(() => const ChoosePasta());
                              } else if (_searchController.text.toLowerCase() ==
                                  'roast') {
                                Get.to(() => const ChooseRoast());
                              } else if (_searchController.text.toLowerCase() ==
                                  'rice') {
                                Get.to(() => const ChooseRice());
                              } else if (_searchController.text.toLowerCase() ==
                                  'wrap') {
                                Get.to(() => const ChooseWrap());
                              } else if (_searchController.text.toLowerCase() ==
                                  'sandwich') {
                                Get.to(() => const ChooseSandwich());
                              } else if (_searchController.text.toLowerCase() ==
                                  'salad') {
                                Get.to(() => const ChooseSalad());
                              }
                            },
                            cursorColor: AppColors.greycolor,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 25),
                                isDense: true,
                                hintText: "Search",
                                hintStyle: const TextStyle(
                                    color: AppColors.greycolor, fontSize: 15),
                                prefixIcon: const Icon(Icons.search,
                                    size: 20, color: AppColors.greycolor),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(6))))),
                  ),
                ]))),
        backgroundColor: AppColors.primarycolor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: IconButton(
                    onPressed: () {
                      if (favouriteCounterController.favoriteItems.isNotEmpty) {
                        Get.to(() => const FavouriteListScreen());
                      } else {
                        Get.to(() => const FavouriteListScreen());
                        QuickAlert.show(
                            confirmBtnTextStyle: const TextStyle(
                                fontSize: 18, color: AppColors.whitecolor),
                            confirmBtnColor: AppColors.primarycolor,
                            text: "Favorites item list is empty.",
                            context: context,
                            type: QuickAlertType.info,
                            confirmBtnText: "OK",
                            onConfirmBtnTap: () {
                              Get.back();
                            });
                      }
                    },
                    icon:
                        const Icon(Icons.favorite, color: AppColors.whitecolor),
                  ),
                ),
                PopupMenuButton(
                  surfaceTintColor: AppColors.whitecolor,
                  elevation: 30,
                  tooltip: "More",
                  position: PopupMenuPosition.under,
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        if (FirebaseAuth.instance.currentUser != null) {
                          Get.to(() => const ProfileScreen());
                        } else {
                          Get.to(() => const ProfileScreen());

                          QuickAlert.show(
                            confirmBtnTextStyle: const TextStyle(
                                fontSize: 18, color: AppColors.whitecolor),
                            confirmBtnColor: AppColors.primarycolor,
                            text: "You are not logged in.",
                            context: context,
                            type: QuickAlertType.info,
                            confirmBtnText: "OK",
                            onConfirmBtnTap: () {
                              Get.back();
                            },
                          );
                        }
                      },
                      child:
                          const Text("My Profile").fontFamily("PoppinsLight"),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        Get.to(() => const ForgetPassword());
                      },
                      child: const Text("Reset Password")
                          .fontFamily("PoppinsLight"),
                    ),
                    PopupMenuItem(
                      onTap: () async {
                        signOut();
                      },
                      child: const Text("Logout").fontFamily("PoppinsLight"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: _viewPhoto,
                      child: ClipOval(
                        child: image != null
                            ? Image.file(image!,
                                width: 80, height: 80, fit: BoxFit.cover)
                            : Image.asset('assets/png/profile.jpg',
                                fit: BoxFit.cover, height: 80, width: 80),
                      ),
                    ),
                    const SizedBox(width: 15),
                    FutureBuilder(
                        future: getUserDetail(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            // return Text('Error: ${snapshot.error}');
                            return const Text(
                              'User is not Logged in...',
                              style: TextStyle(fontSize: 11),
                            );
                          } else {
                            Map<String, dynamic>? userData =
                                snapshot.data!.data();

                            return Container(
                              width: 170,
                              padding: const EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('Name:')
                                      .fontSize(11)
                                      .fontFamily(FontRes.poppinsmedium),
                                  Text(userData![AppStrings.firebaseusername])
                                      .textColor(AppColors.primarycolor)
                                      .fontFamily(FontRes.poppinsbold)
                                      .fontSize(13),
                                  const Text('Email:')
                                      .fontSize(11)
                                      .fontFamily(FontRes.poppinsmedium),
                                  Text(userData[AppStrings.useremail])
                                      .textColor(AppColors.primarycolor)
                                      .fontFamily(FontRes.poppinsbold)
                                      .fontSize(11),
                                ],
                              ),
                            );
                          }
                        })
                  ],
                ),
              ),
              Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        const Icon(Icons.share, color: AppColors.primarycolor),
                        const SizedBox(width: 20),
                        const Text('Share  App')
                            .fontFamily(FontRes.poppinsmedium)
                      ],
                    ),
                    onTap: () {
                      // if (FirebaseAuth.instance.currentUser != null) {
                      //   Get.to(() => const ProfileScreen());
                      // } else {
                      //   Get.to(() => const ProfileScreen());

                      //   QuickAlert.show(
                      //     confirmBtnTextStyle: const TextStyle(
                      //         fontSize: 18, color: AppColors.whitecolor),
                      //     confirmBtnColor: AppColors.primarycolor,
                      //     text: "You are not logged in.",
                      //     context: context,
                      //     type: QuickAlertType.info,
                      //     confirmBtnText: "OK",
                      //     onConfirmBtnTap: () {
                      //       Get.back();
                      //     },
                      //   );
                      // }
                      // Share.share("https://www.cgit.pk/");
                      _shareApp();
                    },
                  ),
                ],
              ),
              ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.assignment, color: AppColors.primarycolor),
                    const SizedBox(width: 20),
                    const Text('About').fontFamily(FontRes.poppinsmedium),
                  ],
                ),
                onTap: () {
                  Get.to(() => const Detail());
                  // if (favouriteCounterController.favoriteItems.isNotEmpty) {
                  //   Get.off(() => const FavouriteListScreen());
                  // } else {
                  //   Get.off(() => const FavouriteListScreen());
                  //   QuickAlert.show(
                  //       confirmBtnTextStyle: const TextStyle(
                  //           fontSize: 18, color: AppColors.whitecolor),
                  //       confirmBtnColor: AppColors.primarycolor,
                  //       text: "Favorites item list is empty.",
                  //       context: context,
                  //       type: QuickAlertType.info,
                  //       confirmBtnText: "OK",
                  //       onConfirmBtnTap: () {
                  //         Get.back();
                  //       });
                  // }
                },
              ),
              // ListTile(
              //   title: Row(
              //     children: [
              //       const Icon(Icons.person_3, color: AppColors.primarycolor),
              //       const SizedBox(width: 20),
              //       const Text('Person 2').fontFamily(FontRes.poppinsmedium),
              //     ],
              //   ),
              // ),
              // ListTile(
              //   title: Row(
              //     children: [
              //       const Icon(Icons.person_2, color: AppColors.primarycolor),
              //       const SizedBox(width: 20),
              //       const Text('Person 3').fontFamily(FontRes.poppinsmedium),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 250),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.logout, size: 30),
                          onPressed: () {
                            signOut();
                          },
                          color: AppColors.primarycolor),
                      const SizedBox(width: 20),
                      const Text('Log Out')
                          .fontFamily(FontRes.poppinsbold)
                          .fontSize(18)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6, bottom: 12),
                  child: const Text(AppStrings.categories)
                      .textColor(AppColors.whitecolor)
                      .fontSize(22)
                      .fontFamily("PoppinsSemiBold  "),
                ),
                CustomHomeRow(
                    ontap1: () {
                      BurgerApiServices().fetchData();
                      if (FirebaseAuth.instance.currentUser == null) {
                        if (searchCount < 4) {
                          searchCount++;
                          Get.to(() => const ChooseBurger());
                        } else {
                          QuickAlert.show(
                              confirmBtnTextStyle: const TextStyle(
                                  fontSize: 18, color: AppColors.whitecolor),
                              confirmBtnColor: AppColors.primarycolor,
                              text:
                                  "You've reached the limit. Please Log in or Create an account.",
                              customAsset: "assets/png/alert.png",
                              context: context,
                              type: QuickAlertType.warning,
                              confirmBtnText: "OKAY",
                              onConfirmBtnTap: () {
                                Get.offAll(() => const Login());
                              });
                        }
                      } else {
                        Get.to(() => const ChooseBurger());
                      }
                    },
                    ontap2: () {
                      PizzaApiServices().fetchPizzaData();
                      if (FirebaseAuth.instance.currentUser == null) {
                        if (searchCount < 4) {
                          searchCount++;
                          Get.to(() => const ChoosePizza());
                        } else {
                          QuickAlert.show(
                              confirmBtnTextStyle: const TextStyle(
                                  fontSize: 18, color: AppColors.whitecolor),
                              confirmBtnColor: AppColors.primarycolor,
                              text:
                                  "You've reached the limit. Please Log in or Create an account.",
                              customAsset: "assets/png/alert.png",
                              context: context,
                              type: QuickAlertType.warning,
                              confirmBtnText: "OKAY",
                              onConfirmBtnTap: () {
                                Get.offAll(() => const Login());
                              });
                        }
                      } else {
                        Get.to(() => const ChoosePizza());
                      }
                    },
                    image1: AppResources.burger,
                    text1: AppStrings.burgername,
                    image2: AppResources.pizza,
                    text2: AppStrings.pizzaname),
                const SizedBox(height: 10),
                CustomHomeRow(
                    ontap1: () {
                      PastaApiServices().fetchPastaData();
                      if (FirebaseAuth.instance.currentUser == null) {
                        if (searchCount < 4) {
                          searchCount++;
                          Get.to(() => const ChoosePasta());
                        } else {
                          QuickAlert.show(
                              confirmBtnTextStyle: const TextStyle(
                                  fontSize: 18, color: AppColors.whitecolor),
                              confirmBtnColor: AppColors.primarycolor,
                              text:
                                  "You've reached the limit. Please Log in or Create an account.",
                              customAsset: "assets/png/alert.png",
                              context: context,
                              type: QuickAlertType.warning,
                              confirmBtnText: "OKAY",
                              onConfirmBtnTap: () {
                                Get.offAll(() => const Login());
                              });
                        }
                      } else {
                        Get.to(() => const ChoosePasta());
                      }
                    },
                    ontap2: () {
                      RoastApiService().fetchRoastData();
                      if (FirebaseAuth.instance.currentUser == null) {
                        if (searchCount < 4) {
                          searchCount++;
                          Get.to(() => const ChooseRoast());
                        } else {
                          QuickAlert.show(
                              confirmBtnTextStyle: const TextStyle(
                                  fontSize: 18, color: AppColors.whitecolor),
                              confirmBtnColor: AppColors.primarycolor,
                              text:
                                  "You've reached the limit. Please Log in or Create an account.",
                              customAsset: "assets/png/alert.png",
                              context: context,
                              type: QuickAlertType.warning,
                              confirmBtnText: "OKAY",
                              onConfirmBtnTap: () {
                                Get.offAll(() => const Login());
                              });
                        }
                      } else {
                        Get.to(() => const ChooseRoast());
                      }
                    },
                    image1: AppResources.pasta,
                    text1: AppStrings.pastaname,
                    image2: AppResources.roast,
                    text2: AppStrings.roastname),
                const SizedBox(height: 10),
                CustomHomeRow(
                    ontap1: () {
                      RiceApiServices().fetchRiceData();
                      if (FirebaseAuth.instance.currentUser == null) {
                        if (searchCount < 4) {
                          searchCount++;
                          Get.to(() => const ChooseRice());
                        } else {
                          QuickAlert.show(
                              confirmBtnTextStyle: const TextStyle(
                                  fontSize: 18, color: AppColors.whitecolor),
                              confirmBtnColor: AppColors.primarycolor,
                              text:
                                  "You've reached the limit. Please Log in or Create an account.",
                              customAsset: "assets/png/alert.png",
                              context: context,
                              type: QuickAlertType.warning,
                              confirmBtnText: "OKAY",
                              onConfirmBtnTap: () {
                                Get.offAll(() => const Login());
                              });
                        }
                      } else {
                        Get.to(() => const ChooseRice());
                      }
                    },
                    ontap2: () {
                      WrapApiServices().fetchWrapData();
                      if (FirebaseAuth.instance.currentUser == null) {
                        if (searchCount < 4) {
                          searchCount++;
                          Get.to(() => const ChooseWrap());
                        } else {
                          QuickAlert.show(
                              confirmBtnTextStyle: const TextStyle(
                                  fontSize: 18, color: AppColors.whitecolor),
                              confirmBtnColor: AppColors.primarycolor,
                              text:
                                  "You've reached the limit. Please Log in or Create an account.",
                              customAsset: "assets/png/alert.png",
                              context: context,
                              type: QuickAlertType.warning,
                              confirmBtnText: "OKAY",
                              onConfirmBtnTap: () {
                                Get.offAll(() => const Login());
                              });
                        }
                      } else {
                        Get.to(() => const ChooseWrap());
                      }
                    },
                    image1: AppResources.rice,
                    text1: AppStrings.ricename,
                    image2: AppResources.wrap,
                    text2: AppStrings.wrapname),
                const SizedBox(height: 10),
                CustomHomeRow(
                    ontap1: () {
                      SandwichApiServices().fetchSandwichData();
                      if (FirebaseAuth.instance.currentUser == null) {
                        if (searchCount < 4) {
                          searchCount++;
                          Get.to(() => const ChooseSandwich());
                        } else {
                          QuickAlert.show(
                              confirmBtnTextStyle: const TextStyle(
                                  fontSize: 18, color: AppColors.whitecolor),
                              confirmBtnColor: AppColors.primarycolor,
                              text:
                                  "You've reached the limit. Please Log in or Create an account.",
                              customAsset: "assets/png/alert.png",
                              context: context,
                              type: QuickAlertType.warning,
                              confirmBtnText: "OKAY",
                              onConfirmBtnTap: () {
                                Get.offAll(() => const Login());
                              });
                        }
                      } else {
                        Get.to(() => const ChooseSandwich());
                      }
                    },
                    ontap2: () {
                      SaladApiServices().fetchSaladData();
                      if (FirebaseAuth.instance.currentUser == null) {
                        if (searchCount < 4) {
                          searchCount++;
                          Get.to(() => const ChooseSalad());
                        } else {
                          QuickAlert.show(
                              confirmBtnTextStyle: const TextStyle(
                                  fontSize: 18, color: AppColors.whitecolor),
                              confirmBtnColor: AppColors.primarycolor,
                              text:
                                  "You've reached the limit. Please Log in or Create an account.",
                              customAsset: "assets/png/alert.png",
                              context: context,
                              type: QuickAlertType.warning,
                              confirmBtnText: "OKAY",
                              onConfirmBtnTap: () {
                                Get.offAll(() => const Login());
                              });
                        }
                      } else {
                        Get.to(() => const ChooseSalad());
                      }
                    },
                    image1: AppResources.donut,
                    text1: AppStrings.sandwichname,
                    image2: AppResources.salad,
                    text2: AppStrings.saladname),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void signOut() async {
  await FirebaseAuth.instance
      .signOut()
      .then((value) => Get.offAll(() => const Login()));
}
