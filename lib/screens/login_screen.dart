import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:authlaravel/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:authlaravel/services/dio.dart';
import 'package:dio/dio.dart' as Dio;

import 'package:authlaravel/screens/login_screen.dart';
import 'package:authlaravel/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.text = 'tbinimeher6@gmail.com';
    _passwordController.text = '12345678';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                gradient: LinearGradient(
                  colors: [(new Color(0xffF5591F)), (new Color(0xffF2861E))],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.asset(
                        "images/poulet.webp",
                        height: 90,
                        width: 90,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      alignment: Alignment.bottomRight,
                      //color: Colors.white,
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEEE),
                  )
                ],
              ),
              alignment: Alignment.center,
              child: TextFormField(
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.orange,
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                controller: _emailController,
                validator: (value) {
                  return value == null || value.isEmpty
                      ? 'Username is Required'
                      : null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEEE),
                  )
                ],
              ),
              alignment: Alignment.center,
              child: TextFormField(
                obscureText: true,
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.orange,
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is Required.';
                  }
                  if (value.length < 8) {
                    return 'Password too short.';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, right: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Text(
                  "Forget Password ?",
                  style: TextStyle(color: Colors.orange[900]),
                ),
                onTap: () => {},
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 80),
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffF5591F), Color(0xffF2861E)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              onTap: () {
                Map creds = {
                  'email': _emailController.text,
                  'password': _passwordController.text,
                  'device_name': 'Android',
                };

                if (_formKey.currentState!.validate()) {
                  final response =
                      Provider.of<Auth>(context, listen: false).login(creds);

                  if (response != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }

                  //Provider.of<Auth>(context, listen: false).login(creds);
                  //
                }
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 50),
              child: Text(
                "______ Or Login with ______",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  FontAwesomeIcons.squareFacebook,
                  size: 50,
                  color: Colors.blue[900],
                ),
                Icon(
                  FontAwesomeIcons.squareGooglePlus,
                  size: 50,
                  color: Colors.red[900],
                ),
                Icon(
                  FontAwesomeIcons.squareTwitter,
                  size: 50,
                  color: Colors.blue[200],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
