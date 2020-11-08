import 'package:flutter/material.dart';
import 'package:flux_rss/controller/colors.dart';
import 'package:flux_rss/widgets/my_text.dart';

class Chargement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText(
        data: "Chargement en cours....",
        fontWeight: FontWeight.w900,
        color: black,
      ),
    );
  }
}
