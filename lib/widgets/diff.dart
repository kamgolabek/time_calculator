import 'package:time_calculator/provider/date_time_provider.dart';

class Diff {
  Duration duartion;
  int diffYears;
  int diffmonths;
  int diffdays;
  int diffhours;
  int diffminutes;
  int diffSeconds;

  Diff(DateTime from, DateTime to) {
    calculateDifss(from, to);
  }

  void calculateDifss(DateTime from, DateTime to) {
    if (from.isAfter(to)) {
      throw Exception("'from' time can't be after 'to' time");
    }
    duartion = to.difference(from);

    this.diffhours = to.hour - from.hour;
    this.diffminutes = to.minute - from.minute;
    this.diffSeconds = to.second - from.second;

    // 0 if time is equal, 1 if time is after, -1 if time is before
    var timeBefore = 0;

    // e.g. f: 45 to: 44 diffSeconds: -1 -> diffSeconds 59 , diffMinutes -1
    if (diffSeconds < 0) {
      diffminutes--;
      diffSeconds = 60 + diffSeconds;
    }

    // e.g. f: 45 to: 44 diffMinutes: -1 -> diffMinutes 59 , diffHours -1
    if (diffminutes < 0) {
      diffhours--;
      diffminutes = 60 + diffminutes;
    }

    // e.g. f: 16 to: 15 diffHours: -1 -> diffHours 23 , ~ diffDays -1
    if (diffhours < 0) {
      diffhours = 24 + diffhours;
    }

    // at this point I do only need if to.time is after before.time or equal or after
    int timeRelation = _time_relation(from, to);
    if (timeRelation == -1) {
    } else if (timeRelation == 0) {
    } else if (timeRelation == 1) {}

    this.diffYears = to.year - from.year;
    this.diffmonths = to.month - from.month;
    this.diffdays = to.day - from.day;

    // calculate days difference
    // if to.day >= from.day -> OK
    // if to.day < from.day -> daysDiff:
    bool notFullMonth =
        (from.day > to.day) || (from.day == to.day && timeRelation == -1);
    if (notFullMonth) {
      DateTime from2 = DateTime(to.year, to.month - 1, from.day);
      diffdays = to.difference(from2).inDays;
    }

// this is questionable
    if (timeRelation == -1) {
      diffdays--;
    }

// --------------- month
    if (notFullMonth) {
      diffmonths--;
    }

    if (diffmonths < 0) {
      diffmonths = 12 + diffmonths;
      diffYears--;
    }
  }

  int _time_relation(DateTime from, DateTime to) {
    DateTime now = DateTime.now();
    var nFrom = DateTime(
        now.year, now.month, now.day, from.hour, from.minute, from.second);
    var nTo =
        DateTime(now.year, now.month, now.day, to.hour, to.minute, to.second);

    return nTo.compareTo(nFrom);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Difference: " +
        diffYears.toString() +
        " years, " +
        diffmonths.toString() +
        " months, " +
        diffdays.toString() +
        " days, " +
        diffhours.toString() +
        " hours, " +
        diffminutes.toString() +
        " minutes, " +
        diffSeconds.toString() +
        " seconds";
  }
}
