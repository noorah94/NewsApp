import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:t2_news_app/blocs/news/news_%20events.dart';
import '../blocs/news/news_blocs.dart';
import '../widgets/LoadMoreBtn.dart';
import '../widgets/NewsList.dart';
import '../widgets/preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBlocs>(context).add(Read());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isIOS) {
          exit(0);
        } else {
          SystemNavigator.pop();
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("T2 News"),
        ),
        body: Column(
          children: [Preferences(), NewsList(), LoadMoreBtn()],
        ),
      ),
    );
  }
}
