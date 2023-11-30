// import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
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
import 'package:recipeapp/Screens/Category%20Screens/searcheddatascreen.dart';
import 'package:recipeapp/Screens/Favorite%20Item%20Screen/favorit.dart';
import 'package:recipeapp/Screens/Profile%20Screen/profilescreen.dart';
import 'package:recipeapp/Services/HomeScreen%20API/burgerfetchapi.dart';
import 'package:recipeapp/Services/HomeScreen%20API/pastaapi.dart';
import 'package:recipeapp/Services/HomeScreen%20API/pizaaapi.dart';
import 'package:recipeapp/Services/HomeScreen%20API/riceapi.dart';
import 'package:recipeapp/Services/HomeScreen%20API/roastapi.dart';
import 'package:recipeapp/Services/searchapi.dart';
import 'package:recipeapp/Widgets/customhomerow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  int searchCount = 0;
  final TextEditingController _searchController = TextEditingController();

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
                              SearchAPiServices().fetchSearchData(text.trim());
                              String trimmedText = text.trim();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchResultsScreen(
                                      searchData: trimmedText),
                                ),
                              );
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
                      onTap: () {},
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
                    ClipOval(
                      child: Image.asset(
                        "assets/png/profile.jpg",
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    const SizedBox(width: 25),
                    const Text("CGIT Application")
                        .fontFamily(FontRes.poppinsbold)
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
                  //   if (favouriteCounterController.favoriteItems.isNotEmpty) {
                  //     Get.off(() => const FavouriteListScreen());
                  //   } else {
                  //     Get.off(() => const FavouriteListScreen());
                  //     QuickAlert.show(
                  //         confirmBtnTextStyle: const TextStyle(
                  //             fontSize: 18, color: AppColors.whitecolor),
                  //         confirmBtnColor: AppColors.primarycolor,
                  //         text: "Favorites item list is empty.",
                  //         context: context,
                  //         type: QuickAlertType.info,
                  //         confirmBtnText: "OK",
                  //         onConfirmBtnTap: () {
                  //           Get.back();
                  //         });
                  //   }
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.person_3, color: AppColors.primarycolor),
                    const SizedBox(width: 20),
                    const Text('Person 2').fontFamily(FontRes.poppinsmedium),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.person_2, color: AppColors.primarycolor),
                    const SizedBox(width: 20),
                    const Text('Person 3').fontFamily(FontRes.poppinsmedium),
                  ],
                ),
              ),
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
                    },
                    ontap2: () {
                      PizzaApiServices().fetchPizzaData();
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
                    },
                    image1: AppResources.burger,
                    text1: AppStrings.burgername,
                    image2: AppResources.pizza,
                    text2: AppStrings.pizzaname),
                const SizedBox(height: 10),
                CustomHomeRow(
                    ontap1: () {
                      PastaApiServices().fetchPastaData();
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
                    },
                    ontap2: () {
                      RoastApiService().fetchRoastData();
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
                    },
                    image1: AppResources.pasta,
                    text1: AppStrings.pastaname,
                    image2: AppResources.roast,
                    text2: AppStrings.roastname),
                const SizedBox(height: 10),
                CustomHomeRow(
                    ontap1: () {
                      RiceApiServices().fetchRiceData();
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
                    },
                    image1: AppResources.rice,
                    text1: AppStrings.ricename,
                    image2: AppResources.wrap,
                    text2: AppStrings.wrapname),
                const SizedBox(height: 10),
                const CustomHomeRow(
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
