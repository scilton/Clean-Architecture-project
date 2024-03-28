import 'package:flutter/material.dart';
import 'package:untitled3/features/splash/presentation/screens/splash_screen.dart';

import '../../features/test/presentation/screens/screen1.dart';
import '../../features/test/presentation/screens/screen2.dart';

class Routes {
  static const String initialRoute = '/';
  static const String screen1Route = '/screen1';
  static const String screen2Route = '/screen2';
}

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.screen1Route:
        return MaterialPageRoute(builder: (context) => Screen1());
      case Routes.screen2Route:
        return MaterialPageRoute(
            builder: (context) => const Screen2(),
            settings: RouteSettings(arguments: 5));
      default:
        return null;
    }
  }
}
