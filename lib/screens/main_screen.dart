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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Time Calculator'),
      ),
      body: Container(
        decoration: new BoxDecoration(color: new Color(0xFFa4b0be)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            children: [
              TimeSelectorWidget(),
              TimeDifferenceWidget(),
            ],
          )),
        ),
      ),
    );
  }
}
