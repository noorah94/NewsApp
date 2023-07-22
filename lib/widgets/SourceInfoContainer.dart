import 'package:flutter/material.dart';
import '../models/NewsModel.dart';
import 'RichTextInfo.dart';

class SourceInfoContainer extends StatelessWidget {
  SourceInfoContainer({super.key, required this.newsModel});
  NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.15,
          top: MediaQuery.of(context).size.width * 0.05,
          bottom: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // RichTextInfo(
        //   title: 'Source',
        //   info: newsModel.source,
        // ),
        RichTextInfo(
          title: 'Author',
          info: newsModel.author,
        ),
        RichTextInfo(
          title: 'Published at',
          info: newsModel.publishedAt,
        ),
      ]),
    );
  }
}
