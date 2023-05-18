import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl/intl.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/components/text_field/jojo_date_picker_text_field.dart';
import 'package:jojo_taxi/components/text_field/jojo_text_field.dart';
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
        dateTime: DateTime.now()),
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
        dateTime: DateTime.now()),
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
  final TextEditingController _searchController = TextEditingController();
  List<DateTime?> fromDate = [DateTime.now()];
  List<DateTime?> endDate = [DateTime.now()];
  final TextEditingController _nameController = TextEditingController();

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
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: JoJoTextField(
                      controller: _searchController,
                      isLeading: true,
                      leading: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.search,
                            size: 25,
                            color: ColorManager.grey,
                          )),
                      hint: "Search",
                      radius: 40,
                      validationBuilder: ValidationBuilder().maxLength(30)),
                ),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context, builder: (_) => filterDialog());
                      },
                      child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.filter_list,
                            size: 35,
                          )),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: transactionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return historyList(transactionList[index]);
                  }),
            ),
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
        onTap: () =>
            {Navigator.pushNamed(context, Routes.transactionHistoryRoute)},
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

  void onChangeFromDate(value) {
    setState(() {
      fromDate[0] = value;
    });
  }

  void onChangeEndDate(value) {
    setState(() {
      endDate[0] = value;
    });
  }

  Widget filterDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4,
      backgroundColor: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      JoJoText("Start Date",
                          style: getMediumStyle(color: ColorManager.grey)),
                      const SizedBox(
                        height: 5,
                      ),
                      JoJoDatePickerTxtField()
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      JoJoText("End Date",
                          style: getMediumStyle(color: ColorManager.grey)),
                      const SizedBox(
                        height: 5,
                      ),
                      JoJoDatePickerTxtField()
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              JoJoText("Name", style: getMediumStyle(color: ColorManager.grey)),
              const SizedBox(
                height: 5,
              ),
              JoJoTextField(
                  controller: _nameController,
                  hint: "Name",
                  isSmall: true,
                  validationBuilder: ValidationBuilder().maxLength(30)),
              const SizedBox(
                height: 20,
              ),
              JoJoBtn(text: "Search", onPressed: (){}, color: ColorManager.primary)
            ],
          ),
        ),
      ),
    );
  }
}
