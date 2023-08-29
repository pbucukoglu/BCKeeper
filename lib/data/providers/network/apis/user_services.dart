import 'package:bc_keeper/data/models/User.dart';
import 'package:dio/dio.dart';

import 'package:bc_keeper/data/models/UserModel.dart';

class UserService {
  final Dio httpClient;

  UserService({required this.httpClient, User? user});

  Future<void> updateUserProfile(UserModel updatedUser) async {
    try {
      var response = await httpClient.put(
        '/Users/UpdateUserProfile/',
        data: updatedUser.toJson(),
      );

      if (response.statusCode != 200) {
        throw Exception('An error occurred while updating user profile');
      }
    } catch (error) {
      throw Exception('Error updating user profile: $error');
    }
  }

  Future<Response> getQRCodeForCard(int id) async {
    try {
      var response = await httpClient.get('/$id');
      return response;
    } catch (error) {
      throw Exception('Error getting QR code for card: $error');
    }
  }
}
