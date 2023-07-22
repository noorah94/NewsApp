import 'package:flutter/material.dart';
import 'CountriesDropdown.dart';
import 'CategoryDropdown.dart';

class Preferences extends StatelessWidget {
  const Preferences({super.key});

  TextStyle getTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Category: ",
          style: getTextStyle(),
        ),
        CategoryDropdown(),
        Text(
          "Country: ",
          style: getTextStyle(),
        ),
        CountriesDropdown()
      ],
    );
  }
}
