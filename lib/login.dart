import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:refresh_token_tutorial/profile.dart';
import 'package:refresh_token_tutorial/model/user.dart';
import 'package:refresh_token_tutorial/service/config.dart';
import 'package:refresh_token_tutorial/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/long_button.dart';
import 'widget/textfild.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  late SharedPreferences prefs;
  late UserService userService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start();
  }

  void start() async {
    prefs = await SharedPreferences.getInstance();
    userService = await UserService.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "TEST AUTHEN TOKEN",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ))
                // child: Text(
                //   "NECOPIA",
                //   style: TextStyle(
                //       fontSize: 35,
                //       fontWeight: FontWeight.w900,
                //       color: Colors.black87),
                // )),
                ),
            Expanded(
              flex: 3,
              child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFild(
                          hintTxt: "Email",
                          controller: emailController,
                          image: Icons.email,
                          width: width / 2),
                      TextFild(
                          isObs: true,
                          hintTxt: "Password",
                          controller: passwordController,
                          image: Icons.lock,
                          width: width / 2)
                    ],
                  )),
            ),
            Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.bottomCenter,
                      child: LongGreenButton(
                          txt: "Log in",
                          width: width,
                          onTap: () {
                            //Navigator.pushAndRemoveUntil(
                            //    context,
                            //    MaterialPageRoute(
                            //        builder: (context) => NavBar()),
                            //    (route) => false);

                            userService
                                .loginUser(emailController.text,
                                    passwordController.text)
                                .then((user) => {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Profile(user: user)),
                                          (route) => false)
                                    });
                          }),
                    ),
                  ],
                )),
            //Expanded(
            //  flex: 2,
            //  child: Container(
            //    alignment: Alignment.bottomCenter,
            //    child: Image.asset(
            //      'assets/images/planting.png',
            //      width: width,
            //      fit: BoxFit.fitWidth,
            //    ),
            //  ),
            //),
          ],
        ),
      ),
    );
  }
}
