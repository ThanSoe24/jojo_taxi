import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:jojo_taxi/utilities/constants.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "About"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    JoJoText(
                      "Starpet JoJo Sdn Bhd",
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: FontSize.s20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    JoJoText(
                      "(1405430-A)",
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: FontSize.s16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                JoJoText(
                  "(${Constants.version} version)",
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: ColorManager.lightGrey, spreadRadius: 3),
                    ],
                  ),
                  padding: const EdgeInsets.all(15),
                  child: JoJoText(
                    "JoJo Pets is the first pet transportation service app in Malaysia. It was created as a solution to the struggles of pet owners who found it difficult to find pet-friendly transport in Malaysia. Our tram is committed to providing pets with reliable transportation. JoJo Pets app connects pet owners and pet service providers together, bringing convenience and the future of pet transportation service to a whole new level.",
                    style: getMediumStyle(
                        color: ColorManager.grey,
                        fontSize: FontSize.s16,
                        lineHeight: 1.6),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                contactList(Icons.location_on_sharp,"K-7-11, SOHO KL, Solaris Mont Kiara, No.2, Jalan Solaris, Mont Kiara, 50480 Kuala Lumpur." ),
                const SizedBox(height: 20,),
                contactList(Icons.phone_android,"For more inquiries, please contact our call centre line +6011-58674961/ +6011-56507563" ),
                const SizedBox(height: 20,),
                contactList(Icons.location_on_sharp,"Monday - Friday: 8AM- 5PM \nSaturday/ Sunday/ Public Holidays : 10AM- 7PM" ),
                const SizedBox(height: 30,),
                Divider(height: 1,thickness: 1, color: ColorManager.grey,),
                const SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width/1.2,
                  child: JoJoText("For customer feedbacks, partnerships, promotional opportunities, or advertising inquiries, feel free to contact JoJo Pets founder, KC Seow at: kcseow@jojo-pets.com",style: getMediumStyle(color: ColorManager.grey)),
                )
            ]
            ),
          ),
        ),
      ),
    );
  }

  Widget contactList(IconData icon,String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: ColorManager.primary, size: 30,),
        const SizedBox(width: 5,),
        SizedBox(
          width: MediaQuery.of(context).size.width/1.2,
          child: JoJoText(
              text,
              style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s14),),
        )
      ],
    );
  }
}
