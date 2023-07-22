import 'package:flutter/material.dart';

class RichTextInfo extends StatelessWidget {
  RichTextInfo({super.key, required this.title, required this.info});
  String title;
  String info;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.028),
        children: <TextSpan>[
          TextSpan(
            text: info,
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
