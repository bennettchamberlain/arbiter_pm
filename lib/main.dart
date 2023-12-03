import 'package:arbiter_pm/constants/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
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
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);
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
