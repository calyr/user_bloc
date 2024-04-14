import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:user_app/domain/user.dart';

class DataProvider {
  Future<User> fetchUser(String username) async {
    final apiUrl = "https://api.github.com/users/$username";

    try {
      final response = await Dio().get(apiUrl);
      
      if( response.statusCode == 200) {
        final userData = response.data;
        return User.fromMap(userData);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
}