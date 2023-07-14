import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/btn/jojo_text_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/components/text_field/jojo_text_field.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

import '../../../domain/model/radio_model.dart';

class EditMyDetailView extends StatefulWidget {
  const EditMyDetailView({Key? key}) : super(key: key);

  @override
  State<EditMyDetailView> createState() => _EditMyDetailViewState();
}

class _EditMyDetailViewState extends State<EditMyDetailView> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _vehicleController = TextEditingController();
  final TextEditingController _vehicleColorController = TextEditingController();
  final TextEditingController _plateController = TextEditingController();

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
    CarTypeRadioModel(
        label: "Hatchback",
        value: "Hatchback",
        image: ImageAssets.hatchbackIcon,
        subTitle: "Myvi, Axia, etc"),
    CarTypeRadioModel(
        label: "Sedan Car",
        value: "Sedan Car",
        image: ImageAssets.sedanCarIcon,
        subTitle: "Saga, Bezza, City, Civic, etc"),
    CarTypeRadioModel(
        label: "SUV",
        value: "SUV",
        image: ImageAssets.suvIcon,
        subTitle: "Harrier, X50, CRV, etc"),
    CarTypeRadioModel(
        label: "MPV",
        value: "MPV",
        image: ImageAssets.mpvIcon,
        subTitle: "Alza, Ertiga, Exora, etc"),
  ];

  String resultCar = "";

  List<PetSizeRadioModel> petSizeList = const [
    PetSizeRadioModel(label: "Small", subLabel: "0 kg - 10 kg", value: "small"),
    PetSizeRadioModel(
        label: "Medium", subLabel: "11 kg - 20 kg", value: "medium"),
    PetSizeRadioModel(
        label: "Large", subLabel: "21 kg - 30 kg", value: "large"),
    PetSizeRadioModel(label: "Giant", subLabel: "> 30 kg", value: "giant"),
  ];
  String resultPetSize = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "Edit Profile"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: JoJoText("Driver Profile",
                          style: getBoldStyle(
                              color: ColorManager.grey1,
                              fontSize: FontSize.s18)),
                    ),
                    const SizedBox(height: 15,),
                    const JoJoImage(
                        width: 150,
                        height: 150,
                        imageUrl: ImageAssets.profileIcon),

                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 30,
                            child: Icon(
                              Icons.person,
                              size: 30,
                              color: ColorManager.grey,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        JoJoText("Jonathan Lee",
                            style: getBoldStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s16)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 30,
                            child: Icon(
                              Icons.phone_android,
                              size: 30,
                              color: ColorManager.grey,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        JoJoText("012-34567890",
                            style: getBoldStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s16)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 30,
                            child: Icon(
                              Icons.mail,
                              size: 25,
                              color: ColorManager.grey,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        JoJoText("jonathanlee@gmail.com",
                            style: getBoldStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s16)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 1,
                      color: ColorManager.grey,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: JoJoText("Vehicle Type",
                            style: getBoldStyle(
                                color: ColorManager.grey1,
                                fontSize: FontSize.s18))),
                    const SizedBox(
                      height: 15,
                    ),
                    carTypeWidget(context),
                    const SizedBox(
                      height: 15,
                    ),
                    JoJoTextField(
                        controller: _vehicleController,
                        hint: "Vehicle Model*",
                        validationBuilder: ValidationBuilder().phone()),
                    const SizedBox(
                      height: 15,
                    ),
                    JoJoTextField(
                        controller: _vehicleColorController,
                        hint: "Vehicle Colour*",
                        validationBuilder: ValidationBuilder().phone()),
                    const SizedBox(
                      height: 15,
                    ),
                    JoJoTextField(
                        controller: _plateController,
                        hint: "Plate Number*",
                        validationBuilder: ValidationBuilder().phone()),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 1,
                      color: ColorManager.grey,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: JoJoText("Pet Type",
                            style: getBoldStyle(
                                color: ColorManager.grey1,
                                fontSize: FontSize.s18))),
                    const SizedBox(
                      height: 15,
                    ),
                    petTypeWidget(context),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 1,
                      color: ColorManager.grey,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: JoJoText("Pet Size",
                            style: getBoldStyle(
                                color: ColorManager.grey1,
                                fontSize: FontSize.s18))),
                    const SizedBox(
                      height: 15,
                    ),
                    petSizeWidget(context)
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 15,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    JoJoBtn(
                      text: "Save",
                      onPressed: () {},
                      color: ColorManager.primary,
                      isBlock: false,
                      radius: 50,
                    ),
                    JoJoBtn(
                      text: "Cancel",
                      onPressed: () {},
                      color: ColorManager.white,
                      isBlock: false,
                      radius: 50,
                      elevation: 1,
                    )
                  ],
                ),
                const SizedBox(height: 15,)
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget carTypeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
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
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: carTypeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                          setState(() {
                            resultCar = carTypeList[index].value;
                          });
                        },
                          child: Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: resultCar ==
                                        carTypeList[index].value
                                        ? ColorManager.primary
                                        : ColorManager.white,
                                    border: Border.all(
                                        width: resultCar ==
                                            carTypeList[index].value
                                            ? 0
                                            : 2,
                                        color: ColorManager.grey1),
                                    borderRadius: BorderRadius.circular(15)),
                                child:
                                resultCar == carTypeList[index].value
                                    ? Center(
                                    child: Icon(
                                      Icons.check,
                                      color: ColorManager.white,
                                      size: 20,
                                    ))
                                    : SizedBox(),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        JoJoImage(
                                            width: 70,
                                            height: 65,
                                            imageUrl: carTypeList[index].image),
                                        JoJoText(
                                          carTypeList[index].label,
                                          style: getMediumStyle(
                                              color: ColorManager.grey,
                                              fontSize: FontSize.s16),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorManager.lightGrey,
                                              spreadRadius: 3),
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

                            ],
                          ),
                        );
                      }),
                ],
              )),
        ],
      ),
    );
  }

  Widget petTypeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
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
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: petTypeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              resultPet = petTypeList[index].value;
                            });
                          },
                          child: SizedBox(
                            height: 45,
                            child: Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: resultPet ==
                                          petTypeList[index].value
                                          ? ColorManager.primary
                                          : ColorManager.white,
                                      border: Border.all(
                                          width: resultPet ==
                                              petTypeList[index].value
                                              ? 0
                                              : 2,
                                          color: ColorManager.grey1),
                                      borderRadius: BorderRadius.circular(2)),
                                  child:
                                  resultPet == petTypeList[index].value
                                      ? Center(
                                      child: Icon(
                                        Icons.check,
                                        color: ColorManager.white,
                                        size: 20,
                                      ))
                                      : SizedBox(),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                JoJoText(
                                  petTypeList[index].label,
                                  style: getMediumStyle(
                                      color: resultPet ==
                                          petTypeList[index].value
                                          ? ColorManager.primary
                                          : ColorManager.grey,
                                      fontSize: FontSize.s16),
                                ),

                              ],
                            ),
                          ),
                        );
                      }),
                ],
              )),
        ],
      ),
    );
  }

  Widget petSizeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
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
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: petSizeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              resultPetSize = petSizeList[index].value;
                            });
                          },
                          child: SizedBox(
                            height: 45,
                            child: Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: resultPetSize ==
                                              petSizeList[index].value
                                          ? ColorManager.primary
                                          : ColorManager.white,
                                      border: Border.all(
                                          width: resultPetSize ==
                                                  petSizeList[index].value
                                              ? 0
                                              : 2,
                                          color: ColorManager.grey1),
                                      borderRadius: BorderRadius.circular(15)),
                                  child:
                                      resultPetSize == petSizeList[index].value
                                          ? Center(
                                              child: Icon(
                                              Icons.check,
                                              color: ColorManager.white,
                                              size: 20,
                                            ))
                                          : SizedBox(),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 80,
                                  child: JoJoText(
                                    petSizeList[index].label,
                                    style: getMediumStyle(
                                        color: resultPetSize ==
                                                petSizeList[index].value
                                            ? ColorManager.primary
                                            : ColorManager.grey,
                                        fontSize: FontSize.s16),
                                  ),
                                ),
                                JoJoText(":  ",
                                    style: getMediumStyle(
                                        color: resultPetSize ==
                                                petSizeList[index].value
                                            ? ColorManager.primary
                                            : ColorManager.grey,
                                        fontSize: FontSize.s16)),
                                JoJoText(
                                  petSizeList[index].subLabel,
                                  style: getMediumStyle(
                                      color:
                                          resultPetSize == petSizeList[index].value
                                              ? ColorManager.primary
                                              : ColorManager.grey,
                                      fontSize: FontSize.s16),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              )),
        ],
      ),
    );
  }
}
