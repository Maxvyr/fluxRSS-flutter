import 'dart:async';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';

class Parser {
  //Variable
  final url = "http://www.frandroid.com/feed";
  // final url = "https://www.france24.com/fr/actualites/rss";

  Future chargerRSS() async {
    //recover url server with package http
    final response = await get(url);
    // if response 200 ok => enregistrer le feed (body) avec pacakge webFeed
    // else print erreur code
    if (response.statusCode == 200) {
      final feed = RssFeed.parse(response.body);
      print(feed.title);
      return feed;
    } else {
      print("erreur serveur ${response.statusCode}");
    }
  }
}
