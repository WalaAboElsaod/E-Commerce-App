import 'dart:math';
import 'package:ecommerce_app/view/auth/login/login_body.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailContrller = TextEditingController();

  var passwordContrller = TextEditingController();

  bool stc = false;
  bool ispasswordd = false;
  IconData icong = FontAwesomeIcons.googlePlus;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body:LoginBody(),
    );
  }
}
