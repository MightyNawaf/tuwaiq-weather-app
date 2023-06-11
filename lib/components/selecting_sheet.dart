import 'package:flutter/material.dart';
import 'package:weather_api/components/city_card.dart';
import 'package:weather_api/components/w_city_info_card.dart';
import 'package:weather_api/data.dart';
import 'package:weather_api/extinstions/context.dart';
import 'package:weather_api/models/city_info.dart';
import 'package:weather_api/screens/city.dart';
import 'package:weather_api/screens/home_screen.dart';
import 'package:weather_api/services/api.dart';

class SelectingSheet extends StatelessWidget {
  const SelectingSheet({super.key, required this.keyword});

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: FutureBuilder(
            future: ApiService().getCityInfo(keyword),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Column(
                  children: [
                    WCityInfoCard(
                      info: snapshot.data!,
                    ),
                    //CityCard(info: snapshot.data!),
                    const SizedBox(
                      height: 64,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Data.favoriteCities.add(snapshot.data!);
                        Navigator.pop(context);
                        context
                            .findRootAncestorStateOfType<HomeScreenState>()
                            ?.setState(() {});
                      },
                      child: const Text('Add'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Data.favoriteCities.remove(snapshot.data!);
                        Navigator.pop(context);
                        // context
                        //     .findRootAncestorStateOfType<HomeScreenState>()
                        //     ?.setState(() {});
                      },
                      child: const Text('remove'),
                    )
                  ],
                );
              }
              return const Center(child: Text('Not Found'));
            }),
      ),
    );
  }
}
