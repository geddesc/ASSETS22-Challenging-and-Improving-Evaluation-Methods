import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/models/cvd_type.dart';

class ColourSelectionTaskModel {
  final String technique;
  final String targetColour;
  final double accuracy;
  final Duration completionTime;
  final int numSelected;
  final int numTargetColours;
  final int numSwatches;
  final int numConfusionColours;
  final int numDistractorColours;
  final String colourSet;
  final String selectedColoursCorrect;
  final String selectedColoursWrong;
  final String missedColours;
  final String confusionColours;
  final String distractorColours;
  final String targetColours;
  final int startTime;
  final int endTime;
  final double screenHeight;
  final double screenWidth;
  final int colourDiffCode;

  ColourSelectionTaskModel({
    @required this.technique,
    @required this.targetColour,
    @required this.accuracy,
    @required this.completionTime,
    @required this.numSelected,
    @required this.numTargetColours,
    @required this.numSwatches,
    @required this.numConfusionColours,
    @required this.numDistractorColours,
    @required this.colourSet,
    @required this.selectedColoursCorrect,
    @required this.selectedColoursWrong,
    @required this.missedColours,
    @required this.confusionColours,
    @required this.distractorColours,
    @required this.targetColours,
    @required this.startTime,
    @required this.endTime,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.colourDiffCode,
  });
}
