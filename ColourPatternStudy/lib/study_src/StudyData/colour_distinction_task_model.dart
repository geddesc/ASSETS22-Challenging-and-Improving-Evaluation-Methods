import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/models/cvd_type.dart';

class ColourDistinctionTaskModel {
  final String technique;
  final double accuracy;
  final Duration completionTime;
  final int numDistinctColours;
  final int numSwatches;
  final String colourSet;
  final int startTime;
  final int endTime;
  final double screenHeight;
  final double screenWidth;
  final int colourDiffCode;
  final String colourNamesGuessed;
  final String correctColourNames;
  final int numDistinctColoursGuessed;

  ColourDistinctionTaskModel({
    @required this.technique,
    @required this.accuracy,
    @required this.completionTime,
    @required this.numSwatches,
    @required this.colourSet,
    @required this.numDistinctColours,
    @required this.startTime,
    @required this.endTime,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.colourDiffCode,
    @required this.colourNamesGuessed,
    @required this.correctColourNames,
    @required this.numDistinctColoursGuessed,
  });
}
