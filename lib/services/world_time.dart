// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String location; //location name for the uri
  String? time; //The time in that loaction
  String flag; //url to asset an flag
  String url; //Location url api at the end
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
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
    print(now);

    time = now.toString();
  }
}
