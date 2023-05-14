import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/components/text_field/jojo_text_field.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController _currentPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  late bool currentPassVisibility = false;
  late bool newPassVisibility = false;
  late bool confirmPassVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "Change Password"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                JoJoTextField(
                    controller: _currentPassController,
                    hint: "Current Password",
                    isPass: currentPassVisibility,
                    isLeading: true,
                    leading: Icon(
                      Icons.lock,
                      color: ColorManager.primary,
                    ),
                    trailing: InkWell(
                        onTap: () {
                          setState(() {
                            currentPassVisibility = !currentPassVisibility;
                          });
                        },
                        child: Icon(
                          currentPassVisibility ? Icons.visibility_off : Icons.visibility,
                          color: ColorManager.grey,
                        )),
                    validationBuilder: ValidationBuilder().minLength(6)),
                const SizedBox(height: 15,),
                JoJoTextField(
                    controller: _newPassController,
                    hint: "New Password",
                    isPass: newPassVisibility,
                    isLeading: true,
                    leading: Icon(
                      Icons.lock,
                      color: ColorManager.primary,
                    ),
                    trailing: InkWell(
                        onTap: () {
                          setState(() {
                            newPassVisibility = !newPassVisibility;
                          });
                        },
                        child: Icon(
                          newPassVisibility ? Icons.visibility_off : Icons.visibility,
                          color: ColorManager.grey,
                        )),
                    validationBuilder: ValidationBuilder().minLength(6)),
                const SizedBox(height: 15,),
                JoJoTextField(
                    controller: _confirmPassController,
                    hint: "Confirm Password",
                    isPass: confirmPassVisibility,
                    isLeading: true,
                    leading: Icon(
                      Icons.lock,
                      color: ColorManager.primary,
                    ),
                    trailing: InkWell(
                        onTap: () {
                          setState(() {
                            confirmPassVisibility = !confirmPassVisibility;
                          });
                        },
                        child: Icon(
                          confirmPassVisibility ? Icons.visibility_off : Icons.visibility,
                          color: ColorManager.grey,
                        )),
                    validationBuilder: ValidationBuilder().minLength(6)),

              ],
            ),
            JoJoBtn(text: "Save", onPressed: (){}, color: ColorManager.primary)
          ],
        ),
      )),
    );
  }
}
