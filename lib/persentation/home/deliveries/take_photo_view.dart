import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/persentation/home/deliveries/pay_cost_view.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';

class TakePhotoView extends StatefulWidget {
  const TakePhotoView({Key? key}) : super(key: key);

  @override
  State<TakePhotoView> createState() => _TakePhotoViewState();
}

class _TakePhotoViewState extends State<TakePhotoView> {
  bool alreadyImage = false;

  @override
  Widget build(BuildContext context) {
    return alreadyImage
        ? PayCostView()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Column(
              children: [
                const JoJoImage(
                  width: double.infinity,
                  height: 500,
                  imageUrl: ImageAssets.dogSample,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                JoJoBtn(
                    text: "Next",
                    onPressed: () {
                      setState(() {
                        alreadyImage = true;
                      });
                    },
                    color: ColorManager.primary)
              ],
            ),
          );
  }
}
