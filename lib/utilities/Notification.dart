import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Noti {
  static initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    var androidInitialize =
        new AndroidInitializationSettings('mipmap/ic_launcher');
    var iOSInitialize = new DarwinInitializationSettings();
    var initializationsSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      //onDidReceiveNotificationResponse: (details) {},
    );
  }

  static showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        new AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      //playSound: true,
      //sound: RawResourceAndroidNotificationSound('notification'),
      // importance: Importance.max,
      // priority: Priority.high,
    );

    var notificationDetails = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: DarwinNotificationDetails());
    await fln.show(0, title, body, notificationDetails);
  }
}
