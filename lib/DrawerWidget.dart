import 'package:flutter/material.dart';
import 'package:scadgame_news_app/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: AppColors.primary,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //image: DecorationImage()
                    ),
                  ),
                  Text(
                    'Welcome To The Tazza Khabar',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tazzakhabar001@gmail.com',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: AppColors.white),
                  )
                ],
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.description, size: 30),
            title: Text(
              'Bitcoin',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('You know about the Bitcoin'),
                  actions: [
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: () {
                        launch(
                            'https://www.tazzakhabar.in/2021/08/is-new-kind-of-money-and-innovative.html');
                      },
                    ),
                    FlatButton(
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Do You Interested To Know About Bitcoin'),
                              actions: [
                                FlatButton(onPressed: (){
                                  launch('https://www.tazzakhabar.in/2021/08/is-new-kind-of-money-and-innovative.html');
                                }, child: Text('Yes')),
                                FlatButton(onPressed: (){
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }, child: Text('No')),
                              ],
                            ),
                          );
                        },
                        child: Text('No'))
                  ],
                ),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.games, size: 30),
            title: Text(
              'Play More Games',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            onTap: null,
          ),
          //Divider(thickness: 2,),
          //Divider(thickness: 2,),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              size: 30,
            ),
            title: Text('Share',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25)),
            onTap: () {
              Share.share(
                  'check out my website scadgame.com ot tazzakhabar.in');
            },
          ),
          ListTile(
            leading: Icon(Icons.people, size: 30),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationIcon: FlutterLogo(),
                applicationName: 'Tazza Khabar',
                applicationVersion: '0.0.1',
                applicationLegalese: 'Developed By Hj Developers',
                children: [
                  Text('This is a Tazza Khabar where you can find all the '
                      'Updated News Or else you can also find from scadgame as well as Tazza Khabar.in'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
