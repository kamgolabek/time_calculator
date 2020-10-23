import 'package:flutter/material.dart';
import '../widgets/time_difference_widget.dart';
import '../widgets/time_selector_widget.dart';

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
              SizedBox(
                height: 30,
              ),
              TimeDifferenceWidget(),
            ],
          )),
        ),
      ),
    );
  }
}
