import 'package:flutter/material.dart';
import 'package:jojo_taxi/persentation/resources/routes_manager.dart';

import '../../../components/app_bar/app_bar_with_back.dart';
import '../../../components/btn/jojo_text_btn.dart';
import '../../../components/customs/jojo_image.dart';
import '../../../components/jojo_text.dart';
import '../../../domain/model/radio_model.dart';
import '../../resources/assests_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/style_manager.dart';

class MyDetailView extends StatefulWidget {
  const MyDetailView({Key? key}) : super(key: key);

  @override
  State<MyDetailView> createState() => _MyDetailViewState();
}

class _MyDetailViewState extends State<MyDetailView> {
  List<BasicRadioModel> petTypeList = const [
    BasicRadioModel(label: "Dog", value: "Dog"),
    BasicRadioModel(label: "Cat", value: "Cat"),
    BasicRadioModel(label: "Rabbit", value: "Rabbit"),
    BasicRadioModel(label: "Guinea Pig", value: "Guinea Pig"),
  ];

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        JoJoText("Driver Profile",
                            style: getBoldStyle(
                                color: ColorManager.grey1,
                                fontSize: FontSize.s18)),
                        InkWell(
                            onTap: () => {
                                  Navigator.pushNamed(
                                      context, Routes.editMyDetailRoute)
                                },
                            child: Icon(
                              Icons.edit,
                              size: 25,
                              color: ColorManager.linkText,
                            ))
                      ],
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
                      height: 25,
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
                    Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.primary),
                        ),
                        const JoJoImage(
                            width: 70,
                            height: 65,
                            imageUrl: ImageAssets.hatchbackIcon),
                        JoJoText(
                          "Hatchback",
                          style: getMediumStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorManager.primary,
                            boxShadow: [
                              BoxShadow(
                                  color: ColorManager.lightGrey,
                                  spreadRadius: 3),
                            ],
                          ),
                          child: JoJoText(
                            "Mayl",
                            style: getMediumStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.primary),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        JoJoText(
                          "White",
                          style: getMediumStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.primary),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        JoJoText(
                          "White",
                          style: getMediumStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.primary),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        JoJoText(
                          "VEC 8876",
                          style: getMediumStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
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
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: petTypeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 25,
                            child: Row(
                              children: [
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorManager.primary),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                JoJoText(
                                  petTypeList[index].label,
                                  style: getMediumStyle(
                                      color: ColorManager.grey,
                                      fontSize: FontSize.s16),
                                ),
                              ],
                            ),
                          );
                        }),
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
                    Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.primary),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        JoJoText(
                          "Medium : 11kg - 20kg",
                          style: getMediumStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
