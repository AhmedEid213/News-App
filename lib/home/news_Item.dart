import 'package:flutter/material.dart';
import 'package:news_app/home/news_content_tab.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/my_theme.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(NewsContentTab.routeName,arguments: news);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.network(news.urlToImage ?? ''),
            ),
            SizedBox(height: 10),
            Text(news.author ?? '',
                style: TextStyle(color: MyTheme.grayColor, fontSize: 18)),
            SizedBox(height: 10),

            Text(news.title ?? '',
                style: TextStyle(color: MyTheme.blackColor, fontSize: 18,fontWeight: FontWeight.w400)),
            SizedBox(height: 10),

            Text(news.publishedAt ?? '',
                style: TextStyle(color: MyTheme.grayColor, fontSize: 18),textAlign: TextAlign.end),
          ],
        ),
      ),
    );
  }
}
