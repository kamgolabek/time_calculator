import 'package:flutter/material.dart';
import '../widgets/time_difference_widget.dart';
import '../widgets/time_selector_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TimeToolBox',
          style: GoogleFonts.pressStart2p(textStyle: TextStyle(fontSize: 20)),
        ),
      ),
      body: Container(
        decoration: new BoxDecoration(
          //color: new Color(0xFFa4b0be),
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover),
        ),
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
