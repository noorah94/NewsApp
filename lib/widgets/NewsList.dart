import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:t2_news_app/widgets/NewsCard.dart';
import '../blocs/news/news_blocs.dart';
import '../blocs/news/news_states.dart';
import 'NewsStatusInfo.dart';
//import '../globals.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        // height: MediaQuery.of(context).size.height * 0.75,
        child: BlocBuilder<NewsBlocs, NewsStates>(
          builder: (context, state) => ListView(
            children: state.newsList.length == 0
                ? [
                    NewsStatusInfo(
                      isNotFoundNews: state.isNotFoundNews,
                    )
                  ]
                : state.newsList
                    .mapIndexed(
                      (index, element) => NewsCard(
                        newsModel: element,
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}



  // builder: (context, state) => ListView.builder(
  //         reverse: true,
  //         itemCount: newsList.length,
  //         shrinkWrap: false,
  //         padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
  //         itemBuilder: (context, index) {
  //           return MessageText(
  //               message: messageModels[index],
  //               nextEmail: (index + 1) != messageModels.length
  //                   ? messageModels[index + 1].email
  //                   : '');
  //         },
  //       ),