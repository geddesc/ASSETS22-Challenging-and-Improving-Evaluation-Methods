import 'package:flutter/material.dart';

class PostStudyQuestionnaireData {
  final double rankOfNoPattern;
  final String expOfNoPatternRank;
  final double rankOfColourMix;
  final String expOfMixRank;
  final double rankOfColourIconizer;
  final String expOfIconizerRank;
  final double rankOfColourMeters;
  final String expOfMeterRank;
  final String mixProsCons;
  final String iconProsCons;
  final String metersProsCons;
  final String mixRealWorld;
  final String iconRealWorld;
  final String metersRealWorld;
  final String mixImprove;
  final String iconImprove;
  final String metersImprove;

  PostStudyQuestionnaireData({
    @required this.rankOfNoPattern,
    @required this.expOfNoPatternRank,
    @required this.rankOfColourMix,
    @required this.expOfMixRank,
    @required this.rankOfColourIconizer,
    @required this.expOfIconizerRank,
    @required this.rankOfColourMeters,
    @required this.expOfMeterRank,
    @required this.mixProsCons,
    @required this.iconProsCons,
    @required this.metersProsCons,
    @required this.mixRealWorld,
    @required this.iconRealWorld,
    @required this.metersRealWorld,
    @required this.mixImprove,
    @required this.iconImprove,
    @required this.metersImprove,
  });
  PostStudyQuestionnaireData.normal({
    this.rankOfNoPattern = -1,
    this.expOfNoPatternRank = "N/A",
    this.rankOfColourMix = -1,
    this.expOfMixRank = "N/A",
    this.rankOfColourIconizer = -1,
    this.expOfIconizerRank = "N/A",
    this.rankOfColourMeters = -1,
    this.expOfMeterRank = "N/A",
    this.mixProsCons = "N/A",
    this.iconProsCons = "N/A",
    this.metersProsCons = "N/A",
    this.mixRealWorld = "N/A",
    this.iconRealWorld = "N/A",
    this.metersRealWorld = "N/A",
    this.mixImprove = "N/A",
    this.iconImprove = "N/A",
    this.metersImprove = "N/A",
  });
}
