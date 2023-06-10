import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/models/city_info.dart';

import '../screens/city_details.dart';
		
class WCityInfoCard extends StatelessWidget {
  WCityInfoCard({super.key, required this.info});

  final CityInfo info;
  final String? city = CityInfo().location?.name;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CityDetails(info: info),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: (info.current?.condition?.text == "Clear")
              ? const Color.fromARGB(255, 122, 195, 244)
              : (info.current?.condition?.text == "Cloudy")
                  ? const Color.fromARGB(255, 198, 210, 218)
                  : (info.current?.condition?.text == "Partly cloudy")
                      ? const Color.fromARGB(255, 178, 185, 189)
                      : (info.current?.condition?.text == "Overcast")
                          ? const Color.fromARGB(255, 178, 185, 189)
                          : (info.current?.condition?.text == "Sunny")
                              ? const Color.fromARGB(255, 127, 204, 255)
                              : (info.current?.condition?.text == "Light rain")
                                  ? const Color.fromARGB(255, 92, 121, 142)
                                  : (info.current?.condition?.text == "Snowy")
                                      ? const Color.fromARGB(255, 198, 210, 218)
                                      : (info.current?.condition?.text == "Sleeting")
                                          ? const Color.fromARGB(255, 114, 131, 143)
                                          : (info.current?.condition?.text == "Stormy")
                                              ? const Color.fromARGB(255, 245, 231, 177)
                                              : (info.current?.condition?.text == "Lightning")
                                                  ? const Color.fromARGB(255, 164, 147, 48)
                                                  : (info.current?.condition?.text == "Thunder")
                                                      ? const Color.fromARGB(255, 255, 213, 0)
                                                      : (info.current?.condition?.text == "Windy")
                                                          ? const Color.fromARGB(255, 142, 101, 200)
                                                          : (info.current?.condition?.text == "Foggy")
                                                              ? const Color.fromARGB(255, 142, 65, 152)
                                                              : (info.current?.condition?.text == "Hailing")
                                                                  ? const Color.fromARGB(255, 103, 179, 62)
                                                                  : const Color.fromARGB(255, 133, 100, 100),
        ),
        height: 120,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${info.location?.name}',
                      style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '${info.current?.condition?.text}',
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${info.current?.tempC}°',
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  'Feels like: ${info.current?.feelslikeC}',
                  style: textStyle.copyWith(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

extension WDateTimeToString on DateTime {
  String get getTimeFrom => DateFormat('kk:mm').format(this);
}
