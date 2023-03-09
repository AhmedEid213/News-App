import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;

  Function onDrawerItemClicked;
  HomeDrawer({required this.onDrawerItemClicked});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: MyTheme.primaryLightColor,
            padding: EdgeInsets.symmetric(vertical: 64),
            child: Text('News App!',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                onDrawerItemClicked(HomeDrawer.categories);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 35,
                    color: MyTheme.blackColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.gategories,
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),  
            child: InkWell(
              onTap: () {
                onDrawerItemClicked(HomeDrawer.settings);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 35,
                    color: MyTheme.blackColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
    AppLocalizations.of(context)!.settings,
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
