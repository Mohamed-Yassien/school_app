import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final localNotificationService = FlutterLocalNotificationsPlugin();
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    localNotificationService
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    IOSInitializationSettings iosInitializationSettings =
        const IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      defaultPresentAlert: true,
      defaultPresentSound: true,
      defaultPresentBadge: true,
      requestSoundPermission: true,
    );

    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await localNotificationService.initialize(settings,
        onSelectNotification: onSelectNotification);

    messaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
    FirebaseMessaging.onBackgroundMessage(
      _firebaseMessagingBackgroundHandler,
    );
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }

  static Future<NotificationDetails> localNotificationDetails() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      // icon: 'school',
      // largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      playSound: true,
      enableVibration: true,
      priority: Priority.max,
      importance: Importance.max,
    );
    IOSNotificationDetails iosNotificationDetails =
        const IOSNotificationDetails();
    return NotificationDetails(
      iOS: iosNotificationDetails,
      android: androidNotificationDetails,
    );
  }

  static Future<void> showNotification(RemoteMessage message) async {
    final details = await localNotificationDetails();
    await localNotificationService.show(
      DateTime.now().microsecond,
      message.notification!.title,
      message.notification!.body,
      details,
    );
  }

  static void onSelectNotification(String? payload) async {
    if (payload != null && payload.isNotEmpty) {
      print('payload is $payload');
    }
  }
}
