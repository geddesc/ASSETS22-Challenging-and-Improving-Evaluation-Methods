import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ColourTransitionTaskModel {
  final String startColor;
  final String endColor;
  final double score;
  final Duration completionTime;
  final String technique;
  final String size;
  final String userSolvedTransitionList;
  final String goalList;
  final String colourSet;
  final String generatedStartingList;
  final int startTime;
  final int endTime;
  final double screenHeight;
  final double screenWidth;
  final int colourDiffCode;


  ColourTransitionTaskModel({
    @required this.startColor,
    @required this.endColor,
    @required this.score,
    @required this.completionTime,
    @required this.technique,
    @required this.size,
    @required this.userSolvedTransitionList,
    @required this.colourSet,
    @required this.goalList,
    @required this.startTime,
    @required this.endTime,
    @required this.generatedStartingList,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.colourDiffCode,
  });
}
