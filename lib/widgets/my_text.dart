import 'package:flutter/material.dart';
import 'package:flux_rss/controller/colors.dart';

class MyText extends Text {
  MyText({
    @required String data,
    color: purple0,
    fontSize: 25.0,
    fontWeight: FontWeight.normal,
  }) : super(
          data,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        );
}
