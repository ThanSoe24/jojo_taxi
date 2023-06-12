import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/components/text_field/jojo_text_field.dart';
import 'package:jojo_taxi/domain/model/pass_model.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/routes_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({Key? key}) : super(key: key);

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final PasswordModal  passwordModal = PasswordModal();

  void confirmHandler(){
    if(_formKey.currentState!.validate()){
      setState(() {
        passwordModal.currentPass = _currentPassController.text;
        passwordModal.newPass = _newPassController.text;

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          title: "Confirm Password",
          onBack: () => {Navigator.of(context).pop()}),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const JoJoImage(
                      width: 150,
                      height: 150,
                      imageUrl: ImageAssets.jojoLogo,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    JoJoTextField(
                        controller: _currentPassController,
                        hint: "New Password*",
                        isDigit: true,
                        validationBuilder: ValidationBuilder().phone()),
                    const SizedBox(
                      height: 20,
                    ),
                    JoJoTextField(
                        controller: _newPassController,
                        hint: "Confirm New Password*",
                        isDigit: true,
                        validationBuilder: ValidationBuilder().phone()),
                  ],
                ),
                Column(
                  children: [
                    JoJoBtn(
                      onPressed: () => {
                        Navigator.pushReplacementNamed(context, Routes.loginRoute)
                      },
                      text: "Confirm",
                      color: ColorManager.primary,
                      radius: 50,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
