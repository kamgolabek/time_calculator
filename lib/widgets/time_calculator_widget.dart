import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:time_calculator/provider/date_time_provider.dart';
import 'package:provider/provider.dart';
import 'package:time_calculator/widgets/date-type.dart';

class DatePickerWidget extends StatelessWidget {
  final DateTimeProvider dtProvider;
  final DateType dateType;

  DateTime currentDate;
  Function(DateTime) onchangeFunc;
  String title;

  DatePickerWidget(this.dateType, this.dtProvider) {
    switch (dateType) {
      case DateType.FROM:
        this.title = "Set Date From";
        this.onchangeFunc = (date) => dtProvider.setFrom(date);
        this.currentDate = dtProvider.getFrom();

        break;
      case DateType.TO:
        this.title = "Set Date to";
        this.onchangeFunc = (date) => dtProvider.setTo(date);
        this.currentDate = dtProvider.getTo();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dtProvider = Provider.of<DateTimeProvider>(
      context,
      listen: false,
    );

    return FlatButton(
        onPressed: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(0, 1, 1),
              maxTime: DateTime(3000, 12, 31), onChanged: (date) {
            print('change $date');
          }, onConfirm: (date) {
            onchangeFunc(date);
            //print('confirm $date');
            //dtProvider.setFrom(date);
          }, currentTime: this.currentDate, locale: LocaleType.pl);
        },
        child: Text(
          title,
          style: TextStyle(color: Colors.blue),
        ));
  }
}
