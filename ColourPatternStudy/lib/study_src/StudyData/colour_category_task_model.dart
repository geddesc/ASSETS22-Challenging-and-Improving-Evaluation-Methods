import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/models/cvd_type.dart';

class ColourCategoryTaskModel {
  final String technique;
  final bool isCorrect;
  final Duration completionTime;
  final String categoryGuessed;
  final String categoryColourGuessed;
  final String categoryAnswer;
  final String categoryColourAnswer;
  final String colourExample;
  final String categoryColours;
  final int startTime;
  final int endTime;
  final double screenHeight;
  final double screenWidth;
  final int colourDiffCode;
  final String colourNameAnswer;
  final String colourNameGuessed;

  ColourCategoryTaskModel({
    @required this.technique,
    @required this.isCorrect,
    @required this.completionTime,
    @required this.categoryGuessed,
    @required this.categoryColourGuessed,
    @required this.categoryAnswer,
    @required this.categoryColourAnswer,
    @required this.colourExample,
    @required this.categoryColours,
    @required this.startTime,
    @required this.endTime,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.colourDiffCode,
    @required this.colourNameAnswer,
    @required this.colourNameGuessed,
  });
}
