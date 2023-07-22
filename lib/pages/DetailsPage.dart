import 'package:flutter/material.dart';
import 'package:t2_news_app/models/NewsModel.dart';
import '../widgets/SourceInfoContainer.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.newsModel});
  NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    Widget getImage() => newsModel.urlToImage != 'null'
        ? Image.network(
            newsModel.urlToImage,
            fit: BoxFit.fill,
          )
        : Image.asset(
            "assets/news.jpeg",
            fit: BoxFit.fill,
          );

    return Scaffold(
      appBar: AppBar(
        title: Text("T2 News"),
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * 0.05),
                child: Text(
                  newsModel.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: getImage(),
              ),
              SourceInfoContainer(newsModel: newsModel),
              Text(
                newsModel.description,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
