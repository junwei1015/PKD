import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });
  
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories=[];

    categories.add(
      CategoryModel(name: 'Salad', iconPath: 'asset/icon/plate.svg', boxColor: const Color(0xff92A3FD))
    );

    categories.add(
      CategoryModel(name: 'Cake', iconPath: 'asset/icon/pancakes.svg', boxColor: const Color(0xffC58BF2))
    );

    categories.add(
      CategoryModel(name: 'Pie', iconPath: 'asset/icon/pie.svg', boxColor: const Color(0xff92A3FD))
    );

    categories.add(
      CategoryModel(name: 'Smoothies', iconPath: 'asset/icon/orange-snacks.svg', boxColor: const Color(0xffC58BF2))
    );
    
    return categories;
  }
}