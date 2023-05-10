import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/domain/repository/auth_repository.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/routes_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _isAuthenticated();
    super.initState();
  }

  _isAuthenticated() {
    Provider.of<AuthRepository>(context, listen: false).isAuthenticated().then(
        (auth) => Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(
                context, auth ? Routes.loginRoute : Routes.loginRoute)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const JoJoImage(
                  width: 150, height: 150, imageUrl: ImageAssets.jojoWhiteLogo, fit: BoxFit.cover, ),
              const SizedBox(
                height: 20,
              ),
              JoJoText("JOJO PETS TAXI",
                  style: getBoldStyle(
                      color: ColorManager.white, fontSize: FontSize.s24)),

            ],
          ),
        ),
      ),
    );
  }
}
