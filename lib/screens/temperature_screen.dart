import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:authlaravel/services/dio.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:authlaravel/models/Temperature.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  late Future<Temperature> futureTemperature;
  @override
  void initState() {
    super.initState();
    futureTemperature = fetchTemperature();
  }

  Future<Temperature> fetchTemperature() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.146:8000/api/fetch_temperature'));
    final ConvertToJson = json.decode(response.body)[0];
    if (response.statusCode == 200) {
      // print(response.body);

      return Temperature.fromJson(ConvertToJson);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100),
        child: FutureBuilder<Temperature>(
          future: futureTemperature,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  children: [
                    new CircularPercentIndicator(
                      radius: 100,
                      lineWidth: 15,
                      animation: true,
                      percent: 0.7,
                      progressColor: Colors.red[700],
                      center: new Text(
                        snapshot.data!.value_tem + '°',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Temperature',
                        style: TextStyle(fontSize: 22, color: Colors.red[900]),
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return Center(
              child: CircularProgressIndicator(color: Colors.orange),
            );
          },
        ),
      ),
    );
  }
}
