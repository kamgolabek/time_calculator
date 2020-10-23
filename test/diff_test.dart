import 'package:TimeCalc/widgets/diff.dart';
import 'package:flutter_test/flutter_test.dart';

// test with: https://www.timeanddate.com/date/timeduration.html
void main() {
  void validate(Diff diff, int years, int months, int days, int hours,
      int minutes, int seconds) {
    expect(diff.diffYears, years, reason: "Invalid years difference");
    expect(diff.diffmonths, months, reason: "Invalid months difference");
    expect(diff.diffdays, days, reason: "Invalid days difference");
    expect(diff.diffhours, hours, reason: "Invalid hours difference");
    expect(diff.diffminutes, minutes, reason: "Invalid minutes difference");
    expect(diff.diffSeconds, seconds, reason: "Invalid seconds difference");
  }

  test("Test basic simple diff (always 1 )", () {
    DateTime from = DateTime.parse('2020-03-20 12:20:15.000');
    DateTime to = DateTime.parse('2021-04-21 13:21:16.000');

    var diff = Diff(from, to);
    validate(diff, 1, 1, 1, 1, 1, 1);
  });

  test("almost 1 minute diff", () {
    DateTime from = DateTime.parse('2020-03-20 12:20:15.000');
    DateTime to = DateTime.parse('2020-03-20 12:21:14.000');

    var diff = Diff(from, to);
    validate(diff, 0, 0, 0, 0, 0, 59);
  });

  test("almost 1 hour diff", () {
    DateTime from = DateTime.parse('2020-03-20 12:20:15.000');
    DateTime to = DateTime.parse('2020-03-20 13:20:14.000');

    var diff = Diff(from, to);
    validate(diff, 0, 0, 0, 0, 59, 59);
  });

  test("almost 1 day diff", () {
    DateTime from = DateTime.parse('2020-10-10 12:20:14.000');
    DateTime to = DateTime.parse('2020-10-11 12:20:13.000');

    var diff = Diff(from, to);
    validate(diff, 0, 0, 0, 23, 59, 59);
  });

  test("almost 1 month diff", () {
    DateTime from = DateTime.parse('2020-10-10 12:20:14.000');
    DateTime to = DateTime.parse('2020-11-10 12:20:13.000');

    var diff = Diff(from, to);
    validate(diff, 0, 0, 30, 23, 59, 59);
    // https://www.timeanddate.com/date/durationresult.html?y1=2020&m1=10&d1=10&y2=2020&m2=11&d2=10&h1=12&i1=20&s1=14&h2=12&i2=20&s2=13
  });

  test("almost 2 month diff", () {
    DateTime from = DateTime.parse('2020-03-10 12:20:14.000');
    DateTime to = DateTime.parse('2020-05-10 12:20:13.000');

    var diff = Diff(from, to);
    print(diff);
    validate(diff, 0, 1, 29, 23, 59, 59);
    // https://www.timeanddate.com/date/durationresult.html?y1=2020&m1=03&d1=10&y2=2020&m2=05&d2=10&h1=12&i1=20&s1=14&h2=12&i2=20&s2=13
  });

  test("almost 1 year diff", () {
    DateTime from = DateTime.parse('2019-03-10 12:20:14.000');
    DateTime to = DateTime.parse('2020-03-10 12:20:13.000');

    var diff = Diff(from, to);
    print(diff);
    validate(diff, 0, 11, 28, 23, 59, 59);
    // https://www.timeanddate.com/date/durationresult.html?y1=2019&m1=3&d1=10&y2=2020&m2=03&d2=10&h1=12&i1=20&s1=14&h2=12&i2=20&s2=13
  });

  test("random dates 1", () {
    DateTime from = DateTime.parse('2015-03-10 12:20:14.000');
    DateTime to = DateTime.parse('2020-10-29 22:46:56.000');

    var diff = Diff(from, to);
    print(diff);
    validate(diff, 5, 7, 19, 10, 26, 42);
    // https://www.timeanddate.com/date/durationresult.html?y1=2015&m1=3&d1=10&y2=2020&m2=10&d2=29&h1=12&i1=20&s1=14&h2=22&i2=46&s2=56
  });

  test("full single year", () {
    DateTime from = DateTime.parse('2020-01-01 00:00:00.000');
    DateTime to = DateTime.parse('2020-12-31 23:59:59.000');

    var diff = Diff(from, to);
    print(diff);
    validate(diff, 0, 11, 30, 23, 59, 59);
    // https://www.timeanddate.com/date/durationresult.html?y1=2020&m1=01&d1=01&y2=2020&m2=12&d2=31&h1=0&i1=0&s1=0&h2=23&i2=59&s2=59
  });

  test("almost month across two years", () {
    DateTime from = DateTime.parse('2019-12-10 13:30:30.000');
    DateTime to = DateTime.parse('2020-01-10 13:30:29.000');

    var diff = Diff(from, to);
    print(diff);
    validate(diff, 0, 0, 30, 23, 59, 59);
    // https://www.timeanddate.com/date/durationresult.html?y1=2019&m1=12&d1=10&y2=2020&m2=1&d2=10&h1=13&i1=30&s1=30&h2=13&i2=30&s2=29
  });
  // 10 random dates tests

  // february days corner
  // leap years
}
