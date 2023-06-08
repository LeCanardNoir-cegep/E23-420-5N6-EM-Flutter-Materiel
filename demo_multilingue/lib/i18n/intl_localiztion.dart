

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Locs {
  final Locale locale;
  Locs(this.locale);

  static Locs of(BuildContext context){
      return Localizations.of<Locs>(context, Locs)!;
  }

  Map<String,String> _sentences = Map();

  Future<bool> load() async{
    String data = await rootBundle.loadString('assets/i18n/${this.locale.languageCode}.json');
    Map<String,dynamic> _result = json.decode(data);
    this._sentences = Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });
    return true;
  }

  String trans(String key){
    return this._sentences.containsKey(key) ? this._sentences[key]! : "TODO";
  }

}