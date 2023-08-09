import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/user.dart';
import 'config.dart';

class UserService {
  static UserService _instance = UserService._();
  static Future<UserService> getInstance() async {
    if (_instance == null) _instance = new UserService._();
    if (_instance.prefs == null)
      _instance.prefs = await SharedPreferences.getInstance();
    return _instance;
  }

  UserService._() {}

  SharedPreferences? prefs;
  Future<User> loginUser(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      var reqBody = {"email": email, "password": password};
      print(reqBody["email"]);
      print(reqBody["password"]);
      var response = await http.post(Uri.parse(token_api),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));
      var jsonResponse = await jsonDecode(response.body);
      print("response: ");
      print(jsonResponse);
      var aToken = jsonResponse['access_token']; // lay access token tu respons
      var rToken = jsonResponse['refresh_token'];
      // luu refresh_token vao trong shared_preferences
      prefs?.setString('refresh_token', rToken);
      prefs?.setString('access_token', aToken);

      var responseFromToken = await http.get(Uri.parse(user_api),
          headers: {"Authorization": "Bearer $aToken"});
      var userJson = await jsonDecode(responseFromToken.body);
      return User.fromJson(userJson);
    }
    return Future.error("Email and password is empty");
  }

  Future<User> loginUserFromToken() async {
    var aToken = prefs?.getString('access_token');
    if (aToken == null) {
      return Future.error("Access token is empty");
    }
    var responseFromToken = await http
        .get(Uri.parse(user_api), headers: {"Authorization": "Bearer $aToken"});
    var userJson = await jsonDecode(responseFromToken.body);
    return User.fromJson(userJson);
  }
}
