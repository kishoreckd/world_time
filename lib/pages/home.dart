// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            child: const Icon(Icons.edit_location),
          ),
        ],
      )),
    );
  }
}
