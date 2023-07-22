import 'package:flutter/material.dart';
import 'package:t2_news_app/controllers/LocalStorageController.dart';

import '../models/NewsModel.dart';
import '../pages/DetailsPage.dart';

class NewsCard extends StatelessWidget {
  NewsCard({super.key, required this.newsModel});
  NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    Widget getImage() => newsModel.urlToImage != 'null'
        ? Image.network(
            newsModel.urlToImage,
            width: MediaQuery.of(context).size.width * 0.22,
            height: MediaQuery.of(context).size.width * 0.2,
            fit: BoxFit.fill,
          )
        : Image.asset(
            "assets/news.jpeg",
            width: MediaQuery.of(context).size.width * 0.22,
            height: MediaQuery.of(context).size.width * 0.2,
            fit: BoxFit.fill,
          );

    goToDetails() => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              newsModel: newsModel,
            ),
          ),
        );
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () => goToDetails(),
                  child: Text(
                    newsModel.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color.fromARGB(255, 87, 137, 224),
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                ),
                Text(
                  newsModel.publishedAt,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03),
                )
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: getImage(),
          ),
        ],
      ),
    );
  }
}


                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8.0),
                //     // border: Border.all(
                //     color: const Color.fromARGB(255, 10, 42, 98),
                //     //   width: 3.0,
                //     // ),
                //   ),
                //   //color: Colors.green,
                //   padding:
                //       EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                //   child: Text(
                //     await getCategory(),
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),