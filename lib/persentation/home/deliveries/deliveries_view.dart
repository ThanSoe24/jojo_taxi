import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_confirm_dialog.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/home/deliveries/deliveries_offline_view.dart';
import 'package:jojo_taxi/persentation/home/deliveries/deliveries_online_view.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:jojo_taxi/persentation/resources/value_manager.dart';
import 'package:jojo_taxi/utilities/constants.dart';

class DeliveriesView extends StatefulWidget {
  const DeliveriesView({Key? key}) : super(key: key);

  @override
  State<DeliveriesView> createState() => _DeliveriesViewState();
}

class _DeliveriesViewState extends State<DeliveriesView> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
    if (value == true) {
      showDialog(
          context: context,
          builder: (_) => JoJoConfirmDialog(
                enableTitle: false,
                title: " ",
                context: context,
                message:
                    "With switching to online mode, you will receive requests for rides.\n\nAre you sure you want to continue?",
                type: Constants.error,
                action: () {},
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JoJoText("Offline",
                style: getBoldStyle(
                    color: ColorManager.grey2.withOpacity(0.4),
                    fontSize: FontSize.s18)),
            const SizedBox(
              width: 10,
            ),
            Transform.scale(
              scale: 1.5,
              child: Switch(
                value: isSwitched,
                onChanged: toggleSwitch,
                activeColor: ColorManager.primary,
                activeTrackColor: ColorManager.grey2.withOpacity(0.4),
                inactiveThumbColor: ColorManager.primary,
                inactiveTrackColor: ColorManager.grey2.withOpacity(0.4),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            JoJoText("Online",
                style: getBoldStyle(
                    color: ColorManager.success, fontSize: FontSize.s18)),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        isSwitched ? const DeliveriesOnlineView() : const DeliveriesOfflineView(),

      ],
    );
  }
}
