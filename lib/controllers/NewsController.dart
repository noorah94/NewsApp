import '../globals.dart';
import '../models/NewsModel.dart';
import '../services/NewsService.dart';
import '../utilities/NetworkCheck.dart';
import 'LocalStorageController.dart';

List<NewsModel> toNewsModelList(List items, bool isLocalStorage) {
  List<NewsModel> newItems = [];

  for (var element in items) {
    newItems.add(NewsModel(
        element["title"].toString(),
        element["description"].toString(),
        isLocalStorage ? "null" : element["urlToImage"].toString(),
        element["author"].toString(),
        element["publishedAt"].toString()
        //element["source"]["name"].toString())
        ));
  }
  return newItems;
}

Future<List<NewsModel>> getNewsFromAPI(String category, String country) async {
  List items = await fetchNews(category, country);
  return toNewsModelList(items, false);
}

Future<List<NewsModel>> getFirstNews() async {
  List items = await fetchFirstNews(await getCategory(), await getCountry());
  return toNewsModelList(items, false);
}

Future<List<NewsModel>> getNews() async {
  bool checkConnect = await checkConnectivity();
  List<NewsModel> newItems = [];
  if (checkConnect) {
    newItems = await getNewsFromAPI(await getCategory(), await getCountry());
    if (page == 1) {
      addNewsToLocalStorage(newItems);
    }
  } else {
    newItems = await getNewsFromLocalStorage();
    page = 0;
    // BlocProvider.of<NewsBlocs>(context).add(UpdatePage(page));
  }

  return newItems;
}
