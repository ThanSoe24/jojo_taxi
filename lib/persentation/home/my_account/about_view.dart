import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/domain/repository/general_repository.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:provider/provider.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  String htmlData = "";

  @override
  void initState() {
    getAboutData();
    super.initState();
  }

  void getAboutData() {
    Provider.of<GeneralRepository>(context, listen: false)
        .fetchAbout()
        .then((value) {
      setState(() {
        htmlData = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "About"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(child: HtmlWidget(htmlData)),
        ),
      ),
    );
  }
}
