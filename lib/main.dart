import 'package:flutter/material.dart';
import 'inputPage.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21),),
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          accentColor: Colors.purple,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white),),),

           home: InputPage(),
    );
  }
}