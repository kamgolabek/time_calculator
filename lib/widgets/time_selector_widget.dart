import 'package:flutter/material.dart';
import 'package:time_calculator/provider/date_time_provider.dart';
import 'package:time_calculator/widgets/date-type.dart';
import 'package:time_calculator/widgets/date_picker_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TimeSelectorWidget extends StatelessWidget {
  const TimeSelectorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dtProvider = Provider.of<DateTimeProvider>(
      context,
      listen: true,
    );

    double c_width = MediaQuery.of(context).size.width * 0.95;

    return Container(
      width: c_width,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      DatePickerWidget(DateType.FROM, dtProvider),
                    ],
                  ),
                  Column(
                    children: [
                      DatePickerWidget(DateType.TIME_FROM, dtProvider),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('yyyy-MM-dd – kk:mm:ss')
                        .format(dtProvider.getFrom()),
                    style: TextStyle(fontSize: 28),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      DatePickerWidget(DateType.TO, dtProvider),
                    ],
                  ),
                  Column(
                    children: [
                      DatePickerWidget(DateType.TIME_TO, dtProvider),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('yyyy-MM-dd – kk:mm:ss')
                        .format(dtProvider.getTo()),
                    style: TextStyle(fontSize: 28),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
