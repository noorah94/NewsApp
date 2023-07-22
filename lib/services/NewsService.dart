import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../globals.dart';

Future<List> fetchNews(String category, String country) async {
  //625e21ad969d4ce3aca55680d4865331
  //b8bd49abb631485c8b46ae8c4e47cfe2
  //65d90dafe6c8446c93b890f06aac48b8
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=$country&category=$category&pageSize=10&page=$page&apiKey=b8bd49abb631485c8b46ae8c4e47cfe2'));
  if (response.statusCode == 200) {
    //print(json.decode(response.body)["articles"]);
    return json.decode(response.body)["articles"];
  } else {
    print(response.body);
    //throw Exception('Unable to fetch news from the REST API');
  }
  return [];
}

Future<List> fetchFirstNews(
  String category,
  String country,
) async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=$country&category=$category&pageSize=1&page=1&apiKey=b8bd49abb631485c8b46ae8c4e47cfe2'));
  if (response.statusCode == 200) {
    return json.decode(response.body)["articles"];
  } else {
    print(response.body);
    throw Exception('Unable to fetch news from the REST API');
  }
}
