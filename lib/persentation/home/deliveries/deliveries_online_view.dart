
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/home/deliveries/deliveries_customer_view.dart';
import 'package:jojo_taxi/persentation/home/deliveries/request_customer_view.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class DeliveriesOnlineView extends StatefulWidget {
  const DeliveriesOnlineView({Key? key}) : super(key: key);

  @override
  State<DeliveriesOnlineView> createState() => _DeliveriesOnlineViewState();
}

class _DeliveriesOnlineViewState extends State<DeliveriesOnlineView> {
  bool loading = true;

  @override
  void initState() {
    getLoading();
    super.initState();
  }
  void getLoading(){
    Timer(
        const Duration(seconds: 3),
            () => setState(() {
              loading = false;
            }));
  }
  @override
  Widget build(BuildContext context) {
    return !loading ? const DeliveriesCustomerView() : Expanded(
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
