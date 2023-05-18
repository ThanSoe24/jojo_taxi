import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class JoJoDatePickerTxtField extends StatefulWidget {
  JoJoDatePickerTxtField({Key? key}) : super(key: key);

  @override
  State<JoJoDatePickerTxtField> createState() => _JoJoDatePickerTxtFieldState();
}

class _JoJoDatePickerTxtFieldState extends State<JoJoDatePickerTxtField> {
  List<DateTime> date = [DateTime.now()];
  String resultDate = DateFormat('yyy-MM-d').format(DateTime.now()).toString();
  late GlobalKey dropdownKey;

  @override
  void initState() {
    dropdownKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        key: dropdownKey,
        isExpanded: true,
        customButton: toggle(),
        onChanged: (value) {},
        items: [DropdownMenuItem(child: calendar(dropdownKey))],
        dropdownStyleData: DropdownStyleData(
          width: 325,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorManager.white,
          ),
          elevation: 8,
          offset: const Offset(-40, -10),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 300,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }

  Widget toggle() {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 2, bottom: 2, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(color: ColorManager.lightGrey, spreadRadius: 2),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          JoJoText(DateFormat('dd/MM/yy').format(DateTime.parse(resultDate)),
              style: getMediumStyle(
                  color: ColorManager.grey2, fontSize: FontSize.s14)),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 32,
            color: ColorManager.grey2.withOpacity(0.6),
          )
        ],
      ),
    );
  }

  Widget calendar(GlobalKey dpKey) {
    return CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          selectedDayHighlightColor: ColorManager.primary,
          weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
          weekdayLabelTextStyle: getMediumStyle(color: ColorManager.grey2),
          firstDayOfWeek: 1,
          controlsHeight: 50,
          controlsTextStyle: getMediumStyle(color: ColorManager.grey2),
          dayTextStyle: getMediumStyle(color: ColorManager.grey2),
          calendarType: CalendarDatePicker2Type.single,
          selectableDayPredicate: (day) =>
              day.difference(DateTime.now()).isNegative,
        ),
        value: date,
        onValueChanged: (dates) {
              setState(() => resultDate = DateFormat('yyy-MM-dd')
                  .format(DateTime.parse(dates.toString().substring(1, 11)))
                  .toString());
            });

  }
}
