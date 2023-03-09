import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_item.dart';
import 'package:news_app/model/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategoryScreen extends StatelessWidget {
  Function onCategoryItemClicked;
  CategoryScreen({required this.onCategoryItemClicked});
  @override
  Widget build(BuildContext context) {
    var categoryList = Category.getCategory(context);
    return Container(
      margin: EdgeInsets.all(13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.pickYourCategoryOfInterest,
            // 'Pick your category \n of Interest',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    onCategoryItemClicked(categoryList[index]);
                  },
                  child: CategoryItem(
                    category: categoryList[index],
                    index: index,
                  ),
                );
              },
              itemCount: categoryList.length,
            ),
          )
        ],
      ),
    );
  }
}
