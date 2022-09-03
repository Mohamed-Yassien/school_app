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