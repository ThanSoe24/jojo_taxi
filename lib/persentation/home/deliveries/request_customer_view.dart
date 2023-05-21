import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/customs/jojo_dropdown_pet.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/customs/jojo_info_list.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class RequestCustomerView extends StatefulWidget {
  const RequestCustomerView({Key? key}) : super(key: key);

  @override
  State<RequestCustomerView> createState() => _RequestCustomerViewState();
}

class _RequestCustomerViewState extends State<RequestCustomerView> {

  bool dropdownPetOpen = false;

  void handleDropDownPet() {
    setState(() {
      dropdownPetOpen = !dropdownPetOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                              color: ColorManager.grey,
                              fontSize: FontSize.s16)),
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
                              color: ColorManager.grey,
                              fontSize: FontSize.s16)),
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
                              color: ColorManager.grey,
                              fontSize: FontSize.s16)),
                      JoJoText("RM 35.18",
                          style: getBoldStyle(
                              color: ColorManager.grey, fontSize: FontSize.s16))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  JoJoInfoList(
                      icon: Icon(
                        Icons.circle,
                        size: 15,
                        color: ColorManager.success,
                      ),
                      text:
                          "From: 12, Jalan 12/48A, Taman Jaya, 51200, Kuala Lumpur. Malaysia",
                      enableTitle: false,
                      title: ""),
                  const SizedBox(
                    height: 10,
                  ),
                  JoJoInfoList(
                      icon: Icon(
                        Icons.location_on_sharp,
                        size: 30,
                        color: ColorManager.primary,
                      ),
                      text:
                          "To: 12, Jalan Gemilang, Taman Jaya, 51200 Kuala Lumpur, Malaysia.",
                      enableTitle: true,
                      title: 'Pet Village Shop'),
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
                  const SizedBox(
                    height: 15,
                  ),
                  JoJoText("Pet Profile",
                      style: getBoldStyle(
                          color: ColorManager.grey, fontSize: FontSize.s18)),
                  const SizedBox(
                    height: 5,
                  ),
                  JoJoDropdownPet(context: context, isOpen: dropdownPetOpen, handleOpen: handleDropDownPet),
                  const SizedBox(
                    height: 25,
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: ColorManager.grey,
                  ),
                  const SizedBox(
                    height: 25,
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
}
