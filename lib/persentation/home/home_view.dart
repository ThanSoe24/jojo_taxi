import 'package:flutter/material.dart';
import 'package:jojo_taxi/components/btn/jojo_list_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_image.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/assests_manager.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/font_manager.dart';
import 'package:jojo_taxi/persentation/resources/routes_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:jojo_taxi/persentation/resources/value_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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

  Widget deliveriesWidget(BuildContext context) {
    return Container(
        child: JoJoText(
      "Deliveries",
      style: getBoldStyle(color: ColorManager.primary),
    ));
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
              onPressed: () => {Navigator.pushNamed(context, Routes.faqRoute)},
              text: "FAQ"),
          JoJoListBtn(
              onPressed: () =>
                  {Navigator.pushNamed(context, Routes.termsConditionsRoute)},
              text: "Terms & Conditions"),
          JoJoListBtn(
              onPressed: () =>
                  {Navigator.pushNamed(context, Routes.aboutRoute)},
              text: "About"),
          JoJoListBtn(onPressed: () {}, text: "Logout"),
        ],
      )),
    );
  }
}
