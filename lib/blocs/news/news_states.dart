import 'package:t2_news_app/models/NewsModel.dart';

class NewsStates {
  List<NewsModel> newsList;
  int page;
  bool isNotFoundNews;
  NewsStates(
      {required this.newsList,
      required this.page,
      required this.isNotFoundNews});
}

class InitialState extends NewsStates {
  InitialState() : super(newsList: [], page: 1, isNotFoundNews: false);
}
