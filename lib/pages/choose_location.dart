// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag: 'uk.png',
        isDayTime: null),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        flag: 'greece.png',
        isDayTime: null),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag: 'egypt.png',
        isDayTime: null),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'kenya.png',
        isDayTime: null),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: 'usa.png',
        isDayTime: null),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'usa.png',
        isDayTime: null),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'south_korea.png',
        isDayTime: null),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png',
        isDayTime: null),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];

    await instance.getTime();
    //navigation to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Choose your Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
