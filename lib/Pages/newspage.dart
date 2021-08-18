import 'package:flutter/material.dart';
import 'package:scadgame_news_app/APIs/newsapi.dart';
import 'package:scadgame_news_app/components/appbar.dart';
import 'package:scadgame_news_app/components/newsbox.dart';
import 'package:scadgame_news_app/components/searchbar.dart';
import 'package:scadgame_news_app/utils/colors.dart';
import 'package:scadgame_news_app/utils/constant.dart';
import '../DrawerWidget.dart';


class NewsPage extends StatefulWidget {
  const NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var darkThemeEnabled = false;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.black,
          appBar: Appbar(),
          drawer: DrawerWidget(),
          body: Column(
            children: [
              //Search(),
              Expanded(
                child: Container(
                  color: AppColors.black,
                    width: w,
                    child: FutureBuilder<List>(
                      future: fetchnews(),
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
        ),
    );
  }
}
