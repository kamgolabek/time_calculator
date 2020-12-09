import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  static final optionStyle =
      GoogleFonts.roboto(fontSize: 20, color: Colors.black);

  Widget menuOption(BuildContext context, String title, IconData iconData) {
    return ListTile(
      title: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(iconData),
              SizedBox(
                width: 30,
              ),
              Text(
                title,
                style: optionStyle,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        // Update the state of the app.
        // ...
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Time_Multitools',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Digital7",
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF2f3542),
            ),
          ),
          // Container(
          //   height: 170.0,
          //   child: DrawerHeader(
          //       child:
          //           Text('Categories', style: TextStyle(color: Colors.white)),
          //       decoration: BoxDecoration(color: Colors.black),
          //       margin: EdgeInsets.all(0.0),
          //       padding: EdgeInsets.all(0.0)),
          // ),

          menuOption(context, "Dashboard", FlutterIcons.dashboard_oct),
          menuOption(context, "Calculator", FlutterIcons.calculator_ant),
          menuOption(
              context, "Two dates difference", FlutterIcons.date_range_mdi),
          menuOption(context, "Single date calculator", FlutterIcons.today_mdi),
          SizedBox(
            height: 30,
          ),
          menuOption(context, "My Countdowns", FlutterIcons.counter_mco),
          menuOption(context, "Settings", FlutterIcons.setting_ant),
        ],
      ),
    );
  }
}
