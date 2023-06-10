import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/city_model.dart';

class ConditionCard extends StatelessWidget {
  const ConditionCard({super.key, required this.city});

  final CityModel city;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 322,
      height: 70,
      decoration: BoxDecoration(
          color: white, borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('wind',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: black, fontFamily: 'Tajawal')),
                Text('${city.current.windKph}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: black))
              ],
            ),
            Column(
              children: [
                Text('Humidity',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: black, fontFamily: 'Tajawal')),
                Text('${city.current.humidity}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: black, fontFamily: 'Tajawal'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
