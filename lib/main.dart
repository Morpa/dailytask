import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/config/routes/app_pages.dart';
import 'app/config/themes/app_theme.dart';

void main() {
  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daily Task',
      theme: AppTheme.basic,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      scrollBehavior: CustomScrollBehaviour(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
