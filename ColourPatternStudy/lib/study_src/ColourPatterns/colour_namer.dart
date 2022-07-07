import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/study_src/ColourDictionary/colour_dictionary_list.dart';

class ColourNamer {
  final Color color;
  ColourNamer(this.color);
  String getName() {
    var rgb = ((color.red & int.parse("11111000", radix: 2)) << 8) |
        ((color.green & int.parse("11111100", radix: 2)) << 3) |
        (color.blue >> 3);
    return colourDictionaryList[rgb];
  }
}
