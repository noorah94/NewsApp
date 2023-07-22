import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import '../controllers/NotificationController.dart';
import 'Notification.dart';

const fetchBackground = "task-identifier";
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
getNotification() async {
  Noti.initialize(flutterLocalNotificationsPlugin);
  await setNotification(flutterLocalNotificationsPlugin);
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackground:
        await getNotification();

        // Code to run in background
        break;
    }
    return Future.value(true);
  });
}

initializeWorkmanager() async {
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );
  await Workmanager().registerPeriodicTask(
    fetchBackground,
    fetchBackground,
    frequency: Duration(hours: 1),
  );
}
