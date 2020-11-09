import 'package:flutter/material.dart';
import 'package:flux_rss/controller/colors.dart';
import 'package:flux_rss/models/parser.dart';
import 'package:flux_rss/widgets/chargement.dart';
import 'package:flux_rss/widgets/grid_items.dart';
import 'package:flux_rss/widgets/list_items.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'dart:async';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Variable
  RssFeed feed;

  @override
  void initState() {
    super.initState();
    print("init");
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(
                Icons.refresh,
                color: white,
              ),
              onPressed: () {
                //update list
                setState(() {
                  feed = null;
                  parse();
                });
              })
        ],
      ),
      body: choixDuBody(),
    );
  }

  Widget choixDuBody() {
    if (feed == null) {
      return Chargement();
    } else {
      Orientation orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.portrait) {
        //List
        return ListItems(feed);
      } else {
        //Grid
        return GridItems(feed);
      }
    }
  }

  Future<Null> parse() async {
    RssFeed recoverFeed = await Parser().chargerRSS();
    if (recoverFeed != null) {
      setState(() {
        feed = recoverFeed;
        print(feed.items.length);
        feed.items.forEach((element) {
          print(element.title);
          print(element.description);
          print(element.pubDate);
        });
      });
    } else {
      print("rien reçu");
    }
  }
}
