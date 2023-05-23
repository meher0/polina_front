import 'package:flutter/material.dart';
import 'package:authlaravel/screens/acceuil_screen.dart';
import 'package:authlaravel/screens/welcome_screen.dart';
import 'package:authlaravel/screens/temperature_screen.dart';
import 'package:authlaravel/screens/humidite_screen.dart';
import 'package:authlaravel/screens/eclairage_screen.dart';
import 'package:provider/provider.dart';
import 'package:authlaravel/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }

  void read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);
    Provider.of<Auth>(context, listen: false).tryToken(value);
    //print(value);
  }

  //****************content main*****************
  int _currentIndex = 0;
  final List<Widget> _children = [
    AcceuiScreen(),
    EclairageScreen(),
    TemperatureScreen(),
    HumiditeScreen(),
  ];

  //****************End Content Main ************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PouLiNa'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.circle_notifications_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  // do something
                },
              ),
              Positioned(
                right: 30,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text('2'),
                ),
              )
            ],
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffF5591F), Color(0xffF2861E)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        //type: BottomNavigationBarType.fixed,
        //iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 20, 20, 20),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Eclairage',
            backgroundColor: Color.fromARGB(255, 20, 20, 20),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.device_thermostat),
            label: 'Température',
            backgroundColor: Color.fromARGB(255, 20, 20, 20),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.egg),
            label: 'Humidité',
            backgroundColor: Color.fromARGB(255, 20, 20, 20),
          ),
        ],
        selectedItemColor: Colors.orange[900],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: Drawer(child: Consumer<Auth>(builder: (context, auth, child) {
        return ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffF5591F), Color(0xffF2861E)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    //backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/userr.jfif"),
                    radius: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    auth.user.name,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    auth.user.email,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.account_circle),
              onTap: () {},
            ),
            ListTile(
              title: Text('Setting'),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: Text('Privacy'),
              leading: Icon(Icons.privacy_tip),
              onTap: () {},
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                Provider.of<Auth>(context, listen: false).logout();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ),
                ); //navigation
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffF5591F), Color(0xffF2861E)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              padding: EdgeInsets.only(top: 30, left: 60, bottom: 30),
              margin: EdgeInsets.only(top: 445),
              child: Text(
                'All right reserved © 2023',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        );
      })),
    );
  }
}
