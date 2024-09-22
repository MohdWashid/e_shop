import 'package:e_shop/feautures/auth/presentation/login.dart';
import 'package:e_shop/feautures/auth/presentation/signup.dart';
import 'package:e_shop/feautures/home/presenation/homepage.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? Function(RouteSettings)? onGenerateRoute =
      (RouteSettings settings) {
    //authentication
    switch (settings.name) {
      //Before Login
      case SignupScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => SignupScreen());
      case LoginScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginScreen());
      //after login
      case ProductListScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ProductListScreen());
    }
    return null;
  };
}
