
import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;
  CategoryItem({required this.category, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:category.color ,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular((index % 2 == 0) ? 18 : 0),
              bottomRight: Radius.circular((index % 2 == 0) ? 0 : 18))),
      child: Column(
        children: [
          Image.asset(category.imagePath,height: 100),
          Text(category.title,
          style: TextStyle(
            color: MyTheme.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),)
        ],

      ),
    );
  }
}
