import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_dropdown_pet.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/customs/jojo_info_list.dart';
import 'package:jojo_taxi/components/customs/jojo_reject_dialog.dart';
import 'package:jojo_taxi/components/deliveries/take_photo_dialog.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/home/deliveries/change_pet_size_view.dart';
import 'package:jojo_taxi/persentation/home/deliveries/pay_cost_view.dart';
import 'package:jojo_taxi/persentation/home/deliveries/take_photo_view.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:jojo_taxi/utilities/constants.dart';

class AcceptCustomerView extends StatefulWidget {
  const AcceptCustomerView({Key? key}) : super(key: key);

  @override
  State<AcceptCustomerView> createState() => _AcceptCustomerViewState();
}

class _AcceptCustomerViewState extends State<AcceptCustomerView> {
  bool dropdownPetOpen = false;
  bool isChangePetSize = false;
  bool isPickUp = false;
  bool isTakePhoto =false;
  TextEditingController reasonController = TextEditingController();

  void handleDropDownPet() {
    setState(() {
      dropdownPetOpen = !dropdownPetOpen;
    });
  }

  void handleChangePet() {
    setState(() {
      isChangePetSize = !isChangePetSize;
    });
  }

  void handleTakePhoto() {
    setState(() {
      isTakePhoto = !isTakePhoto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: isChangePetSize
              ? ChangePetSizeView(handleChangePet: handleChangePet)
              : isTakePhoto
                  ? const TakePhotoView()
                  : acceptCustomerCard()),
    );
  }

  Widget acceptCustomerCard() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: ColorManager.primary, spreadRadius: 0, blurRadius: 3),
            ],
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JoJoText(
                "Assigned Ride - Customer to Shop",
                style: getBoldStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JoJoBtn(
                      text: "Navigate",
                      onPressed: () {},
                      color: ColorManager.primary,
                      isBlock: false,
                      radius: 15),
                ],
              ),
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
              JoJoDropdownPet(
                  context: context,
                  isOpen: dropdownPetOpen,
                  handleOpen: handleDropDownPet,
                  assignedStatus: Constants.accept,
                  handleChangePet: handleChangePet),
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
        !isPickUp
            ? Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: MaterialButton(
                        height: 45,
                        onPressed: () {
                          setState(() {
                            isPickUp = true;
                          });
                        },
                        color: ColorManager.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 0,
                        child: JoJoText("Pick Up",
                            isCenter: true,
                            style: getBoldStyle(color: ColorManager.white)),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: MaterialButton(
                        height: 45,
                        onPressed: () {showDialog(
                            context: context,
                            builder: (_) => JoJoRejectDialog(
                                context: context,
                                controller: reasonController));},
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
            : Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {
                      showDialog(
                          context: context, builder: (_) => TakePhotoDialog(onAction:handleTakePhoto));
                    },
                    color: ColorManager.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 0,
                    child: JoJoText("Drop Off",
                        isCenter: true,
                        style: getBoldStyle(color: ColorManager.white)),
                  ),
                ),
              ),
      ],
    );
  }
}
