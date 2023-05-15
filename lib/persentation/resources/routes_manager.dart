import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jojo_taxi/persentation/authentication/forgot_password_view.dart';
import 'package:jojo_taxi/persentation/authentication/login_view.dart';
import 'package:jojo_taxi/persentation/authentication/new_password_view.dart';
import 'package:jojo_taxi/persentation/authentication/otp_view.dart';
import 'package:jojo_taxi/persentation/home/home_view.dart';
import 'package:jojo_taxi/persentation/home/my_account/about_view.dart';
import 'package:jojo_taxi/persentation/home/my_account/capacity_view.dart';
import 'package:jojo_taxi/persentation/home/my_account/change_password_view.dart';
import 'package:jojo_taxi/persentation/home/my_account/e_learning_view.dart';
import 'package:jojo_taxi/persentation/home/my_account/edit_my_detail_view.dart';
import 'package:jojo_taxi/persentation/home/my_account/faq_view.dart';
import 'package:jojo_taxi/persentation/home/my_account/history_view.dart';
import 'package:jojo_taxi/persentation/home/my_account/incentives_view.dart';
import 'package:jojo_taxi/persentation/home/my_account/terms_conditions_view.dart';
import 'package:jojo_taxi/persentation/home/my_account/transaction_detail_view.dart';
import 'package:jojo_taxi/persentation/splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/authentication/login";
  static const String forgotRoute = "/authentication/forgot";
  static const String otpRoute = "/authentication/otp";
  static const String newPasswordRoute = "/authentication/newPassword";
  static const String homeRoute = "/home";
  static const String editMyDetailRoute = "/home/my_account/editMyDetail";
  static const String changePassRoute = "/home/my_account/changePass";
  static const String capacityRoute = "/home/my_account/capacity";
  static const String incentivesRoute = "/home/my_account/incentives";
  static const String eLearningRoute = "/home/my_account/eLearning";
  static const String historyRoute = "/home/my_account/history";
  static const String faqRoute = "/home/my_account/faq";
  static const String termsConditionsRoute = "/home/my_account/termsConditions";
  static const String aboutRoute = "/home/my_account/about";
  static const String transactionHistoryRoute = "/home/my_account/transaction";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.forgotRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.otpRoute:
        return MaterialPageRoute(builder: (_) => const OTPView());
      case Routes.newPasswordRoute:
        return MaterialPageRoute(builder: (_) => const NewPasswordView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.editMyDetailRoute:
        return MaterialPageRoute(builder: (_) => const EditMyDetailView());
      case Routes.changePassRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordView());
      case Routes.capacityRoute:
        return MaterialPageRoute(builder: (_) => const CapacityView());
      case Routes.incentivesRoute:
        return MaterialPageRoute(builder: (_) => const IncentivesView());
      case Routes.eLearningRoute:
        return MaterialPageRoute(builder: (_) => const ELearningView());
      case Routes.historyRoute:
        return MaterialPageRoute(builder: (_) => const HistoryView());
      case Routes.faqRoute:
        return MaterialPageRoute(builder: (_) => const FAQView());
      case Routes.termsConditionsRoute:
        return MaterialPageRoute(builder: (_) => const TermsConditionsView());
      case Routes.aboutRoute:
        return MaterialPageRoute(builder: (_) => const AboutView());
      case Routes.transactionHistoryRoute:
        return MaterialPageRoute(builder: (_) => const TransactionDetailView());
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
