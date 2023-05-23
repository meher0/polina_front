import 'dart:convert';

import 'package:authlaravel/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:authlaravel/services/dio.dart';

class ReclamationScreen extends StatelessWidget {
  const ReclamationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _identifientController = TextEditingController();
    TextEditingController _messageController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    sendReclamation(Map datas) async {
      Dio.Response response =
          await dio().postUri(Uri.parse('/add'), data: datas);
      return json.decode(response.data);
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.warning_amber,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        title: Text('Reclamation'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ); //navigation
          },
          icon: const Icon(Icons.arrow_back),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 145, 8, 8),
                Color.fromARGB(255, 224, 6, 6)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 191, 7, 7),
                      Color.fromARGB(255, 249, 70, 70)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                height: 852,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, right: 20, left: 20),
                      height: 700,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: 30, right: 20, left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(90),
                                  bottomRight: Radius.circular(90)),
                              gradient: LinearGradient(
                                colors: [
                                  (Color.fromARGB(255, 28, 28, 27)),
                                  (Color.fromARGB(255, 46, 46, 46))
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Text(
                              'Reclamer a un probléme',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 50),
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
                              cursorColor: Colors.red[900],
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.red[900],
                                ),
                                hintText: "Enter Name",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              controller: _nameController,
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'Username is Required'
                                    : null;
                              },
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 50),
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
                              cursorColor: Colors.red[900],
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.red[900],
                                ),
                                hintText: "Enter number phone",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              controller: _phoneController,
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'number is Required'
                                    : null;
                              },
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 50),
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
                              cursorColor: Colors.red[900],
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.key,
                                  color: Colors.red[900],
                                ),
                                hintText: "Enter identifient",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              controller: _identifientController,
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'id is Required'
                                    : null;
                              },
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 50),
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
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              cursorColor: Colors.red[900],
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.file_copy,
                                  color: Colors.red[900],
                                ),
                                hintText: "Enter content",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              controller: _messageController,
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'Content is Required'
                                    : null;
                              },
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 50),
                              alignment: Alignment.center,
                              height: 45,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 158, 6, 6),
                                    Color.fromARGB(255, 243, 7, 7)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                "Envoyer",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ),
                            onTap: () {
                              Map datas = {
                                'name': _nameController.text,
                                'phone': _phoneController.text,
                                'identifient': _identifientController.text,
                                'message': _messageController.text,
                              };

                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Reclamation sent with success')),
                                );
                                sendReclamation(datas);

                                Navigator.pop(context);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
