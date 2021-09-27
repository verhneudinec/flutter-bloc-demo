import 'dart:convert';

import 'package:flutter_bloc_demo/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final Uri usersUrl = Uri.parse("https://jsonplaceholder.typicode.com/users");

  Future<List<User>> getUser() async {
    final response = await http.get(usersUrl);

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Error fetching users");
    }
  }
}
