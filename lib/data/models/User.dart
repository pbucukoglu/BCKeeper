import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
@collection
class User {
  Id dbId = Isar.autoIncrement;
  String? email;
  String? mobile;
  String? password;
  bool? isvalid;
  String? id;
  String? title;
  String? name;
  String? surname;
  String? token;
  String? userType;
  String? cultureinfo;
  String? invalidcause;
  String? pictureurl;
  String? issuedon;
  String? expireson;
  bool? canedit;
  bool? canadd;
  bool? expired;
  bool? active;
  bool? approved;
  String? approveCode;
  String? guidstr;
  bool? isPremium;
  String? premiumExpires;
  String? noticount;
  int? companyid;
  String? companyname;
  String? companyaddress;
  String? companycity;
  String? companycountry;
  String? companyphone;
  String? companymobile;
  String? companyvd;
  String? companyvn;
  String? picturepath;
  bool? picturechanged;
  String? imgstr;

  User(
      {this.dbId = Isar.autoIncrement,
      this.email,
      this.mobile,
      this.password,
      this.isvalid,
      this.id,
      this.title,
      this.name,
      this.surname,
      this.token,
      this.userType,
      this.cultureinfo,
      this.invalidcause,
      this.pictureurl,
      this.issuedon,
      this.expireson,
      this.canedit,
      this.canadd,
      this.expired,
      this.active,
      this.approved,
      this.approveCode,
      this.guidstr,
      this.isPremium,
      this.premiumExpires,
      this.noticount,
      this.companyid,
      this.companyname,
      this.companyaddress,
      this.companycity,
      this.companycountry,
      this.companyphone,
      this.companymobile,
      this.companyvd,
      this.companyvn,
      this.picturepath,
      this.picturechanged,
      this.imgstr});

  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
