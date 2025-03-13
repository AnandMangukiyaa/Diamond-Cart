import 'dart:io';


import 'package:diamond_cart/views/cart_page.dart';
import 'package:diamond_cart/views/dashboard_page.dart';
import 'package:diamond_cart/views/filter_page.dart';
import 'package:diamond_cart/views/result_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String filterPage = '/filter_page';
  static const String resultPage = '/result_page';
  static const String dashboard = '/dashboard';
  static const String cartPage = '/cart_page';
}


class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case Routes.filterPage:
        return MaterialPageRoute(builder: (_) => DiamondFilterPage());
      case Routes.resultPage:
        return MaterialPageRoute(builder: (_) => ResultPage());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardPage());
      case Routes.cartPage:
        return MaterialPageRoute(builder: (_) => CartPage());
      default:
        return null;
    }
  }
}
