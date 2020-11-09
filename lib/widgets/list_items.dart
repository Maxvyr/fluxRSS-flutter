import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flux_rss/controller/colors.dart';
import 'package:flux_rss/controller/constant.dart';
import 'package:flux_rss/widgets/my_text.dart';
import 'package:webfeed/webfeed.dart';

class ListItems extends StatefulWidget {
  RssFeed feed;

  //Constructor
  ListItems(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //recover number of item in the RSS
        itemCount: widget.feed.items.length,
        itemBuilder: (context, position) {
          RssItem item = widget.feed.items[position];
          var date = "${item.pubDate.year} / ${item.pubDate.month}"
              " / "
              "${item.pubDate.day}";
          return Container(
            padding: const EdgeInsets.only(
              left: marginDefault,
              right: marginDefault,
              bottom: marginDefault,
            ),
            child: Card(
              elevation: 10,
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(marginDefault),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // MyText(data: item.)
                          MyText(
                            data: date,
                            fontSize: 8.0,
                            color: red,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(marginLittle),
                      child: MyText(
                        data: item.title,
                        color: black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(marginLittle),
                      child: MyText(
                        data: item.description,
                        fontSize: 12.0,
                        color: grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
