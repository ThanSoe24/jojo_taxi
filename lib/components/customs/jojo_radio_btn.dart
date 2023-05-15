import 'package:flutter/material.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';

class JoJoRadioBtn extends StatelessWidget {
  final String value, groupValue;
  final Function() onchange;
  final Widget title;

  const JoJoRadioBtn({required this.value,required this.groupValue, required this.onchange, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        activeColor: ColorManager.primary,
        value: value,
        title: title,
        groupValue: groupValue,
        onChanged: (value){});
  }
}
