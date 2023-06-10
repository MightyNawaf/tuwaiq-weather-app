

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/models/city_info.dart';

class WCityInfoCard extends StatelessWidget {
  const WCityInfoCard({super.key, required this.info});

  final CityInfo info;

  @override
  Widget build(BuildContext context) {
    final String? date = info.location?.localtime;
    final textStyle = TextStyle(
        color: Colors.grey.shade700, fontWeight: FontWeight.w400, fontSize: 16);
      
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        
        color: (info.current?.condition?.text == "Clear") ? Colors.blue
        : (info.current?.condition?.text == "Cloudy") ? const Color.fromARGB(255, 105, 102, 102) 
        : (info.current?.condition?.text == "Sunny") ? const Color.fromARGB(115, 255, 255, 116) 
        : (info.current?.condition?.text == "Snowy") ? const Color.fromARGB(189, 90, 153, 154)
        : (info.current?.condition?.text == "Light rain") ? const Color.fromARGB(134, 89, 209, 211)
        : (info.current?.condition?.text == "Thunder") ? const Color.fromARGB(245, 15, 24, 62)
        : (info.current?.condition?.text == "Stormy") ? const Color.fromARGB(76, 51, 74, 177)
        : (info.current?.condition?.text == "Lightning") ? const Color.fromARGB(161, 86, 37, 124)
        : Colors.blue
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
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (date![date.length-5]+date[date.length-4]+date[date.length-3]+date[date.length-2]+date[date.length-1]),
                        
                    style: const TextStyle(
                      color: Color.fromARGB(176, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              Text(
                '${info.current?.condition?.text}',
                style: const TextStyle(
                      color: Color.fromARGB(176, 255, 255, 255),
                    ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${info.current?.tempC}°',
                style: const TextStyle(fontSize: 40),
              ),
              Text(
                'Feels like: ${info.current?.feelslikeC}',
                style: textStyle.copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

extension WDateTimeToString on DateTime {
  String get getTimeFrom => DateFormat('kk:mm').format(this);
}

