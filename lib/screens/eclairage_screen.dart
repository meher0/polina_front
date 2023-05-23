import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:authlaravel/models/Eclairage.dart';

class EclairageScreen extends StatefulWidget {
  const EclairageScreen({super.key});

  @override
  State<EclairageScreen> createState() => _EclairageScreenState();
}

class _EclairageScreenState extends State<EclairageScreen> {
  late Future<Eclairage> futureEclairage;
  @override
  void initState() {
    super.initState();
    futureEclairage = fetchEclairage();
   
  }

  

  Future<Eclairage> fetchEclairage() async {
    final response = await http
        .get(Uri.parse('http://192.168.1.146:8000/api/fetch_eclairage'));
    final ConvertToJson = json.decode(response.body)[0];
    if (response.statusCode == 200) {
      //print(response.body);
      return Eclairage.fromJson(ConvertToJson);
    } else {
      throw Exception('Failed to load eclairage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100),
        child: FutureBuilder<Eclairage>(
          future: futureEclairage,
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
                      progressColor: Colors.yellow[700],
                      center: new Text(
                        snapshot.data!.value_ecl + 'H',
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
                        'Eclairage',
                        style:
                            TextStyle(fontSize: 22, color: Colors.yellow[900]),
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
