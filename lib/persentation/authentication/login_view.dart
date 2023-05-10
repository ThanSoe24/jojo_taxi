import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/btn/jojo_text_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/components/text_field/jojo_text_field.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/routes_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _phoneController = TextEditingController();

  void forgotHandler(BuildContext context) {
    Navigator.pushNamed(context, Routes.forgotRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const JoJoImage(
                width: 150,
                height: 150,
                imageUrl: ImageAssets.jojoLogo,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 40,
              ),
              JoJoText("Welcome",
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s24)),
              const SizedBox(
                height: 40,
              ),
              JoJoTextField(
                  controller: _phoneController,
                  hint: "Phone No*",
                  isDigit: true,
                  validationBuilder: ValidationBuilder().phone()),
              const SizedBox(
                height: 20,
              ),
              JoJoTextField(
                  controller: _phoneController,
                  hint: "Password*",
                  isDigit: true,
                  validationBuilder: ValidationBuilder().phone()),
              Align(
                  alignment: Alignment.bottomRight,
                  child: JoJoTextBtn(
                    text: "Forgot Password",
                    onPressed: () => {forgotHandler(context)},
                  )),
              const SizedBox(
                height: 60,
              ),
              JoJoBtn(
                onPressed: () => {},
                text: "Sign In",
                color: ColorManager.primary,
                radius: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
