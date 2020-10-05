import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_calculator/provider/date_time_provider.dart';
import 'package:time_calculator/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // builder: (ctx) => DateTimeProvider(),
      create: (ctx) => DateTimeProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          // textTheme: GoogleFonts.shadowsIntoLightTextTheme(
          //   Theme.of(context).textTheme,
          // ),
          // primaryTextTheme: GoogleFonts.shadowsIntoLightTextTheme(
          //   Theme.of(context).textTheme,
          // )
          fontFamily: 'Lato',
        ),
        home: MainScreen(),
        // routes: {
        //   ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        // },
      ),
    );
  }
}
