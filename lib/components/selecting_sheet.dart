import 'package:flutter/material.dart';
import 'package:weather_api/data.dart';

import '../screens/home_screen.dart';
import '../services/api.dart';

class SelectingSheet extends StatelessWidget {
  const SelectingSheet({super.key, required this.keyword});

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.80,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(110, 26, 26, 26),
        body: FutureBuilder(
            future: ApiService().getCityInfo(keyword),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Data.favoriteCities.add(snapshot.data!);
                          Navigator.pop(context);
                          // ignore: invalid_use_of_protected_member
                          context.findRootAncestorStateOfType<HomeScreenState>()?.setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(53, 255, 255, 255),
                          fixedSize: const Size(300, 24),
                        ),
                        child: const Text('Add'),
                      ),
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