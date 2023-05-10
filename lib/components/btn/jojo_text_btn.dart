import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class JoJoTextBtn extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isDisable;

  const JoJoTextBtn({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isDisable ? null : onPressed,
      child: JoJoText(text,
          style: getMediumStyle(
              color: isDisable ? ColorManager.linkText : ColorManager.linkText,
              fontSize: FontSize.s16)),
    );
  }
}
