import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsStatusInfo extends StatelessWidget {
  NewsStatusInfo({super.key, required this.isNotFoundNews});
  bool isNotFoundNews;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isNotFoundNews
            ? Image.asset(
                "assets/not_found.gif",
                height: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.fill,
              )
            : SpinKitFadingCircle(
                color: Colors.black,
                size: 50.0,
              ),
        Text(isNotFoundNews ? "Not found extra news..." : "Loading..."),
      ],
    );
  }
}
