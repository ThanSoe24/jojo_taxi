
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/components/text_field/jojo_text_field.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(title: "Forgot Password", onBack: ()=>{ Navigator.of(context).pop()}),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [

              const Center(
                child: JoJoImage(
                  width: 150, height: 150, imageUrl: ImageAssets.jojoWhiteLogo, fit: BoxFit.cover, ),
              ),
              const SizedBox(
                height: 40,
              ),
              JoJoText("Enter your phone number",
                  style: getMediumStyle(
                      color: ColorManager.grey, fontSize: FontSize.s18)),
              const SizedBox(
                height: 20,
              ),
              JoJoTextField(
                  controller: _phoneController,
                  hint: "Phone No*",
                  isDigit: true,
                  validationBuilder: ValidationBuilder().phone()),
              const SizedBox(
                height: 40,
              ),

              JoJoBtn(
                onPressed: () {},
                text: "Continue",
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
