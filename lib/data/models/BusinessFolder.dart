// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BusinessFolder.g.dart';

@JsonSerializable()
class BusinessFolder {
  int? userid;
  int? id;
  String? companyname;
  String? notes;
  String? fullName;
  String? pictureurl;
  bool favorite;
  bool? isPremium;
  bool? allowforward;
  String? picturepath;
  BusinessFolder({
    this.userid,
    this.id,
    this.companyname,
    this.notes,
    this.fullName,
    this.pictureurl,
    required this.favorite,
    this.isPremium,
    this.allowforward,
    this.picturepath,
  });

  factory BusinessFolder.fromJson(Map<String, dynamic> json) =>
      _$BusinessFolderFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessFolderToJson(this);
}
