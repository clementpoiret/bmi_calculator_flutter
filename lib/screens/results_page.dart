import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsArguments {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsArguments(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
}

class ResultsPage extends StatelessWidget {
  static const routeName = '/results';

  @override
  Widget build(BuildContext context) {
    final ResultsArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 32, 0.0, 16),
                    child: Text(
                      args.resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                  ),
                  Text(
                    "Normal BMI range:",
                    style: kTextStyle,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "18.5 - 25 kg/m2",
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              args.bmiResult,
                              style: kBmiTextStyle,
                            ),
                          ],
                        ),
                        Text(
                          args.interpretation,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
