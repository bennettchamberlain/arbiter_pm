// ignore_for_file: constant_identifier_names

import 'package:arbiter_pm/views/payment_view.dart';
import 'package:get/get.dart';
import '../bindings/bindings.dart';
import '../views/admin_view.dart';
import '../views/home_view.dart';
import '../views/unknown_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const UNKNOWN = Routes.UNKNOWN;
  static const INVOICE = Routes.INVOICE;
  static const ADMIN = Routes.ADMIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: Binding(),
    ),
    GetPage(
      name: _Paths.UNKNOWN,
      page: () => const UnknownPage(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => const PaymentView(),
      binding: Binding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminView(),
      binding: Binding(),
    )
  ];
}
