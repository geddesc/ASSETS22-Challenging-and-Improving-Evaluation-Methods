import 'dart:math';

import 'package:flutter/material.dart';

import '../ColourDictionary/new_colour_dictionary_list.dart';

class ColourCategoryModel {
  

  List<Color> colourSet = [];

  Map<String, Color> categoryColours = {
    
  };

  int numberOfColours;
  Color categoryColor;
  Random rand = Random();
  String categoryColourName;
  ColourCategoryModel.generateColours(this.categoryColourName) {
    _generateCategoryColour();
    
  }


  void _generateCategoryColour() {
    int index;
    index = rand.nextInt(new_col_list["red"].length);
    categoryColours['red'] = new_col_list["red"][index];

    index = rand.nextInt(new_col_list["orange"].length);
    categoryColours['orange'] = new_col_list["orange"][index];

    index = rand.nextInt(new_col_list["yellow"].length);
    categoryColours['yellow'] = new_col_list["yellow"][index];

    index = rand.nextInt(new_col_list["green"].length);
    categoryColours['green'] = new_col_list["green"][index];

    index = rand.nextInt(new_col_list["blue"].length);
    categoryColours['blue'] = new_col_list["blue"][index];

    index = rand.nextInt(new_col_list["purple"].length);
    categoryColours['purple'] = new_col_list["purple"][index];

    index = rand.nextInt(new_col_list["pink"].length);
    categoryColours['pink'] = new_col_list["pink"][index];

    index = rand.nextInt(new_col_list["brown"].length);
    categoryColours['brown'] = new_col_list["brown"][index];

    index = rand.nextInt(new_col_list["grey"].length);
    categoryColours['grey'] = new_col_list["grey"][index];

    index = rand.nextInt(new_col_list["black"].length);
    categoryColours['black'] = new_col_list["black"][index];


    index = rand.nextInt(new_col_list[categoryColourName].length);
    categoryColor = new_col_list[categoryColourName][index];
  }
}
