// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CardEdit.g.dart';

@JsonSerializable()
class CardEdit {
  int? id;
  int? templateid;
  int? userid;
  String? companyName;
  String? department;
  String? title1;
  String? title2;
  String? email;
  String? webaddress;
  String? address1;
  String? address2;
  String? address3;
  String? district1;
  String? district2;
  String? zipcode;
  String? city;
  String? country;
  String? t1;
  String? t2;
  String? m1;
  String? m2;
  String? f;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? instagram;
  int? logoid1;
  int? logoid2;
  int? logoid3;
  String? logourl1;
  String? logourl2;
  String? logourl3;
  String? cardColor;
  String? cardNo;
  int? version;
  String? versionDate;
  bool? allowforward;
  String? fullname;
  String? bgcolor;
  bool? isSponsored;
  CardEdit({
    this.id,
    this.templateid,
    this.userid,
    this.companyName,
    this.department,
    this.title1,
    this.title2,
    this.email,
    this.webaddress,
    this.address1,
    this.address2,
    this.address3,
    this.district1,
    this.district2,
    this.zipcode,
    this.city,
    this.country,
    this.t1,
    this.t2,
    this.m1,
    this.m2,
    this.f,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.instagram,
    this.logoid1,
    this.logoid2,
    this.logoid3,
    this.logourl1,
    this.logourl2,
    this.logourl3,
    this.cardColor,
    this.cardNo,
    this.version,
    this.versionDate,
    this.allowforward,
    this.fullname,
    this.bgcolor,
    this.isSponsored,
  });

  factory CardEdit.fromJson(Map<String, dynamic> json) =>
      _$CardEditFromJson(json);

  Map<String, dynamic> toJson() => _$CardEditToJson(this);
}
