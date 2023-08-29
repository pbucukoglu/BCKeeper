import 'package:bc_keeper/data/models/BusinessCard.dart';
import 'package:bc_keeper/data/models/User.dart';
import 'package:dio/dio.dart';

class PersonCardService {
  Dio httpClient;
  User? user;

  PersonCardService({
    required this.httpClient,
    this.user,
  });

  Future<BusinessCard> getHolderCardById(int id) async {
    try {
      var response = await httpClient.get('/cards/GetMyHolderCard/$id');

      if (response.statusCode == 200) {
        var responseData = response.data;

        if (responseData.containsKey('resultData')) {
          List<BusinessCard> myHolderCards = [];
          for (var item in responseData['resultData']) {
            var temp = BusinessCard.fromJson(item);
            myHolderCards.add(temp);
          }
          return myHolderCards[0];
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load holder cards');
      }
    } catch (error) {
      throw Exception('Get holder card error: $error');
    }
  }
}
