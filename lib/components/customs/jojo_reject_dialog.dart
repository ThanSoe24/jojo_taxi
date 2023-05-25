import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/components/text_field/jojo_text_field.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class JoJoRejectDialog extends StatelessWidget {
  final BuildContext context;
  final TextEditingController controller;

  const JoJoRejectDialog(
      {required this.context, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext cxt) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4,
      backgroundColor: ColorManager.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.2,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.of(cxt).pop(),
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: ColorManager.primary,
                            border: Border.all(
                                color: ColorManager.primary, width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.close,
                          color: ColorManager.white,
                          size: 20,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: JoJoText("Reason To Reject",
                      style: getBoldStyle(
                          color: ColorManager.grey, fontSize: FontSize.s18)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: JoJoTextField(
                      controller: controller,
                      hint: "Reason",
                      textInputType: TextInputType.multiline,
                      validationBuilder: ValidationBuilder().maxLength(150)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: JoJoBtn(
                      text: "Sumbit",
                      onPressed: () {},
                      color: ColorManager.primary),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
    );
  }
}
