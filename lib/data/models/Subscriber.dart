// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'Subscriber.g.dart';

@JsonSerializable()
class Subscriber {
  int otherusercardid;
  int givencardid;
  int givenuserid;
  String fullName;
  String pictureurl;
  String companyname;
  Subscriber({
    required this.otherusercardid,
    required this.givencardid,
    required this.givenuserid,
    required this.fullName,
    required this.pictureurl,
    required this.companyname,
  });

  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory Subscriber.fromJson(Map<String, dynamic> json) =>
      _$SubscriberFromJson(json);

  /// Connect the generated [_$SubscriberToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SubscriberToJson(this);
}
