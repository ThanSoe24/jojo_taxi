import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/btn/jojo_list_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_confirm_dialog.dart';
import 'package:jojo_taxi/components/customs/jojo_dialog.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/routes_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:jojo_taxi/persentation/resources/value_manager.dart';
import 'package:jojo_taxi/utilities/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TabBar(
                    labelColor: ColorManager.primary,
                    unselectedLabelColor: ColorManager.grey,
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: FontSize.s18),
                    indicatorColor: ColorManager.primary,
                    indicatorWeight: 4,
                    tabs: const [
                      Tab(child: Text("Deliveries")),
                      Tab(child: Text("My Account")),
                    ]),
                Expanded(
                  child: TabBarView(
                    children: [
                      deliveriesWidget(context),
                      myAccountWidget(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
    if(value == true){
      showDialog(
          context: context,
          builder: (_) => JoJoConfirmDialog(
            enableTitle: false,
            title: " ",
            context: context,
            message:
            "With switching to online mode, you will receive requests for rides.\n\nAre you sure you want to continue?",
            type: Constants.error,
            action: () {},
          ));
    }

  }

  Widget deliveriesWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JoJoText("Offline", style: getBoldStyle(color: ColorManager.grey2.withOpacity(0.4), fontSize: FontSize.s18)),
            const SizedBox(width: 10,),
            Transform.scale(
              scale: 1.5,
              child: Switch(
                value: isSwitched,
                onChanged: toggleSwitch,
                activeColor: ColorManager.primary,
                activeTrackColor: ColorManager.grey2.withOpacity(0.4),
                inactiveThumbColor: ColorManager.grey2,
                inactiveTrackColor: ColorManager.grey2.withOpacity(0.4),

              ),
            ),
            const SizedBox(width: 10,),
            JoJoText("Online", style: getBoldStyle(color: ColorManager.success, fontSize: FontSize.s18)),
          ],
        ),
        JoJoText("Waiting For A Ride", style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s24)),
        const JoJoImage(width: double.infinity, height: 450, imageUrl: ImageAssets.welcomeImage)
      ],
    );
  }

  Widget myAccountWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const JoJoImage(
                  width: 150, height: 150, imageUrl: ImageAssets.jojoWhiteLogo),
              const SizedBox(
                height: 30,
              ),
              JoJoListBtn(
                  onPressed: () =>
                  {Navigator.pushNamed(context, Routes.editMyDetailRoute)},
                  text: "Edit My Detail"),
              JoJoListBtn(
                  onPressed: () =>
                  {Navigator.pushNamed(context, Routes.changePassRoute)},
                  text: "Change Password"),
              JoJoListBtn(
                  onPressed: () =>
                  {Navigator.pushNamed(context, Routes.capacityRoute)},
                  text: "Capacity"),
              JoJoListBtn(
                  onPressed: () =>
                  {Navigator.pushNamed(context, Routes.incentivesRoute)},
                  text: "Incentives"),
              JoJoListBtn(
                  onPressed: () =>
                  {Navigator.pushNamed(context, Routes.eLearningRoute)},
                  text: "E-Learning"),
              JoJoListBtn(
                  onPressed: () =>
                  {Navigator.pushNamed(context, Routes.historyRoute)},
                  text: "History"),
              JoJoListBtn(
                  onPressed: () =>
                  {
                    Navigator.pushNamed(context, Routes.faqRoute)
                  },
                  text: "FAQ"),
              JoJoListBtn(
                  onPressed: () =>
                  {Navigator.pushNamed(context, Routes.termsConditionsRoute)},
                  text: "Terms & Conditions"),
              JoJoListBtn(
                  onPressed: () =>
                  {Navigator.pushNamed(context, Routes.aboutRoute)},
                  text: "About"),
              JoJoListBtn(onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => JoJoConfirmDialog(
                      title: "Logout",
                      context: context,
                      message:
                      "Are you sure, you want to logout ?",
                      type: Constants.error,
                      action: () {},
                    ));
              }, text: "Logout"),
            ],
          )),
    );
  }
}
