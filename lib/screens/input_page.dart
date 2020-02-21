import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neumorphic/neumorphic.dart';

import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/numeric_parameter_content.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      curveType: selectedGender == Gender.male
                          ? CurveType.emboss
                          : CurveType.flat,
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      }),
                ),
                Expanded(
                  child: ReusableCard(
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      curveType: selectedGender == Gender.female
                          ? CurveType.emboss
                          : CurveType.flat,
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: kMinHeight,
                    max: kMaxHeight,
                    onChanged: (double newHeight) {
                      setState(
                        () {
                          height = newHeight.round();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: NumericParameterContent(
                      label: 'WEIGHT',
                      value: weight,
                      onPressed1: () {
                        setState(() {
                          weight--;
                        });
                      },
                      onPressed2: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: NumericParameterContent(
                      label: 'AGE',
                      value: age,
                      onPressed1: () {
                        setState(() {
                          age--;
                        });
                      },
                      onPressed2: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onPress: () {
              Calculator calc = Calculator(height: height, weight: weight);

              Navigator.pushNamed(
                context,
                ResultsPage.routeName,
                arguments: ResultsArguments(
                  bmiResult: calc.calculateBmi(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
