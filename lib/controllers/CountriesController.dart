import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<String>> readCountriesJson() async {
  final String response =
      await rootBundle.loadString('assets/countries_data.json');
  List data = await json.decode(response)["data"];

  List<String> newItems = [];
  for (var element in data) newItems.add(element["code"]);
  return newItems;
}
