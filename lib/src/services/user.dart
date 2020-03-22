import 'package:camnv_tinder/src/config/config.dart';
import 'package:camnv_tinder/src/data/model/user.dart';
import 'package:camnv_tinder/src/services/database.dart';
import 'package:camnv_tinder/src/services/exception.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RandomUserRepository implements UserRepository {
  final JsonDecoder _decoder = new JsonDecoder();
  DatabaseHelper dbHelper;

  RandomUserRepository() {
    dbHelper = DatabaseHelper();
  }

  @override
  Future<User> fetchUser() async {
    final response = await http.get(Config.url);
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new FetchDataException(
          "Error [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
    }

    final userContainer = _decoder.convert(jsonBody)['results'][0]['user'];
    return User.fromMap(userContainer);
  }

  @override
  Future<User> createUser(User people) async {
    return await dbHelper.addUser(people);
  }

  @override
  Future<int> deleteUser(User user) async {
    return await dbHelper.deleteByEmail(user.email);
  }

  @override
  Future<List<User>> getAllUser() async {
    return await dbHelper.getAllUser();
  }
}
