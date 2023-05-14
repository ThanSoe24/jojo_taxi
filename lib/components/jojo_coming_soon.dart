import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class JoJoComingSoon extends StatelessWidget {
  const JoJoComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          JoJoText(
            "Coming Soon !",
            style: getBoldStyle(
                color: ColorManager.linkText, fontSize: FontSize.s24),
            isCenter: true,
          ),
          const JoJoImage(
              width: double.infinity,
              height: 400,
              imageUrl: ImageAssets.comingSoonIcon),
          JoJoText(
            "We will notify you once this feature is ready",
            style: getRegularStyle(
                color: ColorManager.black, fontSize: FontSize.s16),
            isCenter: true,
          ),
        ],
      ),
    );
  }
}
