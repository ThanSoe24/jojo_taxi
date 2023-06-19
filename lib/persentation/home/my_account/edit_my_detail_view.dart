import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/btn/jojo_text_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/text_field/jojo_text_field.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';

class EditMyDetailView extends StatefulWidget {
  const EditMyDetailView({Key? key}) : super(key: key);

  @override
  State<EditMyDetailView> createState() => _EditMyDetailViewState();
}

class _EditMyDetailViewState extends State<EditMyDetailView> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _vehicleController = TextEditingController();
  final TextEditingController _vehicleColorController = TextEditingController();
  final TextEditingController _plateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "Edit Profile"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const JoJoImage(
                        width: 150,
                        height: 150,
                        imageUrl: ImageAssets.jojoWhiteLogo),
                    JoJoTextBtn(text: "Edit Picture", onPressed: (){}),
                    const SizedBox(height: 15,),
                    JoJoTextField(
                        controller: _mobileController,
                        hint: "Mobile*",
                        validationBuilder: ValidationBuilder().phone()),
                    const SizedBox(
                      height: 15,
                    ),
                    JoJoTextField(
                        controller: _fullNameController,
                        hint: "Full Name as per IC*",
                        validationBuilder: ValidationBuilder().phone()),
                    const SizedBox(
                      height: 15,
                    ),
                    JoJoTextField(
                        controller: _emailController,
                        hint: "Email*",
                        validationBuilder: ValidationBuilder().phone()),
                    const SizedBox(
                      height: 15,
                    ),
                    JoJoTextField(
                        controller: _vehicleController,
                        hint: "Vehicle Model*",
                        validationBuilder: ValidationBuilder().phone()),
                    const SizedBox(
                      height: 15,
                    ),
                    JoJoTextField(
                        controller: _vehicleColorController,
                        hint: "Vehicle Colour*",
                        validationBuilder: ValidationBuilder().phone()),
                    const SizedBox(
                      height: 15,
                    ),
                    JoJoTextField(
                        controller: _plateController,
                        hint: "Plate Number*",
                        validationBuilder: ValidationBuilder().phone()),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                JoJoBtn(
                  text: "Save",
                  onPressed: () {},
                  color: ColorManager.primary,
                  isBlock: false,
                  radius: 50,
                ),
                JoJoBtn(
                  text: "Cancel",
                  onPressed: () {},
                  color: ColorManager.white,
                  isBlock: false,
                  radius: 50,
                  elevation: 1,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
