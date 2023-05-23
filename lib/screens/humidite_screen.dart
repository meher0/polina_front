import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:authlaravel/models/Humidite.dart';

class HumiditeScreen extends StatefulWidget {
  const HumiditeScreen({super.key});

  @override
  State<HumiditeScreen> createState() => _HumiditeScreenState();
}

class _HumiditeScreenState extends State<HumiditeScreen> {
  late Future<Humidite> futureHumidite;
  @override
  void initState() {
    super.initState();
    futureHumidite = fetchHumidite();
  }

  Future<Humidite> fetchHumidite() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.146:8000/api/fetch_humidite'));
    final ConvertToJson = json.decode(response.body)[0];
    if (response.statusCode == 200) {
      print(response.body);

      return Humidite.fromJson(ConvertToJson);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100),
        child: FutureBuilder<Humidite>(
          future: futureHumidite,
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
                      progressColor: Colors.blue[700],
                      center: new Text(
                        snapshot.data!.value_hum + '%',
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
                        'Humidite',
                        style: TextStyle(fontSize: 22, color: Colors.blue[900]),
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
