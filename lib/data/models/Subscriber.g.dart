// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Subscriber.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscriber _$SubscriberFromJson(Map<String, dynamic> json) => Subscriber(
      otherusercardid: json['otherusercardid'] as int,
      givencardid: json['givencardid'] as int,
      givenuserid: json['givenuserid'] as int,
      fullName: json['fullName'] as String,
      pictureurl: json['pictureurl'] as String,
      companyname: json['companyname'] as String,
    );

Map<String, dynamic> _$SubscriberToJson(Subscriber instance) =>
    <String, dynamic>{
      'otherusercardid': instance.otherusercardid,
      'givencardid': instance.givencardid,
      'givenuserid': instance.givenuserid,
      'fullName': instance.fullName,
      'pictureurl': instance.pictureurl,
      'companyname': instance.companyname,
    };
