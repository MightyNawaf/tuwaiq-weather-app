// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:rive/rive.dart';
import 'package:weather_api/data.dart';
import 'package:weather_api/screens/home_screen.dart';
import 'package:weather_api/services/api.dart';

class SelectingSheet extends StatelessWidget {
  const SelectingSheet({super.key, required this.keyword});

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Scaffold(
        backgroundColor: Colors.blue.shade800.withOpacity(0.6),
        body: FutureBuilder(
            future: ApiService().getCities(keyword),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Icon(Icons.drag_handle_rounded),
                      const SizedBox(
                        height: 12,
                      ),
                      //Show Cities with Similar result to keyword
                      for (var city in snapshot.data!)
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        city.name.toString(),
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                        city.country.toString(),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.grey.shade200.withOpacity(0.7),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.blue.shade900.withOpacity(0.6),
                                      ),
                                    ),
                                    onTap: () async {
                                      Data.favoriteCities.add(await ApiService()
                                          .getCityInfo(city.lat, city.lon));
                                      Navigator.pop(context);
                                      context
                                          .findRootAncestorStateOfType<
                                              HomeScreenState>()
                                          ?.refresh();
                                    },
                                  )
                                ],
                              ),
                            ).asGlass(
                                clipBorderRadius: BorderRadius.circular(18),
                                tintColor: Colors.white),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              }
              return const Center(child: RiveAnimation.asset('assets/images/2741-5623-cloud-and-sun.riv'));
            }),
      ),
    );
  }
}
