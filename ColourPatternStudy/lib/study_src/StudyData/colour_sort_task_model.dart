import 'package:flutter/foundation.dart';

class ColourSortTaskModel {
  final double accuracy;
  final Duration completionTime;
  final int numCorrect;
  final int numIncorrect;
  final String technique;
  final String size;
  //final Map<String, int> colorCounts;
  final String correctColours;
  final String incorrectColours;
  final String colours;
  final int startTime;
  final int endTime;
  final double screenHeight;
  final double screenWidth;
  final int colourDiffCode;


  ColourSortTaskModel({
    @required this.accuracy,
    @required this.completionTime,
    //@required this.colorCounts,
    @required this.numCorrect,
    @required this.numIncorrect,
    @required this.technique,
    @required this.size,
    @required this.correctColours,
    @required this.incorrectColours,
    @required this.colours,
    @required this.startTime,
    @required this.endTime,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.colourDiffCode,
  });
}
