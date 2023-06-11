import 'package:flutter/material.dart';
import 'package:weather_api/models/city_info.dart';

class city extends StatelessWidget {
  const city({super.key, required this.information});

  final CityInfo information;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.wb_sunny_rounded),
          const Text(
            'Weather',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),

          const SizedBox(height: 24),

          ListView(
            //change it to seperate list
            // shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' ${information.location?.name}',
                  ),
                  Image.network('${information.current?.condition?.icon}'),
                  Text('${information.current?.tempC}°'),
                ],
              )
            ],
          )
          //----
        ],
      ),
    );
  }
}

