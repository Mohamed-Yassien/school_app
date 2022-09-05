import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final localNotificationService = FlutterLocalNotificationsPlugin();

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
  }

  static Future<NotificationDetails> localNotificationDetails() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      playSound: true,
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

  static Future<void> showNotification() async {
    final details = await localNotificationDetails();
    await localNotificationService.show(
      0,
      'xTracker got your location in the background',
      'This app can always access your location in the background!',
      details,
    );
  }

  static Future<void> showScheduleNotification() async {
    final details = await localNotificationDetails();
    await localNotificationService.periodicallyShow(
      0,
      'xTracker got your location in the background',
      'This app can always access your location in the background!',
      RepeatInterval.daily,
      details,
    );
  }

  static Future<void> show({
    required DateTime scheduledDate,
  }) async {
    final details = await localNotificationDetails();
    await localNotificationService.schedule(
        0, 'title', 'body', scheduledDate, details);
  }

  static Future stylishNotification() async {
    var android = const AndroidNotificationDetails(
      "id",
      "channel",
      // color: Colors.deepOrange,
      // enableLights: true,
      enableVibration: true,
      largeIcon: DrawableResourceAndroidBitmap(
        "logo",
      ),
      // tag: '@mipmap/logo',
      // ticker: '@mipmap/logo',
      // icon: '@mipmap/logo',
      styleInformation: MediaStyleInformation(
        htmlFormatContent: true,
        htmlFormatTitle: true,
      ),
    );

    var platform = NotificationDetails(android: android);

    await localNotificationService.show(
      0,
      'xTracker got your location in the background',
      'This app can always access your location in the background!',
      platform,
    );
  }

  static void onSelectNotification(String? payload) async {
    if (payload != null && payload.isNotEmpty) {
      print('payload is $payload');
    }
  }
}
