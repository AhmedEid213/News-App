import 'package:flutter/material.dart';
import 'package:news_app/api_manges.dart';
import 'package:news_app/home/news_Item.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        showResults(context);

      }, icon: Icon(Icons.search_rounded,size: 25,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.of(context).pop();

    }, icon: Icon(Icons.clear,size: 25,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return  FutureBuilder<NewsResponse>(
      future: ApiManger.getNews(searchKeyWord: query),
      builder:(context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: MyTheme.primaryLightColor,));
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text('Something Went Wrong'),
              ElevatedButton(onPressed: () {}, child: Text('Try Again'))
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? ''),
              ElevatedButton(onPressed: () {}, child: Text('Try Again'))
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.results,
        style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.grey
      ),),
    );
  }


}