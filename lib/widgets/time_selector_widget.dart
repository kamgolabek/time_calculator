import 'package:flutter/material.dart';
import '../provider/date_time_provider.dart';
import 'date-type.dart';
import 'date_picker_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TimeSelectorWidget extends StatelessWidget {
  const TimeSelectorWidget({Key key}) : super(key: key);

  Widget dateTypeWidget(String title) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget setCurrentTimeWidget(VoidCallback onPressedFunc) {
    return Column(
      children: [
        IconButton(
          icon: Icon(FontAwesome.refresh),
          onPressed: onPressedFunc,
          tooltip: "Set current time",
        ),
      ],
    );
  }

  Widget dateTimeWidget(DateTime dateTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateFormat('yyyy-MM-dd – HH:mm:ss').format(dateTime),
          style: TextStyle(fontSize: 28),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildTimeSelectorWidget(
      String title, DateTimeProvider dtProvider, bool isFromDate) {
    DateType dateSelector = DateType.FROM;
    DateType timeSelector = DateType.TIME_FROM;
    VoidCallback setCurrTimeCallback = () => dtProvider.setFrom(DateTime.now());
    DateTime currDateTime = dtProvider.getFrom();

    if (!isFromDate) {
      dateSelector = DateType.TO;
      timeSelector = DateType.TIME_TO;
      setCurrTimeCallback = () => dtProvider.setTo(DateTime.now());
      currDateTime = dtProvider.getTo();
    }

    return Card(
      color: new Color(0xFFdfe4ea),
      elevation: 50,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dateTypeWidget(title),
              DatePickerWidget(dateSelector, dtProvider),
              DatePickerWidget(timeSelector, dtProvider),
              setCurrentTimeWidget(setCurrTimeCallback),
            ],
          ),
          dateTimeWidget(currDateTime),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dtProvider = Provider.of<DateTimeProvider>(
      context,
      listen: true,
    );

    return Container(
      child: Column(
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          buildTimeSelectorWidget("FROM", dtProvider, true),
          // SizedBox(
          //   height: 10,
          // ),
          buildTimeSelectorWidget("TO", dtProvider, false),
        ],
      ),
    );
  }
}
