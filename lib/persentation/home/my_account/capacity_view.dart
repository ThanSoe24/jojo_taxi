
import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';


class CapacityView extends StatefulWidget {
  const CapacityView({Key? key}) : super(key: key);

  @override
  State<CapacityView> createState() => _CapacityViewState();
}

class _CapacityViewState extends State<CapacityView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBarWithBack(
            onBack: () => {Navigator.pop(context)}, title: "Capacity"),
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                  labelColor: ColorManager.primary,
                  unselectedLabelColor: ColorManager.grey,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: FontSize.s18),
                  indicatorColor: ColorManager.primary,
                  indicatorWeight: 4,
                  tabs: const [
                    Tab(child: Text("Car Type")),
                    Tab(child: Text("Pet Type")),
                  ]),
              Expanded(
                child: TabBarView(
                  children: [
                    carTypeWidget(context),
                    petTypeWidget(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget carTypeWidget(BuildContext context){
    return JoJoText("Car Type", style: getBoldStyle(color: ColorManager.primary));
  }
  Widget petTypeWidget(BuildContext context){
    return JoJoText("Pet Type", style: getBoldStyle(color: ColorManager.primary));
  }
}
