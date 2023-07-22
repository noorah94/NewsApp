import 'package:flutter_bloc/flutter_bloc.dart';
import '../../globals.dart';
import '../../models/NewsModel.dart';
import '../../controllers/NewsController.dart';
import 'news_ events.dart';
import 'news_states.dart';

class NewsBlocs extends Bloc<NewsEvents, NewsStates> {
  NewsBlocs() : super(InitialState()) {
    on<Read>((event, emit) async {
      List<NewsModel> newItems = await getNews();
      emit(NewsStates(
          newsList: page == 0 ? newItems : [...state.newsList, ...newItems],
          page: state.page,
          isNotFoundNews: newItems.length == 0 ? true : false));
    });

    on<ClearList>((event, emit) {
      emit(NewsStates(newsList: [], page: state.page, isNotFoundNews: false));
    });

    on<UpdatePage>((event, emit) {
      emit(NewsStates(
          newsList: state.newsList,
          page: event.page,
          isNotFoundNews: state.isNotFoundNews));
    });
  }
}
