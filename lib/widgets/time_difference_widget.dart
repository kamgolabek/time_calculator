import 'package:flutter/material.dart';
import 'package:time_calculator/calculator/time_calculator.dart';
import 'package:provider/provider.dart';
import 'package:time_calculator/provider/date_time_provider.dart';

class TimeDifferenceWidget extends StatelessWidget {
  const TimeDifferenceWidget({Key key}) : super(key: key);

  Widget difffWdiget(String title, String diff) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [Text(title), Text(diff)],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dtProvider = Provider.of<DateTimeProvider>(
      context,
      listen: false,
    );

    Duration diff = TimeCalculator.calculateDifference(
        dtProvider.getFrom(), dtProvider.getTo());

    return Container(
      margin: EdgeInsets.all(32),
      child: Row(
        children: [
          difffWdiget("Days: ", diff.inDays.toString()),
          difffWdiget("Hours: ", diff.inHours.toString()),
          difffWdiget("Minutes: ", diff.inMinutes.toString()),
          difffWdiget("Seconds: ", diff.inSeconds.toString()),
        ],
      ),
    );
  }
}
