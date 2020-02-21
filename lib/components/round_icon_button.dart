import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

import 'package:bmi_calculator/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundIconButton({@required this.icon, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: NeuCard(
        curveType: CurveType.flat,
        bevel: kCardElevation,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        decoration: NeumorphicDecoration(
          borderRadius: BorderRadius.circular(56),
          color: kActiveCardColor,
        ),
        child: Icon(icon),
      ),
    );
  }
}
