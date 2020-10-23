import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/date_time_provider.dart';

import 'diff.dart';

class TimeDifferenceWidget extends StatelessWidget {
  const TimeDifferenceWidget({Key key}) : super(key: key);

  Widget calendarDiffWidget(Diff diff) {
    return Card(
      color: new Color(0xFF3742fa),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            difffWdiget("Years: ", diff.diffYears),
            difffWdiget("Months: ", diff.diffmonths),
            difffWdiget("Days: ", diff.diffdays),
          ],
        ),
      ),
    );
  }

  Widget timeDiffWidget(Diff diff) {
    return Card(
      color: new Color(0xFF3742fa),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            difffWdiget("Hours: ", diff.diffhours),
            difffWdiget("Minutes: ", diff.diffminutes),
            difffWdiget("Seconds: ", diff.diffSeconds),
          ],
        ),
      ),
    );
  }

  Widget alternateDiffWidget(Diff diff) {
    return Card(
      color: new Color(0xFF3742fa),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            difffWdiget("Days: ", diff.duartion.inDays),
            difffWdiget("Hours: ", diff.duartion.inHours),
            difffWdiget("Minutes: ", diff.duartion.inMinutes),
            //difffWdiget("Seconds: ", diff.duartion.inSeconds),
          ],
        ),
      ),
    );
  }

  Widget difffWdiget(String title, int diff) {
    var headerStyle = TextStyle(fontSize: 20, color: Colors.white);
    var valueStyle = TextStyle(fontSize: 20, color: Colors.white);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: headerStyle,
            ),
            Text(
              diff.toString(),
              style: valueStyle,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }

  Widget reversedTimesWidget(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: c_width,
      child: Center(
        child: Column(
          children: [
            Text(
              "Warning !",
              style: TextStyle(
                  color: new Color(0xFFb33939),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "The Start date was after the End date, so the Start and End fields were swapped.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );

    //Text("Warning !");
    //The Start date was after the End date, so the Start and End fields were swapped")
  }

  Widget getDiffView(Diff diff, BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (diff.reversedFromAndToDates) reversedTimesWidget(context),
          calendarDiffWidget(diff),
          timeDiffWidget(diff),
          //alternateDiffWidget(diff),
        ],
      ),
    );
  }

  Widget getErrorView(String message) {
    return Column(
      children: [
        Text(message),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final dtProvider = Provider.of<DateTimeProvider>(
      context,
      listen: true,
    );

    Widget resultView;
    try {
      var diff = Diff(dtProvider.getFrom(), dtProvider.getTo());
      resultView = getDiffView(diff, context);
    } on Exception catch (ex) {
      resultView = getErrorView(ex.toString());
    }

    return Container(
      margin: EdgeInsets.all(0),
      child: Center(
        child: resultView,
      ),
    );
  }
}
// TODO https://leechy.dev/calculate-dates-diff-in-dart
