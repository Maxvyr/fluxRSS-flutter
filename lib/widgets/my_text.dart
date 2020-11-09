import 'package:flutter/material.dart';
import 'package:flux_rss/controller/colors.dart';

class MyText extends Text {
  MyText({
    @required String data,
    color: purple0,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  }) : super(
          //if data null replace by an empty string
          data ?? "",
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        );
}
