import 'package:flutter/material.dart';
import 'package:flutter_formuscine/app/controller/colors_controller.dart';
import 'package:flutter_formuscine/app/controller/routes_controller.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: CustomColor.tertiaryColor,
        toolbarHeight: 80,
      )),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home-view',
      routes: routes,
    );
  }
}
