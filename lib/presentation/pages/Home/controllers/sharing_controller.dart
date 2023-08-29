import 'package:bc_keeper/data/models/Subscriber.dart';
import 'package:bc_keeper/data/providers/network/apis/card_service.dart';
import 'package:dio/dio.dart';

class SharingController {
  final CardService sharingService;

  SharingController({required this.sharingService});

  Future<bool> markCardForward(int id, bool forward) async {
    try {
      return await sharingService.markCardForward(id, forward);
    } catch (error) {
      throw Exception('Error marking card forward: $error');
    }
  }
}
