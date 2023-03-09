import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/home/news_content_tab.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/appConfigProvider.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child:MyApp()));

}class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes:{
        HomeScreen.routeName : (context) => HomeScreen(),
        NewsContentTab.routeName:(context) => NewsContentTab()
      },
      theme: MyTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),

    );
  }
}