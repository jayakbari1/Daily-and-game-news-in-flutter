import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scadgame_news_app/utils/colors.dart';
import 'package:scadgame_news_app/utils/text.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components.dart';

void showMyBottomsheet(BuildContext context, String title, String description, imageurl, url){
  showBottomSheet(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),topRight: Radius.circular(20)
        ),
      ),
      elevation: 20,
      context: context,
      builder: (context){
        return MyBottomSheetLayout(
          url: url,
          imageurl: imageurl,
          title: title,
          description: description,
        );
      });
}

_launchURL(String url) async{
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw 'Could Not launch $url';
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;
  const MyBottomSheetLayout({Key key, this.title, this.description, this.imageurl, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetImage(imageurl: imageurl, title: title),
          Container(
            padding: EdgeInsets.all(10),
            child: modifiedText(text: description,size: 16,color: Colors.white,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                color: Colors.yellowAccent,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: RichText(
                    text: TextSpan(
                        text: 'Read Full Article',
                        recognizer: TapGestureRecognizer()
                          ..onTap = (){
                            _launchURL(url);
                          },
                        style: GoogleFonts.lato(
                          color: Colors.blue.shade400,
                        )
                    ),
                  ),
                ),
                onPressed: (){
                  _launchURL(url);
                },
              ),
              FlatButton(
                color: AppColors.darkgrey,
                onPressed: (){
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('DO you want to share this post?'),
                      actions: [
                        FlatButton(
                          child: Text('Yes'),
                          onPressed: () {
                            Share.share(url);
                          },
                        ),
                      ],
                    ),
                  );
              }, child:Icon(Icons.share,color: AppColors.white,),),
            ],
          ),
        ],
      ),
    );
  }
}

