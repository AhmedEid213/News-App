import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:url_launcher/url_launcher_string.dart';

class NewsContentTab extends StatelessWidget {
  static const String routeName = 'news content';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as News;
    return Container(
      decoration: BoxDecoration(
          color: MyTheme.whiteColor,
          image: DecorationImage(
              image: AssetImage('assets/images/main_background.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('News App', style: Theme.of(context).textTheme.headline1),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(news.urlToImage ?? ''),
              SizedBox(height: 10),
              Text(news.author ?? '',
                  style: TextStyle(color: MyTheme.grayColor, fontSize: 18)),
              SizedBox(height: 10),
              Text(news.title ?? '',
                  style: TextStyle(
                      color: MyTheme.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 10),
              Text(news.publishedAt ?? '',
                  style: TextStyle(color: MyTheme.grayColor, fontSize: 18),
                  textAlign: TextAlign.end),
              SizedBox(height: 20),
              Text(news.description ?? '',
                  style: TextStyle(
                      color: MyTheme.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    viewFullArtical(news);
                  }, child: Row(
                    children: [
                      Text(AppLocalizations.of(context)!.viweFullArtical,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      )),
                      Icon(Icons.arrow_right,
                        color: Colors.black,
                        size: 30,
                      )
                    ],
                  ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  viewFullArtical(News news)async{
    var url = news.url;
    var uri=Uri.parse(url!);

    if(await canLaunchUrl(uri)){

      await launchUrl(uri);
    }else{
      throw'Cannot load Url';
    }
  }
}
