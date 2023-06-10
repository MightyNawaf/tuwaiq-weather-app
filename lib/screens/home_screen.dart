import 'package:flutter/material.dart';
import 'package:weather_api/components/w_city_info_card.dart';
import 'package:weather_api/components/w_text_field.dart';
import 'package:weather_api/data.dart';
import 'package:weather_api/services/api.dart';

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
          child: SingleChildScrollView(
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
                    for (final city in Data.favoriteCities) WCityInfoCard(info: city),
                  ],
                )
              ],
            ),
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
      height: MediaQuery.of(context).size.height * 0.9,
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: FutureBuilder(
            future: ApiService().getCityInfo(keyword),
            builder: (context, snapshot) {

              if(snapshot.data !=null) {
                if(snapshot.data?.location?.name !=null) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 64,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.black54,
                          // height: 100,
                          width: double.infinity,
                          child: ListTile(
                            title: Text("${snapshot.data?.location?.name ?? ""}"),
                            subtitle: Text("${snapshot.data?.location?.region ?? ""}"),
                            trailing: Text("${snapshot.data?.location?.country ?? ""}"),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Data.favoriteCities.add(snapshot.data!);
                            Navigator.pop(context);
                            context.findRootAncestorStateOfType<HomeScreenState>()?.setState(() {});
                          },
                          child: const Text('Add'),
                        ),
                      )
                    ],
                  );
                }
              }

              return const Center(child: Text('Not Found'));
            }),
      ),
    );
  }
}
