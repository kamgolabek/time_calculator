import 'package:flutter/material.dart';
import 'package:time_calculator/calculator/time_calculator.dart';
import 'package:time_calculator/provider/date_time_provider.dart';
import 'package:time_calculator/widgets/date-type.dart';
import 'package:time_calculator/widgets/date_picker_widget.dart';
import 'package:provider/provider.dart';
import 'package:time_calculator/widgets/time_difference_widget.dart';
import 'package:time_calculator/widgets/time_selector_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          children: [
            Text(
              "Time Calculator",
              style: TextStyle(fontSize: 30),
            ),
            TimeSelectorWidget(),
            TimeDifferenceWidget(),
          ],
        )),
      ),
    );
  }
}
