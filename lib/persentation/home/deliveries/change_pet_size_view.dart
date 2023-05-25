
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class ChangePetSizeView extends StatefulWidget {
  final Function() handleChangePet;
  const ChangePetSizeView({ required this.handleChangePet,Key? key}) : super(key: key);

  @override
  State<ChangePetSizeView> createState() => _ChangePetSizeViewState();
}

class _ChangePetSizeViewState extends State<ChangePetSizeView> {
  final List<String> items = [
    'Extra Large',
    'Large',
    'Medium',
    'Small',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
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
                  color: ColorManager.lightGrey,
                  spreadRadius: 1,
                  blurRadius: 3),
            ],
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JoJoText("Pet Sizes",
                  style: getBoldStyle(
                      color: ColorManager.grey, fontSize: FontSize.s18)),
              const SizedBox(
                height: 10,
              ),
              petContainer(
                  ImageAssets.dogSample, "Locki", "Dog", "Corgi", "Small"),
              petContainer(
                  ImageAssets.dogSample, "Locki", "Dog", "Corgi", "Small"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: JoJoBtn(
              text: "Save",
              onPressed: widget.handleChangePet,
              color: ColorManager.primary),
        )
      ],
    );
  }
  Widget petContainer(String image, String name, String petType, String petName,
      String petSize) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: JoJoImage(
                  width: 100,
                  height: 120,
                  imageUrl: image,
                  fit: BoxFit.fill,
                  isCircle: true,
                )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    JoJoText(name,
                        style: getBoldStyle(
                            color: ColorManager.grey, fontSize: FontSize.s18)),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JoJoText(petType,
                            style: getRegularStyle(color: ColorManager.grey)),
                        JoJoText(petName,
                            style: getRegularStyle(color: ColorManager.grey)),
                        JoJoText(petSize,
                            style: getRegularStyle(color: ColorManager.grey)),
                      ],
                    )
                  ],
                ))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: JoJoText(
              "Pet Sizes",
              style: getBoldStyle(
                  color: ColorManager.grey2, fontSize: FontSize.s16),
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                value: item,
                child: JoJoText(item,
                    style: getMediumStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s16))))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 40,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: ColorManager.grey2,
                      spreadRadius: 0,
                      blurRadius: 2),
                ],
              ),
            ),
            dropdownStyleData: DropdownStyleData(
                maxHeight: 220,
                width: MediaQuery.of(context).size.width / 1.27,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                elevation: 2,
                offset: const Offset(0, -10),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all(6),
                  thumbVisibility: MaterialStateProperty.all(true),
                )),
            menuItemStyleData: const MenuItemStyleData(
              height: 50,
              padding: EdgeInsets.all(15),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

