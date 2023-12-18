import 'dart:html';

import 'package:arbiter_pm/constants/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:arbiter_pm/routes/app_pages.dart';
import 'bindings/bindings.dart';
import 'controllers/theme_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Stripe.publishableKey =
  //     "pk_test_51ONh0oA2615bKGtVvLPcaYgFmuXL3Bcgba5KKnpA0HIwIkIq0khAAXUpDGYngtW4KmpqsCiIRz27WajavvW5pzlf00x8hZezkD";

  //Load our .env file that contains our Stripe Secret key
  //await dotenv.load(fileName: "assets/.env");

  runApp(
    GetMaterialApp(
      title: "Arbiter Project Management",
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: AppPages.routes[1],
      themeMode: Get.put<ThemeController>(ThemeController()).themeMode,
      theme: Themes.darkThemeData,
      darkTheme: Themes.lightThemeData,
    ),
  );
}
