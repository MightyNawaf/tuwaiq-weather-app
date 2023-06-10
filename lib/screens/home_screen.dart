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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Weather',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const SizedBox(height: 8),
              const WTextField(),
              const SizedBox(height: 24),
              ListView(
                shrinkWrap: true,
                children: [
                  for (final city in Data.favoriteCities) Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: WCityInfoCard(info: city),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}