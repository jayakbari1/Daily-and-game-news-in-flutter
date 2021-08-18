import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:scadgame_news_app/components/appbar.dart';
import 'package:scadgame_news_app/utils/colors.dart';

class Contactus extends StatelessWidget {
  const Contactus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: Appbar(),
      body: ContactUs(
        companyName: 'HJ Developers',
        textColor: AppColors.primary,
        cardColor: Colors.grey.shade400,
        companyColor: Colors.deepPurple,
        taglineColor: Colors.deepPurple,
        email: 'tazzakhabar001@gmail.com',
        phoneNumber: '+91 70413 07622',
        website: 'https:/scadgame.com',
        dividerColor: AppColors.primary,


      ),
    );
  }
}
