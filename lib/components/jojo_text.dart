import 'package:flutter/material.dart';

class JoJoText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool isCenter;
  final bool wrapText;
  final TextOverflow textOverflow;

  const JoJoText(this.text,
      {required this.style,
        this.isCenter = false,
        this.wrapText = true,
        this.textOverflow = TextOverflow.visible,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: wrapText,
      style: style,
      overflow: textOverflow,
      textAlign: isCenter ? TextAlign.center : TextAlign.start,
      textScaleFactor: 1,

    );
  }
}
