import 'dart:async';
import 'dart:convert';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  StreamSubscription connectivitystream;
  ConnectivityResult olders;
  int index = 0;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
    gamenews = gamefetchnews();
    connectivitystream = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult resnow) {
      if (resnow == ConnectivityResult.none) {
        print("No Connection!");
      } else if (olders == ConnectivityResult.none) {
        if (resnow == ConnectivityResult.wifi) {
          print("WIFI");
        } else if (resnow == ConnectivityResult.mobile) {
          print("Mobile");
        }
      }
      olders = resnow;
    });
  }

  void dispose(){
    super.dispose();

    connectivitystream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBody(),
        bottomNavigationBar: BottomNavigationbarWidget(),
      ),
    );
  }

  Widget buildBody() {
    switch (index) {
      case 1:
        return GameNews();
      case 0:
      default:
        return NewsPage();
    }
  }

  Widget BottomNavigationbarWidget() {
    return BottomNavyBar(
      backgroundColor: AppColors.darkgrey,
        selectedIndex: index,
        containerHeight: 60,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.newspaper),
              title: Text('Daily News'),
              activeColor: Colors.teal,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.fantasyFlightGames),
              title: Text('Games'),
              activeColor: Colors.teal,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center),
        ],
        onItemSelected: (index) => setState(() => this.index = index));
  }
}
