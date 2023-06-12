// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyDay _$MyDayFromJson(Map<String, dynamic> json) => MyDay()
  ..jour = json['jour'] as int
  ..mois = json['mois'] as int
  ..annee = json['annee'] as int
  ..jourDeLaSemaine = json['jourDeLaSemaine'] as String;

Map<String, dynamic> _$MyDayToJson(MyDay instance) => <String, dynamic>{
      'jour': instance.jour,
      'mois': instance.mois,
      'annee': instance.annee,
      'jourDeLaSemaine': instance.jourDeLaSemaine,
    };
