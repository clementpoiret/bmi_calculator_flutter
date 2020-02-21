import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onPress;
  final CurveType curveType;

  ReusableCard(
      {@required this.color,
      this.cardChild,
      this.onPress,
      this.curveType = CurveType.flat});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: NeuCard(
        margin: EdgeInsets.all(kCardMargin),
        curveType: curveType,
        bevel: kCardElevation,
        decoration: NeumorphicDecoration(
          borderRadius: BorderRadius.circular(kCardRadius),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
