import 'package:flutter/material.dart';
import 'package:time_calculator/calculator/time_calculator.dart';
import 'package:time_calculator/provider/date_time_provider.dart';
import 'package:time_calculator/widgets/date-type.dart';
import 'package:time_calculator/widgets/time_calculator_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dtProvider = Provider.of<DateTimeProvider>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Time Calculator'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            "Time Calculator",
            style: TextStyle(fontSize: 30),
          ),
          DatePickerWidget(DateType.FROM, dtProvider),
          DatePickerWidget(DateType.TO, dtProvider),
          Row(
            children: [Text("From: "), Text(dtProvider.getFrom().toString())],
          ),
          Row(
            children: [Text("To: "), Text(dtProvider.getTo().toString())],
          ),
          Row(
            children: [
              Text("Difference: (days) " +
                  TimeCalculator.calculateDifference(
                          dtProvider.getFrom(), dtProvider.getTo())
                      .inDays
                      .toString())
            ],
          )
        ],
      )),
    );
  }
}
