import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jojo_taxi/persentation/resources/routes_manager.dart';
import 'package:jojo_taxi/persentation/resources/theme_manager.dart';
import 'package:jojo_taxi/provider.config.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  int appState = 0;
  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: ApplicationProvider.providers,
        child: Consumer(
          builder: (context, lang, _) => MaterialApp(
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashRoute,
            theme: getApplicationTheme(),
          ),
        ),
      ),
    );
  }
}
