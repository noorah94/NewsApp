import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../models/NewsModel.dart';
import '../utilities/NetworkCheck.dart';
import '../utilities/Notification.dart';
import 'NewsController.dart';

Future<void> setNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  bool checkConnect = await checkConnectivity();

  if (checkConnect) {
    List<NewsModel> newItems = await getFirstNews();
    await Noti.showBigTextNotification(
        title: newItems[0].title,
        body: newItems[0].description,
        fln: flutterLocalNotificationsPlugin);
  }
}
