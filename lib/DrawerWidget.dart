import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scadgame_news_app/Pages/contactus.dart';
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
                    'Welcome To Taja Khabar',
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

          //Bitcoin
          ListTile(
            leading: Icon(FontAwesomeIcons.bitcoin,color: AppColors.black,),
            title: Text(
              'Bitcoin',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Do You know about the Bitcoin?'),
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
                              title: Text('Are You Interested To Know About Bitcoin'),
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

          //IPO
          ListTile(
            leading: Icon(FontAwesomeIcons.moneyCheckAlt,color: AppColors.black,),
            title: Text(
              'IPO',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Do You know about IPO?'),
                  actions: [
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: () {
                        launch(
                            'https://www.tazzakhabar.in/2021/08/what-is-ipo-initial-public-offering.html');
                      },
                    ),
                    FlatButton(
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Are You Interested To Know About IPO?'),
                              actions: [
                                FlatButton(onPressed: (){
                                  launch('https://www.tazzakhabar.in/2021/08/what-is-ipo-initial-public-offering.html');
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

          //PUBG
          ListTile(
            leading: Icon(FontAwesomeIcons.gamepad,color: AppColors.black,),
            title: Text(
              'PUBG',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Do You know about PUBG?'),
                  actions: [
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: () {
                        launch(
                            'https://www.tazzakhabar.in/2021/08/pubg-battleground-india-official-game.html');
                      },
                    ),
                    FlatButton(
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Are You Interested To Know About PUBG?'),
                              actions: [
                                FlatButton(onPressed: (){
                                  launch('https://www.tazzakhabar.in/2021/08/pubg-battleground-india-official-game.html');
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

          //Best-Upcoming-Games
          ListTile(
            leading: Icon(FontAwesomeIcons.gamepad,color: AppColors.black,),
            title: Text(
              'Games',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Do You know about new best games?'),
                  actions: [
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: () {
                        launch(
                            'https://scadgame.com/upcoming-mobile-games-2021-list-release-date-platforms-type-and-more/');
                      },
                    ),
                    FlatButton(
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Are You Interested To Know About new best Games?'),
                              actions: [
                                FlatButton(onPressed: (){
                                  launch('https://scadgame.com/upcoming-mobile-games-2021-list-release-date-platforms-type-and-more/');
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



          //Divider(thickness: 2,),
          //Divider(thickness: 2,),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.share,
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
            leading: Icon(FontAwesomeIcons.addressCard, size: 30),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationIcon: FlutterLogo(),
                applicationName: 'Tazza Khabar',
                applicationVersion: '1',
                applicationLegalese: 'Developed By Hj Developers',
                children: [
                  Text('This is a Taja Khabar where you can find all the '
                      'Updated News Or else you can also find from best new games related news'),
                ],
              );
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.fileSignature),
            title: Text('Contact Us',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Contactus()));
            },
          ),
        ],
      ),
    );
  }
}
