import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../models/User.dart';

class AuthService {
  Dio httpClient;

  AuthService({required this.httpClient});

  Future<User> login(
      {required String email,
      required String password,
      String? culture,
      String? guidstr}) async {
    var data = {
      'email': email,
      'password': password,
      'culinfo': culture,
      'guidstr': guidstr,
    };
    var json = jsonEncode(data);
    var response = await httpClient.post('/token', data: json);
    bool isValid = false;
    if (response.statusCode == 200) isValid = true;

    if (!isValid) throw Exception('Failed to load user');
    User user = User.fromJson(response.data);
    if (user.invalidcause != null) throw Exception(user.invalidcause);
    return user;
  }

  Future<User?> getCurrentUser() async {
    Isar? isar = await Isar.getInstance();
    final dir = await getApplicationDocumentsDirectory();

    isar ??= await Isar.open([UserSchema], directory: dir.path);
    User? user;

    var users = await isar.users.filter().tokenIsNotEmpty().findAll();
    if (users.isEmpty) {
      return null;
    }
    user = users.last;
    return user;
  }

  Future<bool> resetPassword(String oldPassword, String newPassword) async {
    try {
      User? currentUser = await getCurrentUser();
      if (currentUser == null) {
        throw Exception('User not found');
      }

      var data = {
        'old_password': oldPassword,
        'new_password': newPassword,
      };
      var json = jsonEncode(data);
      httpClient.options.headers["Authorization"] =
          'Bearer ${currentUser.token}';
      var response = await httpClient.post('/users/Resetpassword', data: json);

      // success
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw Exception('Reset password error: $error');
    }
  }

  Future<void> updateUserProfile(User updatedUser) async {
    try {
      User? currentUser = await getCurrentUser();
      if (currentUser == null) {
        throw Exception('User not found');
      }

      var data = {
        'title': updatedUser.title,
        'name': updatedUser.name,
        'surname': updatedUser.surname,
        'email': updatedUser.email,
        'pictureurl': updatedUser.pictureurl,
        'picturechanged': updatedUser.picturechanged.toString(),
        'imgstr': updatedUser.imgstr,
      };
      var json = jsonEncode(data);
      httpClient.options.headers["Authorization"] =
          'Bearer ${currentUser.token}';
      var response =
          await httpClient.put('/Users/UpdateUserProfile/', data: json);

      // success
      if (response.statusCode != 200) {
        throw Exception('Failed to update user profile');
      }
    } catch (error) {
      throw Exception('Update user profile error: $error');
    }
  }
}
