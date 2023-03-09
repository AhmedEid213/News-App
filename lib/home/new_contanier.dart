import 'package:flutter/material.dart';
import 'package:news_app/api_manges.dart';
import 'package:news_app/home/news_Item.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class NewContanier extends StatelessWidget {
  Source source;
  NewContanier({required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManger.getNews(sourceId: source.id ?? '',) ,
        builder:(context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: MyTheme.primaryLightColor,));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(AppLocalizations.of(context)!.somethingWentWrong),
                ElevatedButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text(AppLocalizations.of(context)!.tryAgain))
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(onPressed: () {}, child: Text(AppLocalizations.of(context)!.tryAgain))
              ],
            );
          }
          var newsList= snapshot.data?.articles ?? [];
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,
          );

        },
    );
  }
}
