import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_confirm_dialog.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
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
  bool dropdownPetOpen = false;

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
                inactiveThumbColor: ColorManager.grey2,
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
        isSwitched ? customerCard() : offlineView(),

      ],
    );
  }

  Widget customerCard() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: ColorManager.lightGrey, spreadRadius: 3),
                ],
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JoJoText(
                    "Pending to Accept",
                    style: getBoldStyle(
                        color: ColorManager.linkText, fontSize: FontSize.s18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JoJoText("Order Ref No.",
                          style: getRegularStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16)),
                      JoJoText("23456789",
                          style: getBoldStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JoJoText("Distance from You",
                          style: getRegularStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16)),
                      JoJoText("12.5KM",
                          style: getBoldStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JoJoText("Delivery Cost",
                          style: getRegularStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16)),
                      JoJoText("RM 35.18",
                          style: getBoldStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  infoList(
                      Icon(
                        Icons.circle,
                        size: 15,
                        color: ColorManager.success,
                      ),
                      "From: 12, Jalan 12/48A, Taman Jaya, 51200, Kuala Lumpur. Malaysia",
                      false,
                      ''),
                  const SizedBox(
                    height: 10,
                  ),
                  infoList(
                      Icon(
                        Icons.location_on_sharp,
                        size: 30,
                        color: ColorManager.primary,
                      ),
                      "To: 12, Jalan Gemilang, Taman Jaya, 51200 Kuala Lumpur, Malaysia.",
                      true,
                      'Pet Village Shop'),
                  const SizedBox(
                    height: 15,
                  ),
                  JoJoText("Notes",
                      style: getBoldStyle(
                          color: ColorManager.grey, fontSize: FontSize.s18)),
                  const SizedBox(
                    height: 5,
                  ),
                  JoJoText(
                      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae",
                      style: getRegularStyle(
                          color: ColorManager.grey, fontSize: FontSize.s14)),
                  const SizedBox(
                    height: 25,
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: ColorManager.grey,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  JoJoText("Customer",
                      style: getBoldStyle(
                          color: ColorManager.grey, fontSize: FontSize.s18)),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const JoJoImage(
                        width: 100,
                        height: 100,
                        imageUrl: ImageAssets.dogSample,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              JoJoText("KC Seow",
                                  style: getMediumStyle(
                                      color: ColorManager.grey,
                                      fontSize: FontSize.s18)),
                            ],
                          ),
                          Row(
                            children: const [
                              JoJoImage(
                                  width: 60,
                                  height: 60,
                                  imageUrl: ImageAssets.phoneIcon),
                              JoJoImage(
                                  width: 60,
                                  height: 60,
                                  imageUrl: ImageAssets.messageIcon),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  JoJoText("Pet Profile",
                      style: getBoldStyle(
                          color: ColorManager.grey, fontSize: FontSize.s18)),
                  const SizedBox(
                    height: 5,
                  ),
                  dropdownPetList(),
                  const SizedBox(
                    height: 10,
                  ),
                  dropdownPetOpen ? petCard() : const SizedBox(),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: ColorManager.grey,
                  ),
                  JoJoText("Shop",
                      style: getBoldStyle(
                          color: ColorManager.grey, fontSize: FontSize.s18)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const JoJoImage(
                        width: 100,
                        height: 100,
                        imageUrl: ImageAssets.dogSample,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              JoJoText("Pet Village Shop",
                                  style: getMediumStyle(
                                      color: ColorManager.grey,
                                      fontSize: FontSize.s18)),
                            ],
                          ),
                          Row(
                            children: const [
                              JoJoImage(
                                  width: 60,
                                  height: 60,
                                  imageUrl: ImageAssets.phoneIcon),
                              JoJoImage(
                                  width: 60,
                                  height: 60,
                                  imageUrl: ImageAssets.messageIcon),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.8,
                    child: MaterialButton(
                      height: 45,
                      onPressed: () {},
                      color: ColorManager.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 0,
                      child: JoJoText("Accept",
                          isCenter: true,
                          style: getBoldStyle(color: ColorManager.white)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.8,
                    child: MaterialButton(
                      height: 45,
                      onPressed: () {},
                      color: ColorManager.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: ColorManager.lightGrey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 1,
                      child: JoJoText("Reject",
                          isCenter: true,
                          style: getBoldStyle(color: ColorManager.grey)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void handleDropDownPet() {
    setState(() {
      dropdownPetOpen = !dropdownPetOpen;
    });
  }

  Widget infoList(Widget icon, String text, bool enableTitle, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 30, child: icon),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              enableTitle
                  ? JoJoText(title,
                      style: getBoldStyle(
                          color: ColorManager.grey, fontSize: FontSize.s18))
                  : const SizedBox(),
              SizedBox(
                height: enableTitle ? 5 : 0,
              ),
              SizedBox(
                width: double.infinity,
                child: JoJoText(
                  text,
                  style: getRegularStyle(
                      color: ColorManager.grey, fontSize: FontSize.s14),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget dropdownPetList() {
    return InkWell(
      onTap: handleDropDownPet,
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
                    imageUrl: dropdownPetOpen
                        ? ImageAssets.dpUpIcon
                        : ImageAssets.dpDownIcon)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget petCard() {
    return SizedBox(
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
                            color: ColorManager.grey, fontSize: FontSize.s14)),
                    JoJoText("Corgi",
                        style: getRegularStyle(
                            color: ColorManager.grey, fontSize: FontSize.s14)),
                    JoJoText("Small",
                        style: getRegularStyle(
                            color: ColorManager.grey, fontSize: FontSize.s14)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget offlineView() {
    return Expanded(
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
