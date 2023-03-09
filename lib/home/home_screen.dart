import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/category/category_screen.dart';
import 'package:news_app/home/home_drawer.dart';
import 'package:news_app/home/news_Search.dart';
import 'package:news_app/home/settings/settings_tab.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> appBarTitle = ['News App' , '${AppLocalizations.of(context)!.settings}'];

    return Container(
      decoration: BoxDecoration(
        color: MyTheme.whiteColor,
        image: DecorationImage(
          image:  AssetImage('assets/images/main_background.png'),
              fit: BoxFit.cover
        )

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: NewsSearch());

            }, icon: Icon(Icons.search_rounded,size: 28,))
          ],
          title: Text('${selectedItemDrawer == HomeDrawer.categories?
          appBarTitle[0]:
              appBarTitle[1]
          }',
          //Text('News App',
          style: Theme.of(context).textTheme.headline1),

        ),
        drawer: Drawer(
            child: HomeDrawer(onDrawerItemClicked: onDrawerItemClicked),
        ),
        body: selectedItemDrawer == HomeDrawer.settings?
            SettingsTab():
        selectedCategory==null?
        CategoryScreen(onCategoryItemClicked: onCategoryItemClicked):
            CategoryDetails(category: selectedCategory!,)
      ),
    );
  }

  Category? selectedCategory = null ;

  void onCategoryItemClicked(Category category){
    selectedCategory = category;
    setState(() {

    });

  }
  var selectedItemDrawer =HomeDrawer.categories;
  void onDrawerItemClicked(int selectedItem){
    selectedItemDrawer = selectedItem;
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {

    });

  }
}
