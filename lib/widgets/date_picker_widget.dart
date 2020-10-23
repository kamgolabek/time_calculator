import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../provider/date_time_provider.dart';
import 'date-type.dart';

class DatePickerWidget extends StatelessWidget {
  final DateTimeProvider dtProvider;
  final DateType dateType;
  IconData ico;

  DateTime currentDate;
  Function(DateTime) onchangeFunc;
  String title;
  DateTime minDate = DateTime(0, 1, 1);
  DateTime maxDate = DateTime(9999, 12, 31);

  DatePickerWidget(this.dateType, this.dtProvider) {
    switch (dateType) {
      case DateType.FROM:
        this.title = "Set Date From";
        this.onchangeFunc = (date) => dtProvider
            .setFrom(getNewDateWithOldTime(dtProvider.getFrom(), date));
        this.currentDate = dtProvider.getFrom();
        ico = Icons.calendar_today;
        maxDate = dtProvider.getTo();
        break;

      case DateType.TO:
        this.title = "Set Date to";
        this.onchangeFunc = (date) =>
            dtProvider.setTo(getNewDateWithOldTime(dtProvider.getTo(), date));
        this.currentDate = dtProvider.getTo();
        ico = Icons.calendar_today;
        minDate = dtProvider.getFrom();
        break;

      case DateType.TIME_FROM:
        this.title = "Set time from";
        this.onchangeFunc = (date) => dtProvider.setFrom(date);
        this.currentDate = dtProvider.getFrom();
        ico = Icons.access_time;
        maxDate = dtProvider.getTo();
        break;
      case DateType.TIME_TO:
        this.title = "Set time to";
        this.onchangeFunc = (date) => dtProvider.setTo(date);
        this.currentDate = dtProvider.getTo();
        ico = Icons.access_time;
        minDate = dtProvider.getFrom();
        break;
    }
  }

  DateTime getNewDateWithOldTime(DateTime current, DateTime newDate) {
    return DateTime(newDate.year, newDate.month, newDate.day, currentDate.hour,
        currentDate.minute, currentDate.second);
  }

  @override
  Widget build(BuildContext context) {
    // final dtProvider = Provider.of<DateTimeProvider>(
    //   context,
    //   listen: false,
    // );

    return IconButton(
      icon: Icon(ico),
      onPressed: () {
        if (dateType == DateType.FROM || dateType == DateType.TO) {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: minDate,
              maxTime: maxDate, onChanged: (date) {
            print('change $date');
          }, onConfirm: (date) {
            onchangeFunc(date);
          }, currentTime: this.currentDate, locale: LocaleType.en);
        } else {
          DatePicker.showTimePicker(context,
              showTitleActions: true,
              showSecondsColumn: true, onChanged: (date) {
            print('change $date');
          }, onConfirm: (date) {
            onchangeFunc(date);
          }, currentTime: this.currentDate, locale: LocaleType.en);
        }
      },
      // child: Text(
      //   title,
      //   style: TextStyle(color: Colors.blue),
      // ),
    );
  }
}
