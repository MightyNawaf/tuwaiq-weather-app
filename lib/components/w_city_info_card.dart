import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/models/city_info.dart';

class WCityInfoCard extends StatelessWidget {
  const WCityInfoCard({super.key, required this.info});

  final CityInfo info;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w400, fontSize: 16);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue,
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
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateTime.parse('${info.location?.localtime}:00').getTimeFrom,
                    style: textStyle,
                  ),
                ],
              ),
              Text(
                '${info.current?.condition?.text}',
                style: textStyle,
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
