import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import '../models/NewsModel.dart';
import 'NewsController.dart';

final LocalStorage storage = LocalStorage('localstorage_app');

Future<List<NewsModel>> getNewsFromLocalStorage() async {
  List info = [];

  try {
    await storage.ready;
    info = json.decode(storage.getItem('info'));
  } catch (e) {
    print("not found info");
    return [];
  }

  return toNewsModelList(info, true);
}

void addNewsToLocalStorage(List<NewsModel> news) async {
  await storage.ready;
  final info = jsonEncode(news);
  //storage.deleteItem('info');
  storage.setItem('info', info);
}

Future<String> getCategory() async {
  String catg = 'business';

  try {
    await storage.ready;
    catg = json.decode(storage.getItem('category'));
  } catch (e) {
    print("not found catg");
    storage.setItem('category', catg);
  }

  return catg;
}

Future<String> getCountry() async {
  String country = 'ar';
  await storage.ready;
  try {
    country = json.decode(storage.getItem('country'));
  } catch (e) {
    print("not found country");
    final countryInfo = jsonEncode(country);
    storage.setItem('country', countryInfo);
  }

  return country;
}

Future<void> updateCountry(String name) async {
  await storage.ready;
  final info = jsonEncode(name);
  storage.setItem('country', info);
}

Future<void> updateCategory(String name) async {
  final info = jsonEncode(name);
  await storage.ready;
  storage.setItem('category', info);
}
