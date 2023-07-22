import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/news/news_ events.dart';
import '../blocs/news/news_blocs.dart';
import '../blocs/news/news_states.dart';
import '../globals.dart';

class LoadMoreBtn extends StatelessWidget {
  const LoadMoreBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewsBlocs, NewsStates>(
        builder: (context, state) => state.isNotFoundNews == true
            ? Text("")
            : IconButton(
                onPressed: () {
                  page++;
                  BlocProvider.of<NewsBlocs>(context).add(UpdatePage(page));
                  BlocProvider.of<NewsBlocs>(context).add(Read());
                },
                icon: Icon(Icons.add),
              ),
      ),
    );
  }
}
