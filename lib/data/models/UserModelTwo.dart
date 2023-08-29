// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'UserModelTwo.g.dart';

@JsonSerializable()
class UserModelTwo {
  String otherusercardid;
  String givencardid;
  String givenuserid;
  String fullName;
  String pictureurl;
  UserModelTwo({
    required this.otherusercardid,
    required this.givencardid,
    required this.givenuserid,
    required this.fullName,
    required this.pictureurl,
  });

  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory UserModelTwo.fromJson(Map<String, dynamic> json) =>
      _$UserModelTwoFromJson(json);

  /// Connect the generated [_$UserModelTwoToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelTwoToJson(this);
}
