import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:weather_api/screens/SelectingSheet.dart';

class WTextField extends StatefulWidget {
  const WTextField({
    super.key,
  });

  @override
  State<WTextField> createState() => _WTextFieldState();
}

class _WTextFieldState extends State<WTextField> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      cursorColor: Colors.blueGrey[900],
      decoration: InputDecoration(
        prefixIconColor: Colors.blueGrey[900],
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
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
    ).asGlass(
        clipBorderRadius: BorderRadius.circular(18),
        tintColor: Colors.blueGrey.shade900);
  }
}
