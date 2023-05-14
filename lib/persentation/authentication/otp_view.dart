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
import 'package:jojo_taxi/persentation/resources/routes_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPView extends StatefulWidget {
  const OTPView({Key? key}) : super(key: key);

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          title: "Reset Password", onBack: () => {Navigator.of(context).pop()}),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  JoJoText("A 6 digit code was sent to +6016*****12",
                      style: getMediumStyle(
                          color: ColorManager.grey, fontSize: FontSize.s18)),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      enableActiveFill: true,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8.0),
                          fieldHeight: 60,
                          fieldWidth: 50,
                          activeColor: ColorManager.white,
                          inactiveFillColor: ColorManager.white,
                          inactiveColor: ColorManager.white,
                          activeFillColor: ColorManager.white,
                          selectedColor: ColorManager.white,
                          selectedFillColor: ColorManager.white),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      cursorColor: Colors.black,
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.black12,
                          blurRadius: 5,
                        )
                      ],
                      onChanged: (value) {
                        debugPrint(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: JoJoText("Didn't receive the verification OTP?",
                        style: getMediumStyle(
                            color: ColorManager.grey, fontSize: FontSize.s18)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      JoJoText("Click Resend code button after ",
                          style: getRegularStyle(
                              color: ColorManager.linkText,
                              fontSize: FontSize.s18)),
                      JoJoText("00:25",
                          style: getBoldStyle(
                              color: ColorManager.linkText,
                              fontSize: FontSize.s18)),
                      JoJoText(" sec",
                          style: getRegularStyle(
                              color: ColorManager.linkText,
                              fontSize: FontSize.s18)),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              JoJoBtn(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.newPasswordRoute);
                },
                text: "Verify",
                color: ColorManager.primary,
                radius: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
