// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    /**Making the request to get date and time */
    var response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Europe/Tirane'));
    var data = jsonDecode(response.body);
    print(data);

    /***Getting Properties from the data */
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(0, 3);
    // print(dateTime);
    // print(offset);

    /***Creating a date time object */
    DateTime now = DateTime.parse(dateTime);
    now =now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(' Loading'),
      ),
      body: const Text('loading'),
    );
  }
}
