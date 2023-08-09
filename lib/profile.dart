import "package:flutter/material.dart";
import "package:jwt_decoder/jwt_decoder.dart";

import "model/user.dart";

class Profile extends StatefulWidget {
  final User user;

  const Profile({required this.user, super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // neu decode token ra cac bien khac nhu email password
    //Map<String, dynamic> jwtDecodedToken =
    //    JwtDecoder.decode(widget.refreshToken);
    //var email = jwtDecodedToken['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("LOGGED IN"),
          Text("id: " + widget.user.id),
          Text("email: " + widget.user.email),
          Text("password: " + widget.user.password),
          Text("name: " + widget.user.name),
          Text("role: " + widget.user.role),
          Image.network(widget.user.avatar),
        ],
      ),
    ));
  }
}
