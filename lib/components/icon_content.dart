import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

const iconSize = 80.0;
const space = 15.0;

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  IconContent({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: space,
        ),
        Text(
          text,
          style: kTextStyle,
        )
      ],
    );
  }
}
