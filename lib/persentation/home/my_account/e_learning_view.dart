
import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/jojo_coming_soon.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class ELearningView extends StatefulWidget {
  const ELearningView({Key? key}) : super(key: key);

  @override
  State<ELearningView> createState() => _ELearningViewState();
}

class _ELearningViewState extends State<ELearningView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "E-Learning"),
      body: const SafeArea(
        child: JoJoComingSoon()
      ),
    );
  }
}
