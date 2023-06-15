import 'package:flutter/material.dart';
import 'package:redimentionnement/page_half.dart';
import 'package:redimentionnement/page_high_res.dart';
import 'package:redimentionnement/page_tier.dart';

import 'app_constants.dart';
import 'page_low_res.dart';
import 'page_med_res.dart';

class AppRouter{
  static Map<String, WidgetBuilder> routes = {
    '/low' : (context) => const PageLowRes(title: "$APP_TITLE: Low"),
    '/med' : (context) => const PageMedRes(title: "$APP_TITLE: Med"),
    '/high' : (context) => const PageHighRes(title: "$APP_TITLE: High"),
    '/tier' : (context) => const PageTier(title: "$APP_TITLE: tier"),
    '/half' : (context) => const PageHalf(title: "$APP_TITLE: half"),
  };

  static Map<String, String> translation = {
    '/low' : 'Basse Résolution',
    '/med' : 'Résolution à peu correct',
    '/high' : 'Criss de grosse Résolution',
    '/tier' : 'Tier de largeur',
    '/half' : 'moitié / moitié',
  };
}
