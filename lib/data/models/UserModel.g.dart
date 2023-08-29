// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      title: json['title'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      pictureurl: json['pictureurl'] as String,
      picturechanged: json['picturechanged'] as bool,
      imgstr: json['imgstr'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'title': instance.title,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'pictureurl': instance.pictureurl,
      'picturechanged': instance.picturechanged,
      'imgstr': instance.imgstr,
    };
