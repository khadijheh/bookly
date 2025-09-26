import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: buildOuLineInputBorder(),
        focusedBorder: buildOuLineInputBorder(),

        hintText: "search",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(opacity: 0.8, child: Icon(Icons.search, size: 30)),
        ),
      ),
    );
  }

  OutlineInputBorder buildOuLineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
