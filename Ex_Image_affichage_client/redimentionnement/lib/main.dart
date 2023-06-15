import 'package:flutter/material.dart';
import 'package:redimentionnement/app_router.dart';
import 'package:redimentionnement/app_theme_data.dart';
import 'app_constants.dart';

import 'page_low_res.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: AppThemeData.basic,
      home: const PageLowRes(title: "$APP_TITLE: home"),
      routes: AppRouter.routes,
    );
  }
}