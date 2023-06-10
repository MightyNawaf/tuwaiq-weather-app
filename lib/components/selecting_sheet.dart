import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data.dart';
import '../screens/home_screen.dart';
import '../services/api.dart';

class SelectingSheet extends StatelessWidget {
  const SelectingSheet({super.key, required this.keyword});

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: FutureBuilder(
            future: ApiService().getCityInfo(keyword),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Data.favoriteCities.add(snapshot.data!);
                        Navigator.pop(context);
                        context
                            .findRootAncestorStateOfType<HomeScreenState>()
                            ?.setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: Colors.greenAccent),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Add City',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ],
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
