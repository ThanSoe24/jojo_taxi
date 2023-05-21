import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:jojo_taxi/persentation/resources/value_manager.dart';
import 'package:jojo_taxi/utilities/constants.dart';

class JoJoDropdownPet extends StatelessWidget {
  final BuildContext context;
  final bool isOpen;
  final Function() handleOpen;
  final String assignedStatus;

  const JoJoDropdownPet(
      {required this.context,
      required this.isOpen,
      required this.handleOpen,
      required this.assignedStatus,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: handleOpen,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: ColorManager.lightGrey, spreadRadius: 3),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    JoJoText("2",
                        style: getBoldStyle(
                            color: ColorManager.grey, fontSize: FontSize.s16)),
                    const JoJoImage(
                        width: 35, height: 35, imageUrl: ImageAssets.dogIcon),
                    JoJoText("1",
                        style: getBoldStyle(
                            color: ColorManager.grey, fontSize: FontSize.s16)),
                    const JoJoImage(
                        width: 35, height: 35, imageUrl: ImageAssets.catIcon),
                    const SizedBox(
                      width: 5,
                    ),
                    JoJoImage(
                        width: 35,
                        height: 35,
                        imageUrl: isOpen
                            ? ImageAssets.dpUpIcon
                            : ImageAssets.dpDownIcon)
                  ],
                ),
              ),
            ],
          ),
        ),
        isOpen ? petCard() : const SizedBox(),
        SizedBox(
          height: isOpen && assignedStatus == Constants.accept ? 20 : 0,
        ),
        isOpen && assignedStatus == Constants.accept
            ? Center(
              child: JoJoBtn(
                  text: "Change Pet Size",
                  onPressed: () {},
                  color: ColorManager.linkText.withOpacity(0.6), isBlock: false, height: 45,),
            )
            : const SizedBox()
      ],
    );
  }

  Widget petCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.2,
        height: 120,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: ColorManager.white,
          elevation: 1,
          margin: const EdgeInsets.only(bottom: AppMargin.m12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s10)),
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: JoJoImage(
                  width: 100,
                  height: 120,
                  imageUrl: ImageAssets.dogSample,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: JoJoText("Locki",
                                style: getBoldStyle(
                                    color: ColorManager.grey,
                                    fontSize: FontSize.s16)),
                          ),
                          const Expanded(
                              flex: 1,
                              child: JoJoImage(
                                  width: 20,
                                  height: 20,
                                  imageUrl: ImageAssets.maleIcon))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      JoJoText("Dog",
                          style: getRegularStyle(
                              color: ColorManager.grey,
                              fontSize: FontSize.s14)),
                      JoJoText("Corgi",
                          style: getRegularStyle(
                              color: ColorManager.grey,
                              fontSize: FontSize.s14)),
                      JoJoText("Small",
                          style: getRegularStyle(
                              color: ColorManager.grey,
                              fontSize: FontSize.s14)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
