import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Category {
  String id;
  String title;
  String imagePath;
  Color color;

  Category({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.color,
  });
  // business entertainment general health science sports technology
  static List<Category> getCategory(context) {
    return [
      Category(
          id: 'sports',
          title: AppLocalizations.of(context)!.sports,
          imagePath: 'assets/images/sports.png',
          color: MyTheme.redColor),
      Category(
          id: 'business',
          title: AppLocalizations.of(context)!.business,
          imagePath: 'assets/images/bussines.png',
          color: MyTheme.brownColor),
      Category(
          id: 'entertainment',
          title: AppLocalizations.of(context)!.entertainment,
          imagePath: 'assets/images/entertainment.png',
          color: MyTheme.blueColor),
      Category(
          id: 'health',
          title: AppLocalizations.of(context)!.health,
          imagePath: 'assets/images/health.png',
          color: MyTheme.pinkColor),
      Category(
          id: 'science',
          title: AppLocalizations.of(context)!.science,
          imagePath: 'assets/images/science.png',
          color: MyTheme.yellowColor),
      Category(
          id: 'technology',
          title: AppLocalizations.of(context)!.technology,
          imagePath: 'assets/images/technology.png',
          color: MyTheme.darkBlue),
      Category(
          id: 'general',
          title: AppLocalizations.of(context)!.general,
          imagePath: 'assets/images/general.png',
          color: MyTheme.orangeColor),
    ];
  }
}
