import 'package:flutter/material.dart';
import '../widgets/time_difference_widget.dart';
import '../widgets/time_selector_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  Widget screenTitleWidget(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: GoogleFonts.aBeeZee(
          fontSize: 30, color: new Color(0xFF2c2c54),
          fontWeight: FontWeight.bold,

          //fontStyle: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Text("TimeMultiTool"),
        title: Text(
          '2 dates difference',
          // style: GoogleFonts.pressStart2p(textStyle: TextStyle(fontSize: 20)),
        ),
      ),
      body: Container(
        decoration: new BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: ListView(children: [
            Column(
              children: [
                // screenTitleWidget("2 DATES DIFFERENCE"),
                TimeSelectorWidget(),
                SizedBox(
                  height: 30,
                ),
                TimeDifferenceWidget(),
              ],
            ),
          ])),
        ),
      ),
    );
  }
}
