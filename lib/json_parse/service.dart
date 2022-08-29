import 'dart:convert';

import 'package:api_call_json_parsing/json_parse/users_model.dart';
import 'package:http/http.dart' as http;

class Service {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        final List<User> users = usersFromJson(response.body);
        return users;
      } else {
        return <User>[];
      }

    } catch (e) {
      return <User>[];
    }
  }
  
}


