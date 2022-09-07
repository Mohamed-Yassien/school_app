import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GlobalNotification {
  static final StreamController<Map<String, dynamic>>
      _onMessageStreamController = StreamController.broadcast();

  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static late BuildContext context;
  static GlobalNotification instance = GlobalNotification._();
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  GlobalNotification._();

  GlobalNotification();

  setupNotification(BuildContext cxt) async {
    context = cxt;
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = const AndroidInitializationSettings("school");
    var ios = const IOSInitializationSettings();
    var initSettings = InitializationSettings(android: android, iOS: ios);
    await _flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: (val) {});
    NotificationSettings settings =
        await messaging.requestPermission(provisional: true);
    print('User granted permission: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      messaging.getToken().then((token) {
        print("======================>>>>>> token is $token");
      });
      messaging.setForegroundNotificationPresentationOptions(
          alert: true, badge: true, sound: true);
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _onMessageStreamController.add(message.data);
        print("_________Message data:${message.data}");
        print(
            "_________notification imageUrl :${message.notification?.android?.imageUrl}");
        _showLocalNotification(message);
      });
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('A new onMessageOpenedApp event was published!');
      });
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }

  _showLocalNotification(RemoteMessage? message) async {
    var android = AndroidNotificationDetails(
      "${DateTime.now()}",
      "DEFAULT",
      // icon: "school",
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
      largeIcon: const DrawableResourceAndroidBitmap('school'),
      shortcutId: DateTime.now().toIso8601String(),
    );

    var ios = const IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: ios);
    _flutterLocalNotificationsPlugin.show(
      DateTime.now().microsecond,
      "${message!.notification?.title}",
      "${message.notification?.body}",
      platform,
      payload: json.encode(message.data),
    );
  }
}
