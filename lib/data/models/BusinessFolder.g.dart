// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BusinessFolder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessFolder _$BusinessFolderFromJson(Map<String, dynamic> json) =>
    BusinessFolder(
      userid: json['userid'] as int?,
      id: json['id'] as int?,
      companyname: json['companyname'] as String?,
      notes: json['notes'] as String?,
      fullName: json['fullName'] as String?,
      pictureurl: json['pictureurl'] as String?,
      favorite: json['favorite'] as bool,
      isPremium: json['isPremium'] as bool?,
      allowforward: json['allowforward'] as bool?,
      picturepath: json['picturepath'] as String?,
    );

Map<String, dynamic> _$BusinessFolderToJson(BusinessFolder instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'id': instance.id,
      'companyname': instance.companyname,
      'notes': instance.notes,
      'fullName': instance.fullName,
      'pictureurl': instance.pictureurl,
      'favorite': instance.favorite,
      'isPremium': instance.isPremium,
      'allowforward': instance.allowforward,
      'picturepath': instance.picturepath,
    };
