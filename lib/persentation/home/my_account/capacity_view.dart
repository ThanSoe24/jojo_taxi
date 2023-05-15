import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: JoJoBtn(
                    text: "Save",
                    onPressed: () {},
                    color: ColorManager.primary),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget carTypeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: ColorManager.lightGrey, spreadRadius: 3),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: carTypeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile(
                          activeColor: ColorManager.primary,
                          value: carTypeList[index].value,
                          groupValue: resultCar,
                          onChanged: (value) {
                            setState(() {
                              resultCar = value!;
                            });
                          },
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  JoJoImage(width: 70, height: 65, imageUrl: carTypeList[index].image),
                                  JoJoText(
                                    carTypeList[index].label,
                                    style: getMediumStyle(
                                        color: ColorManager.grey,
                                        fontSize: FontSize.s16),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(color: ColorManager.lightGrey, spreadRadius: 3),
                                  ],
                                ),
                                child: JoJoText(
                                  carTypeList[index].subTitle,
                                  style: getMediumStyle(
                                      color: ColorManager.grey,
                                      fontSize: FontSize.s14),
                                ),
                              ),
                            ],
                          ),

                      );
                    }),
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget petTypeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: ColorManager.lightGrey, spreadRadius: 3),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: petTypeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 45,
                          child: RadioListTile(
                              activeColor: ColorManager.primary,
                              value: petTypeList[index].value,
                              groupValue: resultPet,
                              onChanged: (value) {
                                setState(() {
                                  resultPet = value!;
                                });
                              },
                              title: JoJoText(
                                petTypeList[index].label,
                                style: getMediumStyle(
                                    color: resultPet == petTypeList[index].value ? ColorManager.primary : ColorManager.grey,
                                    fontSize: FontSize.s16),
                              )),
                        );
                      }),
                ],
              )),
        ],
      ),
    );
  }
}
