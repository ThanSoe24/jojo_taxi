import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class JoJoInfoList extends StatelessWidget {
  final Widget icon;
  final String text;
  final bool enableTitle;
  final String title;

  const JoJoInfoList(
      {required this.icon,
      required this.text,
      required this.enableTitle,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 30, child: icon),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              enableTitle
                  ? JoJoText(title,
                  style: getBoldStyle(
                      color: ColorManager.grey, fontSize: FontSize.s18))
                  : const SizedBox(),
              SizedBox(
                height: enableTitle ? 5 : 0,
              ),
              SizedBox(
                width: double.infinity,
                child: JoJoText(
                  text,
                  style: getRegularStyle(
                      color: ColorManager.grey, fontSize: FontSize.s14),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
