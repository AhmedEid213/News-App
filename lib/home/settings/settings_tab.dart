import 'package:flutter/material.dart';
import 'package:news_app/home/settings/language_bottom_sheet.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/appConfigProvider.dart';
import 'package:provider/provider.dart';


class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          InkWell(
            onTap: (){
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(13),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: MyTheme.primaryLightColor)),
              child: Row(
                children: [
                  Text(provider.appLanguage == 'en'
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 25,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

}
