
import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/jojo_coming_soon.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class IncentivesView extends StatefulWidget {
  const IncentivesView({Key? key}) : super(key: key);

  @override
  State<IncentivesView> createState() => _IncentivesViewState();
}

class _IncentivesViewState extends State<IncentivesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "Incentives"),
      body: const SafeArea(
        child: JoJoComingSoon()
      ),
    );
  }
}
