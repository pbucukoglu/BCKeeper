import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {
  String title;
  String name;
  String surname;
  String email;
  String pictureurl;
  bool picturechanged;
  String? imgstr;

  UserModel({
    required this.title,
    required this.name,
    required this.surname,
    required this.email,
    required this.pictureurl,
    required this.picturechanged,
    this.imgstr,
  });

  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
