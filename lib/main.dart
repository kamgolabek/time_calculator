import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_calculator/provider/date_time_provider.dart';
import 'package:time_calculator/screens/main_screen.dart';

void main() => runApp(MyApp());

const PrimaryColor = const Color(0xFF2f3542);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => DateTimeProvider(),
      child: MaterialApp(
        title: 'Time Calculator',
        theme: ThemeData(
          primaryColor: PrimaryColor,
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
