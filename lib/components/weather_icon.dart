import 'package:flutter/material.dart';

import '../models/city_info.dart';

class WeatherIcon extends StatelessWidget {
  WeatherIcon({super.key, this.info});

  final CityInfo? info;
  final String? condition = CityInfo().current?.condition?.text;

  @override
  Widget build(BuildContext context) {
    return Image.asset((condition == "Clear")
        ? "icons/clear-day.png"
        : (condition == "Sunny")
            ? "icons/sunny-1.png"
            : (condition == "Clear")
                ? "icons/clear-day.png"
                : (condition == "Cloudy")
                    ? "icons/cloudy.png"
                    : (condition == "Overcast")
                        ? "icons/cloudy.png"
                        : (condition == "Partly cloudy")
                            ? "icons/cloudy.png"
                            : (condition == "Light rain")
                                ? "icons/rain.png"
                                : (condition == "Thunder")
                                    ? "icons/thunder.png"
                                    : "icons/sunny-1.png");
  }
}
