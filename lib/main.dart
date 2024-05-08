import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/burgercontroller.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/fav_controller.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/pastacontroller.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/pizzacontroller.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/ricecontroller.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/roastcontroller.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/saladcontroller.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/sandwichcontroller.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/wrapcontroller.dart';
import 'package:recipeapp/Screens/Category%20Screens/burgercategoryscreen.dart';
import 'package:recipeapp/Screens/HomeScreen/homescreen.dart';
import 'package:recipeapp/Screens/Recipie%20Screen/item_details_screen.dart';
import 'package:recipeapp/Screens/Splash%20Screen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  print(email);
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA6yaq1TvyanXdkD2ybd-Jkpfxc_U5fyOw",
      appId: "1:293245207756:android:7118acb10b3e9c7dcb2e69",
      messagingSenderId: "372400913121",
      projectId: "recipe-explorer-29ed3",
    ),
  );

  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  final BurgerScreenLogic burgercontroller = Get.put(BurgerScreenLogic());
  final PizzaScreenLogic pizzacontroller = Get.put(PizzaScreenLogic());
  final PastaScreenLogic pastacontroller = Get.put(PastaScreenLogic());
  final RiceScreenLogic ricecontroller = Get.put(RiceScreenLogic());
  final RoastScreenLogic roastcontroller = Get.put(RoastScreenLogic());
  final WrapScreenLogic wrapcontroller = Get.put(WrapScreenLogic());
  final SandwichScreenLogic sandwichcontroller = Get.put(SandwichScreenLogic());
  final SaladScreenLogic saladcontroller = Get.put(SaladScreenLogic());

  final FavouriteCounterController favcountercontroller =
      Get.put(FavouriteCounterController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: ControllerBinidings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primarycolor),
        fontFamily: "Poppins",
        scaffoldBackgroundColor: AppColors.scaffoldcolor,
        useMaterial3: true,
      ),
      // home: const HomeScreen(),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        // GetPage(name: '/welcomescreen', page: () => const WelcomeScreen()),
        GetPage(name: '/homescreen', page: () => const HomeScreen()),
        GetPage(name: '/chooseBurger', page: () => const ChooseBurger()),
        GetPage(
            name: '/burgerDetails', page: () => const GeneralDetailsScreen()),
        GetPage(
            name: '/pizzaDetails', page: () => const GeneralDetailsScreen()),
        GetPage(
            name: '/pastaDetails', page: () => const GeneralDetailsScreen()),
        GetPage(
            name: '/roastDetails', page: () => const GeneralDetailsScreen()),
        GetPage(name: '/riceDetails', page: () => const GeneralDetailsScreen()),
        GetPage(name: '/wrapDetails', page: () => const GeneralDetailsScreen()),

        GetPage(
            name: '/sandwichDetails', page: () => const GeneralDetailsScreen()),
        GetPage(
            name: '/saladDetails', page: () => const GeneralDetailsScreen()),
      ],
    );
  }
}
