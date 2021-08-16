import 'package:flutter/material.dart';
import 'package:scadgame_news_app/APIs/gameapi.dart';
import 'package:scadgame_news_app/components/appbar.dart';
import 'package:scadgame_news_app/components/newsbox.dart';
import 'package:scadgame_news_app/components/searchbar.dart';
import 'package:scadgame_news_app/utils/colors.dart';
import 'package:scadgame_news_app/utils/constant.dart';

import '../DrawerWidget.dart';


class GameNews extends StatefulWidget {
  const GameNews({Key key}) : super(key: key);

  @override
  _GameNewsState createState() => _GameNewsState();
}

class _GameNewsState extends State<GameNews> {
  @override
  Widget build(BuildContext context) {var w = MediaQuery.of(context).size.width;
  return Scaffold(
    backgroundColor: AppColors.black,
    appBar: Appbar(),
    drawer: DrawerWidget(),
    body: Column(
      children: [
        SearchBar(),
        Expanded(
          child: Container(
              width: w,
              child: FutureBuilder<List>(
                future: gamefetchnews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return NewsBox(
                            url: snapshot.data[index]['blogUrl'],
                            imageurl:
                            snapshot.data[index]['imgUrl'] != null
                                ? snapshot.data[index]['imgUrl']
                                : Constants.imageurl,
                            title: snapshot.data[index]['title'],
                            description: snapshot.data[index]
                            ['shortDesc']
                                .toString(),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ));
                },
              )),
        ),
      ],
    ),
    //bottomNavigationBar: BottomNavigatiobarWidget(),
  );
  }
}
