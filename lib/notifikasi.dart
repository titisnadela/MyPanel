import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:workmanager/workmanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const simplePeriodictask = "simplePeriodicTask";
void showNotification(v, flp) async {
  var android = AndroidNotificationDetails(
      'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
      priority: Priority.high, importance: Importance.max);
  var iOS = IOSNotificationDetails();
  var platform = NotificationDetails(android: android, iOS: iOS);
  await flp.show(0, 'Virtual intelligent solution', '$v', platform,
      payload: 'VIS \n $v');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager.initialize(callbackDispatcher, isInDebugMode: true);
  await Workmanager.registerPeriodicTask("5", simplePeriodictask,
      existingWorkPolicy: ExistingWorkPolicy.replace,
      frequency: Duration(minutes: 15),
      initialDelay: Duration(seconds: 5),
      constraints: Constraints(networkType: NetworkType.connected));
  runApp(Notif());
}

void callbackDispatcher() {
  Workmanager.executeTask((task, inputData) async {
    FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(android: android, iOS: iOS);
    flp.initialize(initSettings);

    var response =
        await http.post('https://192.168.43.229:9000/api/v1/notifikasi');
    print("here============");
    print(response);
    var convert = json.decode(response.body);
    if (convert['status'] == 0) {
      showNotification(convert['keterangan'], flp);
    } else {
      print("no message");
    }
    return Future.value(true);
  });
}

class Notif extends StatelessWidget {
  Notif();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            child: Text("notif"),
          ),
        ),
      ),
    );
  }
}
