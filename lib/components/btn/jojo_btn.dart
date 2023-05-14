import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class JoJoBtn extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isDisable,isBlock;
  final Color color, textColor,borderColor;
  final double radius;
  final double height;
  final double elevation;

  const JoJoBtn(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.textColor = Colors.white,
        this.borderColor = Colors.grey,
      this.radius = 50,
      this.height = 55,
        this.isBlock = true,
      this.isDisable = false,
        this.elevation = 0,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: ColorManager.primaryOpacity70.withOpacity(0.5),
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      colorBrightness: Brightness.light,
      onPressed: isDisable ? null : onPressed,
      minWidth: isBlock ? double.infinity :180,
      height: height,
      elevation: elevation,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color:  borderColor, width: isDisable ? 1 : 0),
        borderRadius: BorderRadius.circular(radius),
      ),
      color: color,
      child: JoJoText(text,
          style: getBoldStyle(
              color: isDisable
                  ? ColorManager.primaryOpacity70
                  : textColor == Colors.white
                      ? color == Colors.white
                          ? ColorManager.grey
                          : Colors.white
                      : textColor,
              fontSize: FontSize.s16)),
    );
  }
}
