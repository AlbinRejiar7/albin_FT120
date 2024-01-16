import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_project_1/constants/colors.dart';
import 'package:test_project_1/screens/login/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Doctor App',
          theme: ThemeData(
            cardTheme: const CardTheme(surfaceTintColor: white),
              primarySwatch: Colors.green,
              primaryColor: green,
              buttonTheme: const ButtonThemeData(buttonColor: green)),
          home:const Login()
          ));
}