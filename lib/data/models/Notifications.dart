// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part '../Notifications.g.dart';

@JsonSerializable()
class Notifications {
  int? id;
  int? notificationType;
  String? receiverusername;
  String? cardforwarderusername;
  bool? seen;
  String? actiondate;
  int? cardid;
  int? receivercardid;
  Notifications({
    this.id,
    this.notificationType,
    this.receiverusername,
    this.cardforwarderusername,
    this.seen,
    this.actiondate,
    this.cardid,
    this.receivercardid,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsToJson(this);

  @override
  String toString() {
    return 'Notifications(id: $id, notificationType: $notificationType, receiverusername: $receiverusername, cardforwarderusername: $cardforwarderusername,seen: $seen,actiondate: $actiondate,cardid: $cardid,receivercardid: $receivercardid)';
  }
}
