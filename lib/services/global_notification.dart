import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

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
    var android =
        const AndroidInitializationSettings("@drawable/launcher_icon");
    var ios = const IOSInitializationSettings();
    var initSettings = InitializationSettings(android: android, iOS: ios);
    _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onSelectNotification: flutterNotificationClick,
    );
    NotificationSettings settings =
        await messaging.requestPermission(provisional: true);
    print('User granted permission: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      messaging.getToken().then((token) {
        print("======================>>>>>> token is $token");
      });
      messaging.setForegroundNotificationPresentationOptions(
          alert: false, badge: false, sound: false);
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _onMessageStreamController.add(message.data);
        print("_________Message data:${message.data}");
        print(
            "_________notification imageUrl :${message.notification?.android?.imageUrl}");
        _showLocalNotification(message);
      });
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('A new onMessageOpenedApp event was published!');
        flutterNotificationClick(json.encode(message.data));
      });
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    flutterNotificationClick(json.encode(message.data));
  }

  StreamController<Map<String, dynamic>> get notificationSubject {
    return _onMessageStreamController;
  }

  _showLocalNotification(RemoteMessage? message) async {
    if (message == null) return;
    String? path;
    BigPictureStyleInformation? bigPictureStyleInformation;
    if (message.notification?.android?.imageUrl != null) {
      path = await _downloadAndSaveFile(
          "${message.notification?.android?.imageUrl}");
      bigPictureStyleInformation = BigPictureStyleInformation(
        FilePathAndroidBitmap(path),
        largeIcon: FilePathAndroidBitmap(path),
        contentTitle: "${message.notification?.title}",
        summaryText: "${message.notification?.body}",
      );
    }

    var android = AndroidNotificationDetails(
      "${DateTime.now()}",
      "DEFAULT",
      icon: "@drawable/launcher_icon",
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
      largeIcon: path != null ? FilePathAndroidBitmap(path) : null,
      shortcutId: DateTime.now().toIso8601String(),
      styleInformation: bigPictureStyleInformation,
      visibility: NotificationVisibility.public,
    );
    var ios = const IOSNotificationDetails();
    var _platform = NotificationDetails(android: android, iOS: ios);
    _flutterLocalNotificationsPlugin.show(
        DateTime.now().microsecond,
        "${message.notification?.title}",
        "${message.notification?.body}",
        _platform,
        payload: json.encode(message.data));
  }

  Future<String> _downloadAndSaveFile(String url) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath =
        '${directory.path}/${directory.path.split("/").last}';
    await Dio().download(url, filePath);
    return filePath;
  }

  //
  // void addToLocal(BuildContext context, NotificationItemModel model) async {
  //   var item = NotificationItemModel(id: model.id);
  //   var db = context.read<MyDatabase>();
  //   var data = await db.allNotificationEntries;
  //   List<NotificationItemModel> lstNotifications =
  //   data.map((e) => NotificationItemModel(id: e.notificationId)).toList();
  //   if (lstNotifications.any((element) => element.id == item.id)) {
  //     NotificationTableData model =
  //     NotificationTableData(notificationId: item.id);
  //     await db.addNotification(model.toCompanion(true));
  //   }
  // }

  static Future flutterNotificationClick(String? payload) async {
    // var auth = context.read<AuthCubit>().state.authorized;
    Map<String, dynamic> model = json.decode("$payload");
    var type = model["type"];
    var key = model["key"];
    var propertyId = model["property_id"] != ""
        ? (model["property_id"] is String)
            ? int.parse(model["property_id"])
            : model["property_id"]
        : null;
    var slug = model["slug"];
    var userId = model["user_id"];
    var id = model["_id"];
    var developerId = model["developer_id"];
    var compoundId = model["compound_id"];
    var launchId = model["launch_id"];
    var url = model.containsKey("url") ? model["url"] : null;
    if (propertyId == null &&
        developerId == null &&
        compoundId == null &&
        launchId == null &&
        url == null &&
        url == "") return;
    if (userId != null && userId != "" /*&&auth*/) {
      // await UserRepository(context).readNotifications(id);
    } else {
      // var db = context.read<MyDatabase>();
      // var data = await db.allNotificationEntries;
      // List<NotificationItemModel> lstNotifications =
      //     data.map((e) => NotificationItemModel(id: e.notificationId)).toList();
      // if (lstNotifications.every((element) => element.id != id)) {
      //   NotificationTableData model = NotificationTableData(notificationId: id);
      //   await db.addNotification(model.toCompanion(true));
    }
  }
// if (type == "property") {
//   if (key == "property_change_status_refused") {
//     AutoRouter.of(context).push(EditPropertyRoute(id: propertyId!));
//     return;
//   }
//   AutoRouter.of(context).push(CompoundGuideDetailsRoute(
//       property: true, id: propertyId, isBannerProperty: true));
//   return;
// } else if (type == "compound") {
//   AutoRouter.of(context).push(CompoundGuideDetailsRoute(
//       property: false, id: compoundId, type: true));
//   return;
// } else if (type == "commercial") {
//   AutoRouter.of(context).push(
//       CompoundGuideDetailsRoute(property: false, id: slug, type: false));
//   return;
// } else if (type == "launch") {
//   AutoRouter.of(context).push(LaunchesDetailsRoute(id: launchId));
//   return;
// } else if (type == "developer") {
//   AutoRouter.of(context)
//       .push(DevelopersDetailsRoute(id: developerId, title: ""));
//   return;
// } else if (type == "custom") {
//   AutoRouter.of(context).push(GenericWebViewRoute(url: url ?? ""));
//   return;
// }

}
