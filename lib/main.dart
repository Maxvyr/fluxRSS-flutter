import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flux_rss/widgets/my_apps.dart';

void main() {
  //force portrait orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}
