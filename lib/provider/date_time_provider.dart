import 'package:flutter/material.dart';

class DateTimeProvider with ChangeNotifier {
  DateTime _from = DateTime.now();
  DateTime _to = DateTime.now();

  bool isFromAfterTo() {
    return _from.isAfter(_to);
  }

  void setFrom(DateTime from) {
    this._from = from;
    notifyListeners();
  }

  void setTo(DateTime to) {
    this._to = to;
    notifyListeners();
  }

  DateTime getFrom() {
    return _from;
  }

  DateTime getTo() {
    return _to;
  }
}
