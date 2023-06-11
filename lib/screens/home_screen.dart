import 'package:flutter/material.dart';
import 'package:weather_api/components/w_city_info_card.dart';
import 'package:weather_api/components/w_text_field.dart';
import 'package:weather_api/data.dart';
import 'package:weather_api/services/api.dart';
import 'package:weather_icons/weather_icons.dart';

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
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.blue.shade700,
              Colors.blue.shade200,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 16,
                    width: 170,
                  ),
                  const Text(
                    'Weather',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white70),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              const Text(
                'Select city',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 8),
              const WTextField(),
              const SizedBox(height: 24),
              ListView(
                shrinkWrap: true,
                children: [
                  for (final city in Data.favoriteCities)
                    WCityInfoCard(info: city),
                ],
              ),
              // ListView.builder(
              //     padding: EdgeInsets.all(8),
              //     itemCount: Data.favoriteCities.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return ListView(
              //         shrinkWrap: true,
              //         children: [
              //           for (final city in Data.favoriteCities)
              //             WCityInfoCard(info: city),
              //         ],
              //       );
              //     },),
              // ListView.separated(
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) => Container(
              //     // padding: EdgeInsets.all(12),
              //     child: ListView(
              //       children: [
              //         for (final city in Data.favoriteCities)
              //           WCityInfoCard(info: city),
              //       ],
              //     ),
              //   ),
              //   separatorBuilder: (context, index) => SizedBox(
              //     height: 10,
              //   ),
              //   itemCount: Data.favoriteCities.length,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectingSheet extends StatelessWidget {
  const SelectingSheet({super.key, required this.keyword});

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Scaffold(
        backgroundColor: Color.fromARGB(128, 253, 253, 253),
        body: FutureBuilder(
            future: ApiService().getCityInfo(keyword),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 7,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      const Text(
                        'Add the city of your choice',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 40,
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            Data.favoriteCities.add(snapshot.data!);
                            Navigator.pop(context);
                            context
                                .findRootAncestorStateOfType<HomeScreenState>()
                                ?.setState(() {});
                          },
                          child: const Text('Add'),
                        ),
                      )
                    ],
                  ),
                );
              }
              return const Center(child: Text('Not Found'));
            }),
      ),
    );
  }
}
