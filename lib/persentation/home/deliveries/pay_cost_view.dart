import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_confirm_dialog.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/components/text_field/jojo_text_field.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:jojo_taxi/utilities/constants.dart';

class PayCostView extends StatefulWidget {
  const PayCostView({Key? key}) : super(key: key);

  @override
  State<PayCostView> createState() => _PayCostViewState();
}

class _PayCostViewState extends State<PayCostView> {
  TextEditingController costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: ColorManager.grey2, blurRadius: 3),
            ],
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JoJoText("Toll Cost",
                  style: getBoldStyle(
                      color: ColorManager.grey, fontSize: FontSize.s18)),
              const SizedBox(
                height: 30,
              ),
              JoJoText("Did you pay any toll for this trip ?",
                  style: getRegularStyle(color: ColorManager.grey)),
              const SizedBox(
                height: 40,
              ),
              JoJoTextField(
                controller: costController,
                hint: "Amount Paid",
                validationBuilder: ValidationBuilder().maxLength(1),
                isMoneyFormat: true,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: JoJoBtn(
              text: "Submit",
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => JoJoConfirmDialog(
                          title: "Toll Cost ",
                          context: context,
                          message:
                              "Confirmation of paying RM2.5 for toll cost ?",
                          type: Constants.success,
                          action: () {},
                        ));
              },
              color: ColorManager.primary),
        )
      ],
    );
  }
}
