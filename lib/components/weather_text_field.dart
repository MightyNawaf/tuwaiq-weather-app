import 'package:flutter/material.dart';
import 'package:weather_api/components/selecting_sheet.dart';
import 'package:weather_api/screens/home_screen.dart';

class WeatherTextField extends StatefulWidget {
  const WeatherTextField({
    super.key,
  });

  @override
  State<WeatherTextField> createState() => _WeatherTextField();
}

class _WeatherTextField extends State<WeatherTextField> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      cursorColor: Colors.grey[900],
      decoration: InputDecoration(
        focusColor: Colors.grey[900],
        prefixIconColor: Colors.grey[900],
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.grey,
        prefixIcon: const Icon(Icons.search),
        filled: true,
      ),
      onSubmitted: (text) {
        showBottomSheet(
          context: context,
          builder: (context) {
            return SelectingSheet(keyword: text);
          },
        );
      },
    );
  }
}
