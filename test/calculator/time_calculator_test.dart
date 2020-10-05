import 'package:flutter_test/flutter_test.dart';
import 'package:time_calculator/calculator/time_calculator.dart';

void main() {
  test("Time calculator test", () {
    TimeCalculator tc = TimeCalculator();

    DateTime from = DateTime.now().subtract(new Duration(minutes: 30));
    DateTime to = DateTime.now();
    var diff = TimeCalculator.calculateDifference(from, to);

    expect(diff.inMinutes, 30);
  });
}
