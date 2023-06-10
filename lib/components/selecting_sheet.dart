import 'package:flutter/material.dart';
import 'package:weather_api/models/city_info.dart';

import '../components/weather_icon.dart';
import '../styles/app_layout.dart';
import '../styles/app_styles.dart';
import 'add_button.dart';

class SelectingSheet extends StatelessWidget {
  SelectingSheet({super.key, required this.keyword, this.info});

  final CityInfo? info;
  final String? city = CityInfo().location?.name;
  final String? condition = CityInfo().current?.condition?.text;

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 95, 104, 110),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0)),
      ),
      height: MyAppLayout().getSize(context).height * 0.98,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                AddButton(keyword: keyword),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 70),
                Text("${CityInfo().location?.name}", style: Styles.textStyle2),
                Text("${CityInfo().current?.tempC}°", style: Styles.textStyle1),
                WeatherIcon(),
                Text("${CityInfo().current?.condition?.text}", style: Styles.textStyle2),
                const SizedBox(height: 10),
                Text("Feels like: ${CityInfo().current?.feelslikeC}", style: Styles.textStyle2.copyWith(fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
