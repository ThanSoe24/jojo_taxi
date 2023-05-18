import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:jojo_taxi/utilities/currency_input_formatter.dart';

class JoJoTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maximumCount;
  final Widget trailing, leading;
  final bool isPass,
      isLeading,
      isEnabled,
      isMoneyFormat,
      isBtn,
      isWord,
      isDigit,
  isSmall,
      isShowCount;
  final Color? color;
  final TextInputType textInputType;
  final ValidationBuilder validationBuilder;
  final double radius;

  const JoJoTextField(
      {Key? key,
      this.isMoneyFormat = false,
      required this.controller,
      required this.hint,
      this.isBtn = false,
      this.isDigit = false,
      this.isWord = false,
      this.isPass = false,
      this.isLeading = false,
      this.isShowCount = false,
        this.isSmall = false,
      this.maximumCount = 50,
      this.isEnabled = true,
      this.trailing = const SizedBox(),
      this.leading = const SizedBox(),
      this.color,
      required this.validationBuilder,
        this.radius = 12,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isBtn,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1,
            ),
            child: TextFormField(
              controller: controller,
              obscureText: isPass,
              enabled: isEnabled,
              maxLength: maximumCount,
              style: getRegularStyle(
                  color: isEnabled ? ColorManager.black : ColorManager.grey,
                  fontSize: FontSize.s16),
              keyboardType: textInputType,
              validator: validationBuilder.build(),
              inputFormatters: isMoneyFormat
                  ? [
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyInputFormatter()
                    ]
                  : isDigit
                      ? [FilteringTextInputFormatter.digitsOnly]
                      : isWord
                          ? [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[A-Z a-z]'))
                            ]
                          : [],
              decoration: InputDecoration(
                  suffixIcon: trailing,
                  prefixIcon: isLeading ? leading : null,
                  filled: true,
                  counterText: "",
                  fillColor: ColorManager.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: isSmall ? 2 : 20, horizontal: 15),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide:
                        BorderSide(color: ColorManager.primary, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide:
                        BorderSide(color: ColorManager.lightGrey, width: 1.5),
                  ),
                  hintText: hint,
                  hintStyle: getRegularStyle(
                      color: ColorManager.grey2, fontSize: FontSize.s16)),
            ),
          ),
        ],
      ),
    );
  }
}
