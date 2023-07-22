import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:t2_news_app/pages/HomePage.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 11, 69, 98),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: DefaultTextStyle(
            textAlign: TextAlign.center,
            style: const TextStyle(
              backgroundColor: Color.fromARGB(255, 11, 69, 98),
              color: Colors.white,
              fontSize: 70.0,
              fontFamily: 'Lobster',
            ),
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                ScaleAnimatedText('T2 News',
                    duration: Duration(milliseconds: 3000)),
              ],
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
