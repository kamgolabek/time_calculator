import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/date_time_provider.dart';

import 'diff.dart';

class TimeDifferenceWidget extends StatelessWidget {
  const TimeDifferenceWidget({Key key}) : super(key: key);

  Widget calendarDiffWidget(Diff diff) {
    return Card(
      color: new Color(0xFF2d3436),
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
      color: new Color(0xFF2d3436),
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

  Widget altDiffWidget(Diff diff) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: new Color(0xFF474787),
              child: difffWdiget("In Days: ", diff.duartion.inDays),
            ),
            Card(
              color: new Color(0xFF218c74),
              child: difffWdiget("In Hours: ", diff.duartion.inHours),
            ),
            Card(
              color: new Color(0xFFcd6133),
              child: difffWdiget("In Minutes: ", diff.duartion.inMinutes),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: new Color(0xFF84817a),
              child: difffWdiget(
                "In Seconds: ",
                diff.duartion.inSeconds,
              ),
            ),
            Card(
              color: new Color(0xFFffb142),
              child: difffWdiget(
                "In Milliseconds: ",
                diff.duartion.inMilliseconds,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget alternateDiffWidget(Diff diff) {
    return Card(
      color: new Color(0xFF2d3436),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            difffWdiget("Years: ", diff.duartion.inDays),
            // difffWdiget("Months: ", diff.duartion.inHours),
            // difffWdiget("Days: ", diff.duartion.inMinutes),
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
          calendarDiffWidget(diff),
          timeDiffWidget(diff),
          //alternateDiffWidget(diff),
          altDiffWidget(diff),
          // altDiffWidget(diff),
          // altDiffWidget(diff),
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
      // if (diff.reversedFromAndToDates) {
      //   showAlertDialog(context);
      // }
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
