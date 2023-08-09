import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:refresh_token_tutorial/dashboard.dart';
import 'package:refresh_token_tutorial/login.dart';
import 'package:refresh_token_tutorial/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //đảm bảo được khởi tạo ok
  //tao 1 instance cua shared_preferences class
  SharedPreferences prefs = await SharedPreferences.getInstance();
  UserService userService = await UserService.getInstance();
  User? user;
  await userService.loginUserFromToken().then((loggedInUser) {
    user = loggedInUser;
  }).onError((error, stackTrace) {
    print(error.toString() + stackTrace.toString());
  });
  runApp(MainApp(
    user: user,
  ));
}

class MainApp extends StatelessWidget {
  User? user;
  MainApp({this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: (user == null) ? LoginScreen() : Dashboard(user: user!));
  }
}
