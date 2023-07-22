class NewsModel {
  String title;
  String description;
  String urlToImage;
  String author;
  String publishedAt;
  //String source;

  NewsModel(this.title, this.description, this.urlToImage, this.author,
      this.publishedAt
      //, this.source
      );

  Map toJson() => {
        'title': title,
        'description': description,
        'urlToImage': urlToImage,
        'author': author,
        'publishedAt': publishedAt,
        //'source': source
      };

  // toJson() => '''
  // {
  //       "title": "$title",
  //       "description": "$description",
  //       "urlToImage": "$urlToImage",
  //       "author": "$author",
  //       "publishedAt": "$publishedAt",
  //       "source": {
  //         "name": "$source"
  //       }
  // }
  // ''';
}
