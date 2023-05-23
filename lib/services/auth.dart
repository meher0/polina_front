import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:authlaravel/services/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:authlaravel/screens/about_screen.dart';
import 'package:authlaravel/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;

  late User _user;
  late String _token;

  bool get authenticated => _isLoggedIn;
  User get user => _user;

  // Obtain shared preferences.

  Future login(Map creds) async {
    try {
      Dio.Response response = await dio().post('/sanctum/token', data: creds);
       String token = response.data.toString();
      this.tryToken(token);

      
    } catch (e) {
      print(e.toString());
    }
  }

  void tryToken(token) async {
    try {
      if (token == token) {
        try {
          Dio.Response response = await dio().get('/user',
              options:
                  Dio.Options(headers: {'Authorization': 'Bearer $token'}));
          this._isLoggedIn = true;
          this._user = User.fromJson(response.data);
          this._token = token;
          this.save(token);
          notifyListeners();
          print(_user);
        } catch (e) {
          print(e);
        }
      } else {
        print('incorrect token');
      }
    } catch (e) {
      print(e);
    }
  }

  void save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  void cleanToken() async {
    //this._user = null;
    //this._token = null;

    this._isLoggedIn = false;
    // Remove data for the 'counter' key.
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('user');
  }

  void logout() async {
    try {
      Dio.Response response = await dio().get('/user/revoke',
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
      cleanToken();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
