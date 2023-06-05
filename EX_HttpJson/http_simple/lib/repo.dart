import 'package:json_annotation/json_annotation.dart';
part 'repo.g.dart';

@JsonSerializable()
class Repo{
  Repo();
  late String name;
  late bool private;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
  Map<String,dynamic> toJson() => _$RepoToJson(this);

}