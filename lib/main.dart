import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbColor: kThumbColor,
          overlayColor: kOverlayColor,
          activeTrackColor: kActiveTrackColor,
          inactiveTrackColor: kInactiveTrackColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        ResultsPage.routeName: (context) => ResultsPage(),
      },
    );
  }
}
