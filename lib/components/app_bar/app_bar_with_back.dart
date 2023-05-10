import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class AppBarWithBack extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Function() onBack;
  final bool isCenter;
  final IconData leading;
  final Color? color,bgColor;
  const AppBarWithBack(
      {Key? key,
        required this.title,
        this.isCenter = false,
        this.color = Colors.white,
        this.bgColor,
        required this.onBack,
        this.leading = Icons.arrow_back_ios_outlined})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: SizedBox(
        width: double.infinity,
        child: Align(
            alignment: isCenter ? Alignment.center : Alignment.centerLeft,
            child: JoJoText(
                title,
                style: getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s20))
        ),
      ),
      centerTitle: isCenter,
      backgroundColor: bgColor ?? ColorManager.white,
      leading: IconButton(
        icon: Icon(
          leading,
          color: Colors.black,
          size: 25,
        ),
        onPressed: () {
          onBack();
        },
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: SizedBox(width: 25,),
        )
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
