import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SFCalenderDates extends StatelessWidget {
  final List<DateTime> dates;
  final List<String> dateTime;

  const SFCalenderDates({
    Key? key,
    required this.dates,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      initialDisplayDate: dates.isNotEmpty ? dates.first : DateTime.now(),
      initialSelectedDate: dates.isNotEmpty ? dates.first : DateTime.now(),
      firstDayOfWeek: 6,
      weekNumberStyle: const WeekNumberStyle(
        textStyle: TextStyle(
          color: Colors.teal,
          fontSize: 25,
        ),
        backgroundColor: Colors.red,
      ),
      cellEndPadding: 0,
      headerStyle: const CalendarHeaderStyle(
          textStyle: TextStyle(
        fontSize: 16,
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      )),
      viewHeaderStyle: ViewHeaderStyle(
        dayTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.teal,
          fontSize: 12,
        ),
        dateTextStyle: TextStyle(
          color: Colors.grey[400],
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
      showNavigationArrow: true,
      showCurrentTimeIndicator: true,
      appointmentTextStyle: const TextStyle(
        fontSize: 25,
        color: Colors.teal,
      ),
      // viewNavigationMode: ViewNavigationMode.none,
      allowAppointmentResize: true,
      appointmentTimeTextFormat: 'course time',
      timeSlotViewSettings: const TimeSlotViewSettings(
        startHour: 00,
        endHour: 24,
      ),
      appointmentBuilder: (context, det) {
        return Container(
          alignment: Alignment.center,
          color: Colors.green,
          // child: Text(
          //   DateFormat.jm().format(
          //     DateTime.parse(dateTime[det.appointments.length]),
          //   ),
          //   style: const TextStyle(
          //     color: Colors.white,
          //     fontSize: 12,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
        );
      },

      view: CalendarView.week,
      dataSource: CourseTimes(getAllAppointments()),
    );
  }

  List<Appointment> getAllAppointments() {
    List<Appointment> courseTimes = <Appointment>[];
    for (var date in dates) {
      courseTimes.add(
        Appointment(
          startTime: date,
          endTime: date.add(const Duration(hours: 1)),
        ),
      );
    }
    return courseTimes;
  }
}

class CourseTimes extends CalendarDataSource {
  CourseTimes(List<Appointment> a) {
    appointments = a;
  }
}
