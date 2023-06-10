import 'package:flutter/material.dart';

import 'Selecting_sheet.dart';

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
        fillColor: const Color.fromARGB(255, 45, 44, 44),
        prefixIcon: const Icon(Icons.search,color: Color.fromARGB(81, 255, 255, 255),),
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
