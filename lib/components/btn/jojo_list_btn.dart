import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class JoJoListBtn extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isDisable;

  const JoJoListBtn(
      {required this.text,
      required this.onPressed,
      this.isDisable = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10, top: 10, left: 15),
        margin: const EdgeInsets.only(left: 20, right: 20),
        height: 55,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: ColorManager.grey2, width: 1))),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 6,
                child: JoJoText(
                  text,
                  style: getMediumStyle(
                      color: ColorManager.grey, fontSize: FontSize.s18),
                )),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorManager.grey2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
