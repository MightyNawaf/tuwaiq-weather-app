import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:intl/intl.dart';
import '../models/city_model.dart';
import '../constants/colors.dart';
import 'condition_card.dart';

class CityInfoCard extends StatelessWidget {
  const CityInfoCard({super.key, required this.info});

  final CityModel info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlassmorphicContainer(
          width: 322,
          height: 246,
          borderRadius: 40,
          linearGradient: LinearGradient(
              colors: [white.withOpacity(0.1), white.withOpacity(0.5)]),
          border: 1,
          blur: 20,
          borderGradient: LinearGradient(
              colors: [white.withOpacity(0.1), white.withOpacity(0.05)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                info.location.region,
                style: TextStyle(
                    fontSize: 20, color: white, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${info.current.tempC}',
                    style: TextStyle(
                        fontSize: 30,
                        color: white,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset('images/Group 43.png'),
                ],
              ),
              Text(
                'Feels like ${info.current.feelslikeC}',
                style: TextStyle(
                    fontSize: 20, color: white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        ConditionCard(city: info)
      ],
    );
  }
}

extension WDateTimeToString on DateTime {
  String get getTimeFrom => DateFormat('kk:mm').format(this);
}
