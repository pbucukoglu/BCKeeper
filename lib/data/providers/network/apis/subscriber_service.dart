import 'package:bc_keeper/data/models/Subscriber.dart';
import 'package:dio/dio.dart';

import '../../../models/User.dart';

class SubscriberService {
  Dio httpClient;
  User? user;

  SubscriberService({
    required this.httpClient,
    this.user,
  });
  Future<List<Subscriber>> fetchSubscriber(int id) async {
    try {
      var response = await httpClient.get('/cards/GetMySubscribers/$id');

      if (response.statusCode == 200) {
        var responseData = response.data;

        if (responseData.containsKey('resultData')) {
          List<Subscriber> subscriberList = [];
          for (var item in responseData['resultData']) {
            var temp = Subscriber.fromJson(item);
            subscriberList.add(temp);
          }
          return subscriberList;
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
}
