import 'dart:async';
import 'package:authlaravel/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:authlaravel/services/auth.dart';
import 'package:authlaravel/screens/home_screen.dart';
import 'package:authlaravel/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return iniwidget();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    starTimer();
  }

  starTimer() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, directionRoute);
  }

  directionRoute() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);

    Provider.of<Auth>(context, listen: false).tryToken(value);

    if (value == value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    }
    if (value == null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }
  }

  Widget iniwidget() {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [(new Color(0xffF5591F)), (new Color(0xffF2861E))],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: Image.asset(
              "images/poulet.webp",
              width: 120,
            ),
          ),
        )
      ]),
    );
  }
}
