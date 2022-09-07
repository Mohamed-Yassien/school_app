// Padding(
//   padding: const EdgeInsets.symmetric(
//     vertical: 14,
//     horizontal: 8,
//   ),
//   child: Divider(
//     color: Colors.grey[200],
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.all(12.0),
//   child: ReusableCalenderDate(
//     dates: List<DateTime?>.generate(
//       cubit.coursesWithoutFilter![index]
//           .dates!.length,
//       (index2) => DateTime.parse(
//         cubit.coursesWithoutFilter![index]
//             .dates![index2],
//       ),
//     ),
//   ),
// ),

////////////////////////////

/////////////////////////

// Padding(
//   padding: const EdgeInsets.only(left: 14.0),
//   child: CircleAvatar(
//     radius: 16,
//     backgroundColor: Colors.grey[100],
//     child: IconButton(
//       onPressed: () {
//         cubit.filterCoursesWithDates();
//       },
//       icon: const Icon(
//         Icons.search,
//         color: Colors.black,
//         size: 14,
//       ),
//     ),
//   ),
// ),

///////////////////////////////////////////////////////

// InkWell(
// onTap: () {
// navigateTo(
// widget: CourseDetailScreen(
// course: cubit.coursesWithoutFilter![index]),
// context: context,
// );
// },
// child: Card(
// margin: const EdgeInsets.symmetric(
// horizontal: 10,
// vertical: 8,
// ),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(1),
// ),
// elevation: 5,
// child: Padding(
// padding: const EdgeInsets.only(
// top: 15,
// bottom: 15,
// left: 10,
// ),
// child: Column(
// children: [
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment.center,
// children: [
// Expanded(
// child: Align(
// alignment: Alignment.centerLeft,
// child: Container(
// height: 80,
// width: 90,
// decoration: BoxDecoration(
// image: const DecorationImage(
// image: AssetImage(
// 'assets/images/subject.jpg',
// ),
// fit: BoxFit.cover,
// ),
// border: Border.all(
// color: Colors.grey[100]!,
// width: 2,
// ),
// ),
// ),
// ),
// ),
// Expanded(
// child: Align(
// alignment: Alignment.center,
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// '${cubit.coursesWithoutFilter![index].subject}',
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// textAlign: TextAlign.start,
// style: Theme.of(context)
// .textTheme
//     .subtitle2
//     ?.copyWith(
// color: Colors.black,
// fontWeight:
// FontWeight.bold,
// ),
// ),
// const SizedBox(
// height: 5,
// ),
// Text(
// '${cubit.coursesWithoutFilter![index].instructor}',
// style: Theme.of(context)
// .textTheme
//     .caption
//     ?.copyWith(
// fontWeight:
// FontWeight.normal,
// ),
// ),
// ],
// ),
// ),
// ),
// Expanded(
// child: Align(
// alignment: Alignment.center,
// child: Text(
// '${'${cubit.coursesWithoutFilter![index].numberOfLectures}'} lec',
// textAlign: TextAlign.start,
// style: Theme.of(context)
// .textTheme
//     .subtitle2
//     ?.copyWith(
// color: defaultColor,
// fontWeight: FontWeight.bold,
// fontSize: 12,
// ),
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// )

////////////////////////////////////////////////

//
// InkWell(
// onTap: () {
// },
// child: Card(
// elevation: 5,
// child: Padding(
// padding: const EdgeInsets.only(
// top: 15,
// bottom: 15,
// left: 10,
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Align(
// alignment: Alignment.centerLeft,
// child: CircleAvatar(
// backgroundColor: Colors.grey[300],
// backgroundImage: const AssetImage(
// 'assets/images/subject.jpg',
// ),
// radius: 35,
// ),
// ),
// Expanded(
// child: Align(
// alignment: Alignment.center,
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// cubit.subjectsModel!
// .subjects![index].subject!,
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// textAlign: TextAlign.center,
// style: Theme.of(context)
// .textTheme
//     .subtitle2
//     ?.copyWith(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// ),
// ),
// const SizedBox(
// height: 5,
// ),
// Text(
// cubit
//     .subjectsModel!
// .subjects![index]
// .description!,
// style: Theme.of(context)
// .textTheme
//     .caption
//     ?.copyWith(
// fontWeight: FontWeight.bold,
// ),
// ),
// ],
// ),
// ),
// ),
//
// ],
// ),
// ),
// ),
// )

//////////////////////////////////////

// print(DateTime.parse(date));
// print(DateTime.parse(fromDateString));
// print(DateFormat.yMd().format(DateTime.parse(date)));
// print(DateTime.parse(DateFormat.yMd().format(DateTime.parse(date))));

/////////////////////

// InkWell(
// onTap: () {
// navigateTo(
// widget: StudentDetailsScreen(
// students: cubit.studentsModel!.students![index],
// ),
// context: context);
// },
// child: Card(
// elevation: 5,
// child: Padding(
// padding: const EdgeInsets.only(
// top: 15,
// bottom: 15,
// left: 10,
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Expanded(
// child: Align(
// alignment: Alignment.centerLeft,
// child: CircleAvatar(
// backgroundColor: Colors.grey[300],
// backgroundImage: const AssetImage(
// 'assets/images/student.jpg',
// ),
// radius: 35,
// ),
// ),
// ),
// Expanded(
// child: Align(
// alignment: Alignment.centerLeft,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// cubit.studentsModel!.students![index]
// .name!,
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// style: Theme.of(context)
// .textTheme
//     .subtitle2
//     ?.copyWith(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// ),
// ),
// const SizedBox(
// height: 5,
// ),
// Text(
// '${cubit.studentsModel?.students?[index].city}',
// style: Theme.of(context)
// .textTheme
//     .caption
//     ?.copyWith(
// fontWeight: FontWeight.bold,
// ),
// ),
// ],
// ),
// ),
// ),
// Expanded(
// child: Align(
// alignment: Alignment.center,
// child: Text(
// '${cubit.studentsModel?.students?[index].status}',
// textAlign: TextAlign.start,
// style: Theme.of(context)
// .textTheme
//     .subtitle2
//     ?.copyWith(
// color: defaultColor,
// fontWeight: FontWeight.bold,
// fontSize: 12,
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// )

//////////////////////////////////


// InkWell(
// onTap: () {
// navigateTo(
// widget: InstructorDetailsScreen(
// instructors:
// cubit.instructorsModel!.instructors![index],
// ),
// context: context);
// },
// child: Card(
// elevation: 5,
// child: Padding(
// padding: const EdgeInsets.only(
// top: 15,
// bottom: 15,
// left: 10,
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Expanded(
// child: Align(
// alignment: Alignment.centerLeft,
// child: CircleAvatar(
// backgroundColor: Colors.grey[300],
// backgroundImage: const AssetImage(
// 'assets/images/instructor.jpg',
// ),
// radius: 35,
// ),
// ),
// ),
// Expanded(
// child: Align(
// alignment: Alignment.center,
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// cubit.instructorsModel!
// .instructors![index].name!,
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// style: Theme.of(context)
// .textTheme
//     .subtitle2
//     ?.copyWith(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// ),
// ),
// const SizedBox(
// height: 5,
// ),
// Text(
// cubit
//     .instructorsModel!
// .instructors![index]
// .contractType!,
// style: Theme.of(context)
// .textTheme
//     .caption
//     ?.copyWith(
// fontWeight: FontWeight.bold,
// ),
// ),
// ],
// ),
// ),
// ),
// Expanded(
// child: Align(
// alignment: Alignment.center,
// child: Text(
// '${cubit.instructorsModel?.instructors?[index].salary} \$',
// textAlign: TextAlign.start,
// style: Theme.of(context)
// .textTheme
//     .subtitle2
//     ?.copyWith(
// color: defaultColor,
// fontWeight: FontWeight.bold,
// fontSize: 12,
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// )
 /////////////////////////////////////////////////////////
// global notification important comments

// if (message == null) return;
// String? path;
// BigPictureStyleInformation? bigPictureStyleInformation;
// if (message.notification?.android?.imageUrl != null) {
//   path = await _downloadAndSaveFile(
//       "${message.notification?.android?.imageUrl}");
//   bigPictureStyleInformation = BigPictureStyleInformation(
//     FilePathAndroidBitmap(path),
//     largeIcon: FilePathAndroidBitmap(path),
//     contentTitle: "${message.notification?.title}",
//     summaryText: "${message.notification?.body}",
//   );
// }
// largeIcon: path != null ? FilePathAndroidBitmap(path) : null,
// styleInformation: bigPictureStyleInformation,
// visibility: NotificationVisibility.public,
// Future<String> _downloadAndSaveFile(String url) async {
//   final Directory directory = await getApplicationDocumentsDirectory();
//   final String filePath =
//       '${directory.path}/${directory.path.split("/").last}';
//   await Dio().download(url, filePath);
//   return filePath;
// }

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

// static Future flutterNotificationClick(String? payload) async {
//   // var auth = context.read<AuthCubit>().state.authorized;
//   Map<String, dynamic> model = json.decode("$payload");
//   var type = model["type"];
//   var key = model["key"];
//   var propertyId = model["property_id"] != ""
//       ? (model["property_id"] is String)
//           ? int.parse(model["property_id"])
//           : model["property_id"]
//       : null;
//   var slug = model["slug"];
//   var userId = model["user_id"];
//   var id = model["_id"];
//   var developerId = model["developer_id"];
//   var compoundId = model["compound_id"];
//   var launchId = model["launch_id"];
//   var url = model.containsKey("url") ? model["url"] : null;
//   if (propertyId == null &&
//       developerId == null &&
//       compoundId == null &&
//       launchId == null &&
//       url == null &&
//       url == "") return;
//   if (userId != null && userId != "" /*&&auth*/) {
//     // await UserRepository(context).readNotifications(id);
//   } else {
//     // var db = context.read<MyDatabase>();
//     // var data = await db.allNotificationEntries;
//     // List<NotificationItemModel> lstNotifications =
//     //     data.map((e) => NotificationItemModel(id: e.notificationId)).toList();
//     // if (lstNotifications.every((element) => element.id != id)) {
//     //   NotificationTableData model = NotificationTableData(notificationId: id);
//     //   await db.addNotification(model.toCompanion(true));
//   }
// }
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
// flutterNotificationClick(json.encode(message.data));
// flutterNotificationClick(json.encode(message.data));
//
// StreamController<Map<String, dynamic>> get notificationSubject {
//   return _onMessageStreamController;
// }


//////////////////////
//local
//
// static Future<void> show({
//   required DateTime scheduledDate,
// }) async {
//   final details = await localNotificationDetails();
//   await localNotificationService.schedule(
//       0, 'title', 'body', scheduledDate, details);
// }
//
// static Future stylishNotification() async {
//   var android = const AndroidNotificationDetails(
//     "id",
//     "channel",
//     // color: Colors.deepOrange,
//     // enableLights: true,
//     enableVibration: true,
//     largeIcon: DrawableResourceAndroidBitmap(
//       "logo",
//     ),
//     // tag: '@mipmap/logo',
//     // ticker: '@mipmap/logo',
//     // icon: '@mipmap/logo',
//     styleInformation: MediaStyleInformation(
//       htmlFormatContent: true,
//       htmlFormatTitle: true,
//     ),
//   );
//
//   var platform = NotificationDetails(android: android);
//
//   await localNotificationService.show(
//     0,
//     'xTracker got your location in the background',
//     'This app can always access your location in the background!',
//     platform,
//   );
// }
//
// static Future<void> showScheduleNotification() async {
//   final details = await localNotificationDetails();
//   await localNotificationService.periodicallyShow(
//     0,
//     'xTracker got your location in the background',
//     'This app can always access your location in the background!',
//     RepeatInterval.daily,
//     details,
//   );
// }
/////////////////////////

//
// void initializedNotification() async {
//   await LocalNotificationService.initialize();
// }
//
// void showNotification() {
//   LocalNotificationService.show(
//     scheduledDate: DateTime.now().add(
//       const Duration(seconds: 5),
//     ),
//   ).then((value) {}).catchError((error) {
//     print(error.toString());
//   });
// }
// setUpNotification(context) {
//   GlobalNotification.instance.setupNotification(context);
// }