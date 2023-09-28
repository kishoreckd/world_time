// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; //location name for the uri
  String? time; //The time in that loaction
  String flag; //url to asset an flag
  String url; //Location url api at the end
  bool? isDayTime;
  WorldTime(
      {required this.location,
      required this.flag,
      required this.url,
      required this.isDayTime});

  Future<void> getTime() async {
    try {
      /**Making the request to get date and time */
      var response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      var data = jsonDecode(response.body);
      // print(data);

      /***Getting Properties from the data */
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      // print(dateTime);
      // print(offset);

      /***Creating a date time object */
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      /***CHecking Day or night by time */
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      /**Setting the time format with intl package */
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error:$e');
      time = 'could not get time and date';
    }
  }
}
