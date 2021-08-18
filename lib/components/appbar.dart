import 'package:flutter/material.dart';
import 'package:scadgame_news_app/utils/colors.dart';
import 'package:scadgame_news_app/utils/text.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  Appbar({Key key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  var darkThemeEnabled = false;
  List news;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding;
    return SafeArea(
      top: false,
      child: AppBar(
        actions: [],
        backgroundColor: AppColors.black,
        elevation: 0,
        title: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boldText(text: 'Tazza', size: 20, color: AppColors.primary),
              modifiedText(text: 'Khabar', size: 20, color: AppColors.lightwhite),
            ],
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
