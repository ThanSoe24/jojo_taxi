import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/components/text_field/jojo_text_field.dart';
import 'package:jojo_taxi/domain/model/faq_model.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

class FAQView extends StatefulWidget {
  const FAQView({Key? key}) : super(key: key);

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  final TextEditingController _searchController = TextEditingController();
  final List<FAQModel> faqList = [
    FAQModel(
        title: "What is JoJo",
        description:
        "JoJo is a pets transportation apps which also provides pet services such as grooming and pet boarding"),
    FAQModel(
        title: "What is JoJo",
        description:
        "JoJo is a pets transportation apps which also provides pet services such as grooming and pet boarding")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar:
      AppBarWithBack(onBack: () => {Navigator.pop(context)}, title: "FAQ"),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
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
                          onTap: () {},
                          child: const Align(
                              alignment: Alignment.centerRight,
                              child: JoJoImage(
                                  width: 50,
                                  height: 50,
                                  imageUrl: ImageAssets.filterIcon)),
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
                      itemCount: faqList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return fqaList(faqList[index]);
                      }),
                ),
              ],
            ),
          )),
    );
  }

  Widget fqaList(FAQModel faqModel) {
    return ExpandableNotifier(  // <-- Provides ExpandableController to its children
      child: Column(
        children: [
          Expandable(           // <-- Driven by ExpandableController from ExpandableNotifier
            collapsed: ExpandableButton(  // <-- Expands when tapped on the cover photo
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 12, top: 1, bottom: 1, right: 1),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorManager.grey2.withOpacity(0.4),

                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorManager.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JoJoText(faqModel.title, style: getMediumStyle(color: ColorManager.grey)),
                      Icon(Icons.keyboard_arrow_down_rounded, color: ColorManager.grey2,)
                    ],
                  ),
                ),
              ),
            ),
            expanded: ExpandableButton(

              child: Container(
                padding: const EdgeInsets.only(left: 12, top: 1, bottom: 1, right: 1),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorManager.primary,

                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorManager.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          JoJoText(faqModel.title, style: getMediumStyle(color: ColorManager.grey)),
                          Icon(Icons.keyboard_arrow_up_rounded, color: ColorManager.primary,)
                        ],
                      ),
                      JoJoText(faqModel.description, style: getMediumStyle(color: ColorManager.grey))
                    ],

                  ),
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }
}
