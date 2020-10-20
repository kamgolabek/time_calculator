import 'package:flutter/material.dart';
import 'package:time_calculator/calculator/time_calculator.dart';
import 'package:provider/provider.dart';
import 'package:time_calculator/provider/date_time_provider.dart';

import 'diff.dart';

class TimeDifferenceWidget extends StatelessWidget {
  const TimeDifferenceWidget({Key key}) : super(key: key);

  Widget difffWdiget(String title, int diff) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [Text(title), Text(diff.toString())],
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

    var diff = Diff(dtProvider.getFrom(), dtProvider.getTo());

    return Container(
      margin: EdgeInsets.all(0),
      child: Center(
        child: Column(
          children: [
            Row(children: [
              difffWdiget("Years: ", diff.diffYears),
              difffWdiget("Months: ", diff.diffmonths),
              difffWdiget("Days: ", diff.diffdays),
            ]),
            Row(
              children: [
                difffWdiget("Hours: ", diff.diffhours),
                difffWdiget("Minutes: ", diff.diffminutes),
                difffWdiget("Seconds: ", diff.diffSeconds),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// TODO https://leechy.dev/calculate-dates-diff-in-dart
