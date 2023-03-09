import 'package:flutter/material.dart';
import 'package:news_app/providers/appConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 16,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.appLanguage == 'ar'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.arabic))
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$text',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor)),
        Icon(Icons.check, size: 25, color: Theme.of(context).primaryColor)
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text('$text', style: Theme.of(context).textTheme.subtitle1);
  }
}
