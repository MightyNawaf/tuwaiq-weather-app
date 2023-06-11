import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/models/city_info.dart';

class WCityInfoCard extends StatelessWidget {
  const WCityInfoCard({super.key, required this.info});

  final CityInfo info;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: Colors.white70, fontWeight: FontWeight.w400, fontSize: 16);
    return Container(
      height: 128,
      padding: const EdgeInsets.all(16),
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
                        fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  Text('${info.location?.country}'),
                ],
              ),
              Text(
                '${info.location?.localtime?.substring(info.location!.localtime!.indexOf(' '), info.location!.localtime!.indexOf(':'))}:${info.location?.localtime?.substring(info.location!.localtime!.indexOf(':') + 1, info.location?.localtime?.length)}',
                style: textStyle,
              ),
              Row(
                children: [
                  Text(
                    '${info.current?.condition?.text}  ',
                    style: textStyle,
                  ),
                  // ImageIcon((AssetImage(
                  // 'assets/icons/${info.current?.condition?.icon?.substring(info.current!.condition!.icon!.indexOf('64x64'), info.current?.condition?.icon?.length)}',
                  // )
                  // )),
                ],
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
    ).asGlass(
        clipBorderRadius: BorderRadius.circular(18),
        tintColor: Colors.teal.shade100);
  }
}

extension WDateTimeToString on DateTime {
  String get getTimeFrom => DateFormat('kk:mm').format(this);
}
