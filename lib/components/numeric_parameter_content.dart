import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/constants.dart';
import 'round_icon_button.dart';

class NumericParameterContent extends StatelessWidget {
  final String label;
  final int value;
  final Function onPressed1;
  final Function onPressed2;

  NumericParameterContent(
      {@required this.label,
      @required this.value,
      @required this.onPressed1,
      @required this.onPressed2});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: kTextStyle,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: onPressed1,
            ),
            SizedBox(width: 20.0),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: onPressed2,
            ),
          ],
        )
      ],
    );
  }
}
