import 'package:flutter/material.dart';
import 'package:time_calculator/provider/date_time_provider.dart';
import 'package:time_calculator/widgets/date-type.dart';
import 'package:time_calculator/widgets/date_picker_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
          Container(
            child: Card(
              color: new Color(0xFFdfe4ea),
              elevation: 50,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "FROM",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          DatePickerWidget(DateType.FROM, dtProvider),
                        ],
                      ),
                      Column(
                        children: [
                          DatePickerWidget(DateType.TIME_FROM, dtProvider),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(FontAwesome.refresh),
                            onPressed: () => dtProvider.setFrom(DateTime.now()),
                            tooltip: "Set current time",
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('yyyy-MM-dd – HH:mm:ss')
                            .format(dtProvider.getFrom()),
                        style: TextStyle(fontSize: 28),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            color: new Color(0xFFdfe4ea),
            elevation: 50,
            margin: EdgeInsets.all(14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "TO",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        DatePickerWidget(DateType.TO, dtProvider),
                      ],
                    ),
                    Column(
                      children: [
                        DatePickerWidget(DateType.TIME_TO, dtProvider),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(FontAwesome.refresh),
                          onPressed: () => dtProvider.setTo(DateTime.now()),
                          tooltip: "Set current time",
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('yyyy-MM-dd – HH:mm:ss')
                          .format(dtProvider.getTo()),
                      style: TextStyle(fontSize: 28),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
