import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/domain/model/transaction_model.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/routes_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final List<TransactionModel> transactionList = [
    TransactionModel(
        customer: "Lee Seak Tong",
        refNo: "3348046217479",
        status: "Done",
        paymentAmount: 200,
        dateTime: DateTime.now()),
    TransactionModel(
        customer: "Lee Seak Tong",
        refNo: "3348046217479",
        status: "Done",
        paymentAmount: 200,
        dateTime: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "History"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: transactionList.length,
                itemBuilder: (BuildContext context, int index) {
                  return historyList(transactionList[index]);
                }),
          ],
        ),
      )),
    );
  }

  Widget historyList(TransactionModel transactionModel) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorManager.grey2.withOpacity(0.4),
        boxShadow: [
          BoxShadow(color: ColorManager.lightGrey, spreadRadius: 2),
        ],
      ),
      child: InkWell(
        onTap: () => {Navigator.pushNamed(context, Routes.transactionHistoryRoute)},
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorManager.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: JoJoText(transactionModel.customer,
                        style: getMediumStyle(
                            color: ColorManager.grey, fontSize: FontSize.s16)),
                  ),
                  Expanded(
                    flex: 2,
                    child: JoJoText(
                        DateFormat('dd-mm-yyy hh:mm a')
                            .format(transactionModel.dateTime),
                        isRight: true,
                        style: getRegularStyle(
                            color: ColorManager.grey, fontSize: FontSize.s12)),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: JoJoText("Order Ref No: ${transactionModel.refNo}",
                          style: getRegularStyle(
                              color: ColorManager.grey,
                              fontSize: FontSize.s16))),
                  Expanded(
                    flex: 1,
                    child: JoJoText("RM ${transactionModel.paymentAmount}",
                        isRight: true,
                        style: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s20)),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              JoJoText("Shop to Customer - ${transactionModel.status}",
                  style: getRegularStyle(color: ColorManager.grey))
            ],
          ),
        ),
      ),
    );
  }
}
