import 'package:flutter/material.dart';

import '../../../components/app_bar/app_bar_with_back.dart';
import '../../../components/btn/jojo_btn.dart';
import '../../../components/jojo_text.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/style_manager.dart';

class CreditWalletView extends StatefulWidget {
  const CreditWalletView({Key? key}) : super(key: key);

  @override
  State<CreditWalletView> createState() => _CreditWalletViewState();
}

class _CreditWalletViewState extends State<CreditWalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "Credit Wallet"),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorManager.lightGrey),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.white),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2, color: ColorManager.primary),
                      color: ColorManager.white),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      JoJoText("Credit Balance",
                          style: getBoldStyle(
                              color: ColorManager.grey2,
                              fontSize: FontSize.s16)),
                      const SizedBox(
                        height: 5,
                      ),
                      JoJoText("30.00",
                          style: getBoldStyle(
                              color: ColorManager.grey1,
                              fontSize: FontSize.s24)),
                      // const SizedBox(height: 10,),
                      // Container(
                      //   padding: const EdgeInsets.all(10),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(color: ColorManager.linkText.withOpacity(0.1)),
                      //       color: ColorManager.white),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       JoJoText("Transferable Balance:",
                      //           style: getBoldStyle(
                      //               color: ColorManager.grey1,
                      //               fontSize: FontSize.s12)),
                      //       const SizedBox(width: 10,),
                      //       JoJoText("303.50",
                      //           style: getBoldStyle(
                      //               color: ColorManager.grey1,
                      //               fontSize: FontSize.s12)),
                      //       const SizedBox(width: 20,),
                      //       Icon(
                      //         Icons.arrow_forward_ios,
                      //         color: ColorManager.grey1,
                      //         size: 10,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            JoJoBtn(
              text: "Top Up with Account",
              textColor: ColorManager.grey2,
              onPressed: () {},
              color: ColorManager.white,
              radius: 0,
              isLeft: true,
            ),
            const SizedBox(
              height: 5,
            ),
            JoJoBtn(
              text: "Top Up with PIN",
              textColor: ColorManager.grey2,
              onPressed: () {},
              color: ColorManager.white,
              radius: 0,
              isLeft: true,
            ),
            const SizedBox(
              height: 5,
            ),
            JoJoBtn(
              text: "Check transaction history",
              textColor: ColorManager.grey2,
              onPressed: () {},
              color: ColorManager.white,
              radius: 0,
              isLeft: true,
            ),
          ],
        ),
      ),
    );
  }
}
