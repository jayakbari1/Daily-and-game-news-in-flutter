import 'dart:convert';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scadgame_news_app/APIs/gameapi.dart';
import 'package:scadgame_news_app/APIs/newsapi.dart';
import 'package:scadgame_news_app/Pages/gamenews.dart';
import 'package:scadgame_news_app/Pages/newspage.dart';
import 'package:scadgame_news_app/utils/colors.dart';

import '../function.dart';


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Future<List> news;
   Future<List> gamenews;

   int index = 0;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
    gamenews = gamefetchnews();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: BottomNavigationbarWidget(),
    );
  }
  Widget buildBody(){
    switch(index){
      case 1:
        return GameNews();
      case 0:
      default:
        return NewsPage();

    }
  }
   Widget BottomNavigationbarWidget(){
    return BottomNavyBar(
      selectedIndex: index,
        containerHeight: 60,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.new_releases_sharp),
              title: Text('Daily News'),
              activeColor: AppColors.primary,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              icon: Icon(Icons.games),
              title: Text('Games'),
              activeColor: AppColors.primary,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center),
        ], onItemSelected: (index) => setState(() => this.index = index));
   }
   }