import 'package:flutter/material.dart';
import 'package:weather_api/components/w_city_info_card.dart';
import 'package:weather_api/components/w_text_field.dart';
import 'package:weather_api/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Weather', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
            const SizedBox(height: 8),
            const WTextField(),
            const SizedBox(height: 24),
            ListView(
              shrinkWrap: true,
              children: [
                for (final city in Data.favoriteCities) WCityInfoCard(info: city),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
