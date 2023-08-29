// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models/Notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notifications _$NotificationsFromJson(Map<String, dynamic> json) =>
    Notifications(
      id: json['id'] as int?,
      notificationType: json['notificationType'] as int?,
      receiverusername: json['receiverusername'] as String?,
      cardforwarderusername: json['cardforwarderusername'] as String?,
      seen: json['seen'] as bool?,
      actiondate: json['actiondate'] as String?,
      cardid: json['cardid'] as int?,
      receivercardid: json['receivercardid'] as int?,
    );

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notificationType': instance.notificationType,
      'receiverusername': instance.receiverusername,
      'cardforwarderusername': instance.cardforwarderusername,
      'seen': instance.seen,
      'actiondate': instance.actiondate,
      'cardid': instance.cardid,
      'receivercardid': instance.receivercardid,
    };
