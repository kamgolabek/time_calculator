import 'package:TimeCalc/dialog/dialog_utils.dart';
import 'package:flutter/material.dart';
import '../provider/date_time_provider.dart';
import 'date-type.dart';
import 'date_picker_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeSelectorWidget extends StatelessWidget {
  const TimeSelectorWidget({Key key}) : super(key: key);

  Widget dateTypeWidget(String title) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget setCurrentTimeWidget(VoidCallback onPressedFunc) {
    return Column(
      children: [
        IconButton(
          icon: Icon(FontAwesome.refresh),
          onPressed: () {
            onPressedFunc();
          },
          tooltip: "Set current time",
        ),
      ],
    );
  }

  Widget dateTimeWidget(DateTime dateTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateFormat('yyyy-MM-dd – HH:mm:ss').format(dateTime),
          style: TextStyle(fontSize: 28),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildTimeSelectorWidget(String title, DateTimeProvider dtProvider,
      bool isFromDate, BuildContext context) {
    DateType dateSelector = DateType.FROM;
    DateType timeSelector = DateType.TIME_FROM;
    VoidCallback setCurrTimeCallback = () {
      dtProvider.setFrom(DateTime.now());
      if (dtProvider.isFromAfterTo()) {
        DialogUtils.showAlertDialog(context);
      }
    };
    DateTime currDateTime = dtProvider.getFrom();

    if (!isFromDate) {
      dateSelector = DateType.TO;
      timeSelector = DateType.TIME_TO;
      setCurrTimeCallback = () => dtProvider.setTo(DateTime.now());
      currDateTime = dtProvider.getTo();
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Color(0xFF2f3542),
              ), //TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            setCurrentTimeWidget(setCurrTimeCallback),
          ],
        ),
        SizedBox(
          height: 0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // Text(
                //   "2020-06-20",
                //   style: GoogleFonts.roboto(
                //     fontSize: 30,
                //     color: Colors.white,
                //   ), //TextStyle(fontSize: 30),
                // ),
                DatePickerWidget(
                  dateSelector,
                  dtProvider,
                  'yyyy-MM-dd',
                  GoogleFonts.roboto(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                // IconButton(
                //   icon: Icon(Icons.edit),
                //   onPressed: null,
                // ),
                // Text(
                //   "15:00:00",
                //   style: TextStyle(
                //     fontSize: 40,
                //     fontFamily: "Digital7",
                //     color: Colors.white,
                //   ),
                // ),
                DatePickerWidget(
                  timeSelector,
                  dtProvider,
                  'HH:mm:ss',
                  TextStyle(
                    fontSize: 40,
                    fontFamily: "Digital7",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  // Widget buildTimeSelectorWidget2(String title, DateTimeProvider dtProvider,
  //     bool isFromDate, BuildContext context) {
  //   DateType dateSelector = DateType.FROM;
  //   DateType timeSelector = DateType.TIME_FROM;
  //   VoidCallback setCurrTimeCallback = () {
  //     dtProvider.setFrom(DateTime.now());
  //     if (dtProvider.isFromAfterTo()) {
  //       DialogUtils.showAlertDialog(context);
  //     }
  //   };
  //   DateTime currDateTime = dtProvider.getFrom();

  //   if (!isFromDate) {
  //     dateSelector = DateType.TO;
  //     timeSelector = DateType.TIME_TO;
  //     setCurrTimeCallback = () => dtProvider.setTo(DateTime.now());
  //     currDateTime = dtProvider.getTo();
  //   }

  //   return Card(
  //     color: new Color(0xFFdfe4ea),
  //     elevation: 50,
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             dateTypeWidget(title),
  //             DatePickerWidget(dateSelector, dtProvider),
  //             DatePickerWidget(timeSelector, dtProvider),
  //             setCurrentTimeWidget(setCurrTimeCallback),
  //           ],
  //         ),
  //         dateTimeWidget(currDateTime),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final dtProvider = Provider.of<DateTimeProvider>(
      context,
      listen: true,
    );

    return Container(
      child: Column(
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          buildTimeSelectorWidget("Start Date", dtProvider, true, context),
          SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          buildTimeSelectorWidget("End Date", dtProvider, false, context),
        ],
      ),
    );
  }
}
