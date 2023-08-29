import 'package:bc_keeper/data/models/BusinessFolder.dart';
import 'package:bc_keeper/data/models/Subscriber.dart';
import 'package:bc_keeper/data/models/User.dart';
import 'package:dio/dio.dart';

class BusinessFolderService {
  Dio httpClient;
  User? user;

  BusinessFolderService({
    required this.httpClient,
    this.user,
  });
  Future<List<BusinessFolder>> getMyHolderCards() async {
    try {
      var response = await httpClient.get('/cards/GetMyHolderCards');

      if (response.statusCode == 200) {
        var responseData = response.data;

        if (responseData.containsKey('resultData')) {
          List<BusinessFolder> myHolderCards = [];
          for (var item in responseData['resultData']) {
            var temp = BusinessFolder.fromJson(item);
            myHolderCards.add(temp);
          }
          return myHolderCards;
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
