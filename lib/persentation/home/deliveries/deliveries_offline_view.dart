
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          JoJoText("Waiting For A Ride",
              style: getBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s24)),
          const JoJoImage(
              width: double.infinity,
              height: 450,
              imageUrl: ImageAssets.welcomeImage)
        ],
      ),
    );
  }
}
