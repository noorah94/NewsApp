import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/news/news_ events.dart';
import '../blocs/news/news_blocs.dart';
import '../blocs/news/news_states.dart';
import '../globals.dart';

class NextPreviousBtns extends StatelessWidget {
  const NextPreviousBtns({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBlocs, NewsStates>(
      builder: (context, state) => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            state.page == 1
                ? Text("")
                : IconButton(
                    onPressed: () {
                      if (page > 1) {
                        page--;
                        BlocProvider.of<NewsBlocs>(context)
                            .add(UpdatePage(page));
                        BlocProvider.of<NewsBlocs>(context).add(Read());
                      }
                    },
                    icon: Icon(Icons.arrow_back),
                    //child: Text("pre"),
                  ),
            state.newsList.length == 0
                ? Text("")
                : IconButton(
                    onPressed: () {
                      page++;
                      BlocProvider.of<NewsBlocs>(context).add(UpdatePage(page));
                      BlocProvider.of<NewsBlocs>(context).add(Read());
                    },
                    icon: Icon(Icons.arrow_forward),
                  )
          ],
        ),
      ),
    );
  }
}
