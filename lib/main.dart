import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_the_number/app/pages/home/home.binding.dart';
import 'package:guess_the_number/app/pages/home/home.page.dart';
import 'package:guess_the_number/core/routes/Pages.dart';
import 'package:guess_the_number/core/routes/routes.dart';
import 'package:guess_the_number/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( //state manager init (GETX)
      theme: appTheme,
      initialRoute: Routes.home,
      defaultTransition: Transition.cupertino,
      initialBinding: HomeBinding(),
      getPages: Pages.pages,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}