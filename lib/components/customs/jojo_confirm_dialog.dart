import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:jojo_taxi/persentation/resources/value_manager.dart';
import 'package:jojo_taxi/utilities/constants.dart';

class JoJoConfirmDialog extends StatelessWidget {
  final BuildContext context;
  final String message;
  final String type;
  final String title;
  final VoidCallback action;
  final bool? enableTitle;

  const JoJoConfirmDialog(
      {required this.context,
      required this.message,
      required this.type,
      required this.title,
      required this.action,
        this.enableTitle = true,
      Key? key})
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
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap:  ()=>Navigator.of(cxt).pop(),
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                            border: Border.all(color: ColorManager.primary, width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.close,
                          color: ColorManager.white,
                          size: 20,
                        )),
                  ),
                ),
                enableTitle == true ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: JoJoText(
                    title,
                    style: getMediumStyle(
                        color: ColorManager.black, fontSize: FontSize.s20),
                  ),
                ) : SizedBox(height: 1,),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: JoJoText(message,
                      style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s16)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: MaterialButton(
                          height: 40,
                          onPressed: () {
                            if (action != null) {
                              action();
                              Navigator.of(cxt).pop();
                            } else {
                              Navigator.of(cxt).pop();
                            }
                          },
                          color: ColorManager.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 0,
                          child: JoJoText("Yes",
                              isCenter: true,
                              style: getBoldStyle(color: ColorManager.white)),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: MaterialButton(
                          height: 40,
                          onPressed: () {
                            Navigator.of(cxt).pop();
                          },
                          color: ColorManager.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: ColorManager.lightGrey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 1,
                          child: JoJoText("No",
                              isCenter: true,
                              style: getBoldStyle(color: ColorManager.grey)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
