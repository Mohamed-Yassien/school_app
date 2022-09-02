import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class ReusableCalenderDate extends StatelessWidget {
  final List<DateTime?> dates;

  ReusableCalenderDate({
    required this.dates,
  });

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(

      selectableDayPredicate: (date) {
        return false;
      },
      config: CalendarDatePicker2Config(
        calendarType: CalendarDatePicker2Type.multi,
        calendarViewMode: DatePickerMode.day,
        weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        controlsHeight: 50,
        controlsTextStyle: const TextStyle(
          color: Colors.teal,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        dayTextStyle: const TextStyle(
          color: Colors.teal,
          fontSize: 12,
          // fontWeight: FontWeight.bold,
        ),
        disabledDayTextStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        weekdayLabelTextStyle: const TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
        ),
        selectedDayTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        lastMonthIcon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.teal,
          size: 18,
        ),
        nextMonthIcon: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.teal,
          size: 18,
        ),
        selectedDayHighlightColor: Colors.teal,
      ),
      initialValue: dates,
    );
  }
}
