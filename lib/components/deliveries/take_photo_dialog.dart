import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class TakePhotoDialog extends StatefulWidget {
  final Function()? onAction;

  const TakePhotoDialog({required this.onAction, Key? key}) : super(key: key);

  @override
  State<TakePhotoDialog> createState() => _TakePhotoDialogState();
}

class _TakePhotoDialogState extends State<TakePhotoDialog> {
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
                          border:
                              Border.all(color: ColorManager.primary, width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.close,
                        color: ColorManager.white,
                        size: 20,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: JoJoText(
                  "Proof of Delivery",
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: JoJoText(
                    "You need to upload a photo of handling pets to the shop. The photo will be shown to the customer as a proof of delivery.",
                    style: getRegularStyle(
                        color: ColorManager.grey, fontSize: FontSize.s16)),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: JoJoBtn(
                    text: "Take Photo and Upload",
                    onPressed: widget.onAction!,
                    color: ColorManager.primary),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
