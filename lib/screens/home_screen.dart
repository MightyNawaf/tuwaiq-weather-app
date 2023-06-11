import 'package:flutter/material.dart';
import 'package:weather_api/components/city_card.dart';
import 'package:weather_api/components/w_city_info_card.dart';
import 'package:weather_api/components/w_text_field.dart';
import 'package:weather_api/data.dart';
import 'package:weather_api/extinstions/context.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Icon(Icons.wb_sunny_rounded),
                  Text(
                    'Weather',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const WTextField(),
              const SizedBox(height: 24),


              ListView(
                
                //change it to seperate list
                shrinkWrap: true,
                children: [
                  
                  for (final city in Data.favoriteCities)
                    InkWell(
                      child: WCityInfoCard(info: city),
                      onTap: () {
                        context.pushPage(CityCard(info: city));
                      },
                    ),
                ],
              )
              //----
            ],
          ),
        ),
      ),
    );
  }
}
