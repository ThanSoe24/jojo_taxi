
import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class DeliveriesOfflineView extends StatefulWidget {
  const DeliveriesOfflineView({Key? key}) : super(key: key);

  @override
  State<DeliveriesOfflineView> createState() => _DeliveriesOfflineViewState();
}

class _DeliveriesOfflineViewState extends State<DeliveriesOfflineView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 60,),
          JoJoText("You are Offline",
              style: getBoldStyle(
                  color: ColorManager.grey2, fontSize: FontSize.s24)),
          const SizedBox(height: 30,),
          const JoJoImage(
              width: 300,
              height: 300,
              imageUrl: ImageAssets.jojoLogo)
        ],
      ),
    );
  }
}
