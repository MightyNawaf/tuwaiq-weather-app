import 'package:flutter/material.dart';

import '../data.dart';
import '../screens/home_screen.dart';
import '../services/api.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.keyword,
  });

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService().getCityInfo(keyword),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return InkWell(
              onTap: () {
                Data.favoriteCities.add(snapshot.data!);
                Navigator.pop(context);
                // ignore: invalid_use_of_protected_member
                context.findRootAncestorStateOfType<HomeScreenState>()?.setState(() {});
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }
          return const Center(child: Text(''));
        });
  }
}
