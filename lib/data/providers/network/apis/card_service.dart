import 'package:dio/dio.dart';

import 'package:bc_keeper/data/models/BusinessCard.dart';
import 'package:bc_keeper/data/models/CardEdit.dart';
import 'package:bc_keeper/data/models/UserModel.dart';

import '../../../models/User.dart';

class CardService {
  Dio httpClient;
  User? user;

  CardService({
    required this.httpClient,
    this.user,
  });
  Future<List<BusinessCard>> fetchMyCards() async {
    try {
      var response = await httpClient.get('/cards/GetMyCards');

      if (response.statusCode == 200) {
        var responseData = response.data;

        if (responseData.containsKey('resultData')) {
          List<BusinessCard> cards = [];
          for (var item in responseData['resultData']) {
            var temp = BusinessCard.fromJson(item);
            cards.add(temp);
          }
          return cards;
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load user');
      }
    } catch (error) {
      throw Exception('Get subscribers error: $error');
    }
  }

  Future<CardEdit> fetchCardDetails(int cardId) async {
    try {
      var response = await httpClient.get('/cards/$cardId');

      if (response.statusCode == 200) {
        var responseData = response.data;

        if (responseData.containsKey('resultData')) {
          var cardData = responseData['resultData'][0];
          return CardEdit.fromJson(cardData);
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load card details');
      }
    } catch (error) {
      throw Exception('Get card details error: $error');
    }
  }

  Future<bool> markCardForward(int id, bool forward) async {
    try {
      var response =
          await httpClient.get('/cards/MarkCardForward/$id,$forward');
      // Yanıtı işleyerek bool değer döndürün
      return response.data['status'] == 'OK';
    } catch (error) {
      throw Exception('Error marking card forward: $error');
    }
  }

  Future<bool> updateCard(BusinessCard card) async {
    try {
      var response = await httpClient.put('/cards/UpdateCard/${card.id}',
          data: card.toJson());

      if (response.statusCode == 200) {
        var responseData = response.data;
        return response.data['status'] == 'OK';
      } else {
        throw Exception('Kart kaydedilemedi');
      }
    } catch (error) {
      throw Exception('Kart kaydetme hatası: $error');
    }
  }

  Future<bool> markCardFav(int id, bool checked) async {
    try {
      var response =
          await httpClient.put('/cards/MarkCardFav/$id', data: checked);
      // Yanıtı işleyerek bool değer döndürün
      return response.data['status'] == 'OK';
    } catch (error) {
      throw Exception('Error marking card forward: $error');
    }
  }

  Future<bool> forwardCard(
      int id, int receiverUserId, int receiverCardId) async {
    final headers = {
      'receiveruserid': receiverUserId.toString(),
      'receivercardid': receiverCardId.toString(),
    };

    var response = await httpClient.put(
      '/cards/ForwardCard/$id',
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      if (response.data['status'] == 'OK') {
        return true;
      } else if (response.data['status'] == 'ERROR') {
        if (response.data['statusData'] == "-1") {
          throw Exception('This user already has that card');
        }
      }
      throw Exception('Failed to forward card');
    } else {
      throw Exception('Failed to forward card');
    }
  }
}
