import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/bindings.dart';
import '../views/invoice_view_.dart';
import '../views/home_view.dart';
import '../views/storefront_view_.dart';
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
      page: () => HomeView(),
      binding: Binding(),
    ),
    GetPage(
      name: _Paths.UNKNOWN,
      page: () => UnknownPage(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => InvoiceView(),
      binding: Binding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => StorefrontView(),
      binding: Binding(),
    )
  ];
}
