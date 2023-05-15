import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class TransactionDetailView extends StatefulWidget {
  const TransactionDetailView({Key? key}) : super(key: key);

  @override
  State<TransactionDetailView> createState() => _TransactionDetailViewState();
}

class _TransactionDetailViewState extends State<TransactionDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "Job Details"),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            JoJoText("Total net earnings",
                style: getMediumStyle(
                    color: ColorManager.grey, fontSize: FontSize.s16)),
            const SizedBox(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                JoJoText("RM",
                    style: getBoldStyle(color: ColorManager.primary)),
                const SizedBox(width: 5,),
                JoJoText("20.00",
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s32)),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorManager.white,
                boxShadow: [
                  BoxShadow(color: ColorManager.lightGrey, spreadRadius: 2),
                ],
              ),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JoJoText("Earnings details",
                      style: getBoldStyle(color: ColorManager.grey,fontSize: FontSize.s18)),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JoJoText("Net earnings",
                          style: getBoldStyle(color: ColorManager.grey,fontSize: FontSize.s16)),
                      JoJoText("200.00",
                          isRight: true,
                          style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JoJoText("Fare",
                          style: getBoldStyle(color: ColorManager.grey2.withOpacity(0.6),fontSize: FontSize.s16)),
                      JoJoText("98.00",
                          isRight: true,
                          style: getRegularStyle(color: ColorManager.grey2.withOpacity(0.6),fontSize: FontSize.s16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JoJoText("Commission",
                          style: getBoldStyle(color: ColorManager.grey2.withOpacity(0.6),fontSize: FontSize.s16)),
                      JoJoText("-21.00",
                          isRight: true,
                          style: getRegularStyle(color: ColorManager.grey2.withOpacity(0.6),fontSize: FontSize.s16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(thickness: 1, color: ColorManager.grey,),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JoJoText("Tips",
                          style: getBoldStyle(color: ColorManager.grey,fontSize: FontSize.s16)),
                      JoJoText("98.00",
                          isRight: true,
                          style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(thickness: 1, color: ColorManager.grey,),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JoJoText("Total net earnings",
                          style: getBoldStyle(color: ColorManager.grey,fontSize: FontSize.s16)),
                      JoJoText("375.00",
                          isRight: true,
                          style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorManager.white,
                boxShadow: [
                  BoxShadow(color: ColorManager.lightGrey, spreadRadius: 2),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JoJoText("Earnings details",
                      style: getBoldStyle(color: ColorManager.grey,fontSize: FontSize.s18)),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JoJoText("Fare",
                          style: getBoldStyle(color: ColorManager.grey2.withOpacity(0.6),fontSize: FontSize.s16)),
                      JoJoText("-21.00",
                          isRight: true,
                          style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s16)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorManager.white,
                boxShadow: [
                  BoxShadow(color: ColorManager.lightGrey, spreadRadius: 2),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JoJoText("Customer Review",
                          style: getBoldStyle(color: ColorManager.grey,fontSize: FontSize.s18)),
                      JoJoText("",
                          isRight: true,
                          style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s16)),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      )),
    );
  }
}
