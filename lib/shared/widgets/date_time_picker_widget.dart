import 'package:date_time_picker_widget/date_time_picker_widget.dart';
import 'package:flutter/material.dart';

class DateTimePickWidget extends StatelessWidget {
  final List<DateTime?> dates;

  const DateTimePickWidget({
    Key? key,
    required this.dates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      type: DateTimePickerType.Both,
      startDate: dates.first,
      endDate: dates.last,
      startTime: dates.first,
      endTime:dates.last,
      timeInterval: const Duration(hours: 2),
      datePickerTitle: 'Pick your preferred date',
      timePickerTitle: 'Pick your preferred time',
      timeOutOfRangeError: 'Sorry shop is closed now',
      is24h: true,
      onDateChanged: (date) {},
      onTimeChanged: (time) {},
    );
  }
}
