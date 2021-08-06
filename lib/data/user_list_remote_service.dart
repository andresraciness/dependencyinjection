import 'dart:convert';

import 'package:dependencyinjection/domain/user.dart';
import 'package:http/http.dart' as http;

class UserListRemoteService {
  Future<List<User>> getUsers() async {
    final _url = Uri.parse('http://jsonplacehoder.typicode.com/users');

    final data = await http.get(_url);
    final users =
        (jsonDecode(data.body) as List).map((e) => User.fromJson(e)).toList();

    return users;
  }
}
