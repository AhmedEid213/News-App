import 'package:flutter/material.dart';
import 'package:news_app/api_manges.dart';
import 'package:news_app/home/tab_container.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategoryDetails extends StatelessWidget {
  Category category;
  CategoryDetails({required this.category});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
        future: ApiManger.getsources(categoryId: category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: MyTheme.primaryLightColor,));
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.somethingWentWrong,style: TextStyle(fontWeight: FontWeight.bold)),
                  ElevatedButton(onPressed: () {
                  }, child: Text(AppLocalizations.of(context)!.tryAgain))
                ],
              ),
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
          var sourcesList = snapshot.data?.sources ?? [];
          return TabContainer(sourcesList: sourcesList);
        });
  }
}
