import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_coming_soon.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/domain/model/radio_model.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class CapacityView extends StatefulWidget {
  const CapacityView({Key? key}) : super(key: key);

  @override
  State<CapacityView> createState() => _CapacityViewState();
}

class _CapacityViewState extends State<CapacityView> {
  List<BasicRadioModel> petTypeList = const [
    BasicRadioModel(label: "Dog", value: "Dog"),
    BasicRadioModel(label: "Cat", value: "Cat"),
    BasicRadioModel(label: "Rabbit", value: "Rabbit"),
    BasicRadioModel(label: "Guinea Pig", value: "Guinea Pig"),
    BasicRadioModel(label: "Sugar Gilder", value: "Sugar Gilder"),
    BasicRadioModel(label: "Parrot", value: "Parrot"),
    BasicRadioModel(label: "Hamster", value: "Hamster"),
    BasicRadioModel(label: "Snake", value: "Snake"),
    BasicRadioModel(label: "Turtle", value: "Turtle"),
  ];
  String resultPet = "";

  List<CarTypeRadioModel> carTypeList = const [
    CarTypeRadioModel(label: "Hatchback",
        value: "Hatchback",
        image: ImageAssets.hatchbackIcon,
        subTitle: "Myvi, Axia, etc"),
    CarTypeRadioModel(label: "Sedan Car",
        value: "Sedan Car",
        image: ImageAssets.sedanCarIcon,
        subTitle: "Saga, Bezza, City, Civic, etc"),
    CarTypeRadioModel(label: "SUV",
        value: "SUV",
        image: ImageAssets.suvIcon,
        subTitle: "Harrier, X50, CRV, etc"),
    CarTypeRadioModel(label: "MPV",
        value: "MPV",
        image: ImageAssets.mpvIcon,
        subTitle: "Alza, Ertiga, Exora, etc"),
  ];

  String resultCar = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBarWithBack(
            onBack: () => {Navigator.pop(context)}, title: "Bank Account"),
        body: SafeArea(
          child: JoJoComingSoon()
        ),
      ),
    );
  }

}
