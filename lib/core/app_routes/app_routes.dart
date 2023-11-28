import 'package:flutter/material.dart';
import 'package:tebalink_task/core/app_routes/app_routes_name.dart';
import 'package:tebalink_task/presentation/view/home_view.dart';
import 'package:tebalink_task/presentation/view/login_view.dart';

import '../../presentation/view/splash_view.dart';

class AppRoutes {
  Route? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case AppRoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );

      case AppRoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
    }
    return null;
  }
}
