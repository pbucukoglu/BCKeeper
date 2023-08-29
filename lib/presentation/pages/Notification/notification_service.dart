import 'package:bc_keeper/data/models/Notifications.dart';
import 'package:dio/dio.dart';
import 'package:bc_keeper/data/models/User.dart';
import 'package:flutter/material.dart';

class NotificationService {
  Dio httpClient;
  User? user;
  NotificationService({
    required this.httpClient,
    this.user,
  });

  Future<List<Notifications>> getNotifications() async {
    try {
      var response = await httpClient.get('/users/GetNotifications');

      if (response.statusCode == 200) {
        var responseData = response.data;

        if (responseData.containsKey('resultData')) {
          List<Notifications> notifications = [];
          for (var item in responseData['resultData']) {
            var temp = Notifications.fromJson(item);
            notifications.add(temp);
          }
          return notifications;
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load notification');
      }
    } catch (error) {
      throw Exception('Get notification error: $error');
    }
  }
}
