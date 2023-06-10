import 'package:flutter/material.dart';
import 'package:weather_api/models/city_info.dart';

import '../components/weather_icon.dart';
import '../styles/app_styles.dart';

class CityDetails extends StatelessWidget {
  CityDetails({super.key, required this.info});

  final CityInfo info;
  final String? city = CityInfo().location?.name;
  final String? condition = CityInfo().current?.condition?.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (info.current?.condition?.text == "Clear")
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
                                                              : const Color.fromARGB(255, 70, 70, 70),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 16),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.format_list_bulleted, size: 30)),
                ],
              ),
              const SizedBox(height: 70),
              Text("${info.location?.name}", style: Styles.textStyle2),
              Text("${info.current?.tempC}°",
                  style: Styles.textStyle1),
              WeatherIcon(info: info),
              Text("${info.current?.condition?.text}", style: Styles.textStyle2),
              const SizedBox(height: 10),
              Text("Feels like: ${info.current?.feelslikeC}", style: Styles.textStyle2.copyWith(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
