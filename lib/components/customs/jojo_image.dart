import 'package:flutter/material.dart';

class JoJoImage extends StatelessWidget {
  final double width, height;
  final String imageUrl;
  final BoxFit fit;
  final Color? color;
  final bool? isOnline;

  const JoJoImage(
      {Key? key,
      required this.width,
      required this.height,
      this.fit = BoxFit.contain,
      this.color,
      required this.imageUrl,
      this.isOnline = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOnline == false
        ? Image.asset(
            imageUrl,
            height: height,
            width: width,
            fit: fit,
            color: color,
          )
        : Image.network(
            imageUrl,
            height: height,
            width: width,
            fit: fit,
            color: color,
          );
  }
}
