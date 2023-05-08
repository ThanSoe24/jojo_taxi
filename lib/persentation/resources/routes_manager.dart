import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jojo_taxi/persentation/splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text("No Route Found"),
          ),
          body: const Center(
            child: Text("No Route Found"),
          ),
        ));
  }
}
