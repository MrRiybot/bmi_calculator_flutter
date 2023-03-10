import 'package:flutter/material.dart';
import 'inputPage.dart';
import 'resultPage.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            thumbColor: Color(0xFFEB1555),
            overlayColor: Color(0x29EB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),

          ),
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21),),
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          accentColor: Colors.purple,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white),),),

           home: InputPage(),
    );
  }
}
