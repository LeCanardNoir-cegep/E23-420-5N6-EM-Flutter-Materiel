import 'package:json_annotation/json_annotation.dart';
part 'my_day.g.dart';

@JsonSerializable()
class MyDay{
  late int jour;
  late int mois;
  late int annee;
  late String jourDeLaSemaine;

  MyDay();
  factory MyDay.fromJson(Map<String, dynamic> json) => _$MyDayFromJson(json);
  Map<String, dynamic> toJson() => _$MyDayToJson(this);
}