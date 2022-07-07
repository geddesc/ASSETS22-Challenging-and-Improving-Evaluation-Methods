import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/models/cvd_type.dart';
import 'package:observationStudyScaffold/study_src/ColourGeneration/colour_distinction_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_distinction_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';

import '../../pages/ineligible_page.dart';
import '../StudyData/provider_data.dart';

class ColourDistinctionTask extends StatefulWidget {
  final int numberOfColours;
  final Function onNext;
  final CvdType typeOfCVD;
  final int patternMethod;
  final Widget Function(BuildContext context, double constraints, Color color)
      technique;
  final int colourDiffCode;
  final int distinctColours;

  ColourDistinctionTask({
    @required Key key,
    @required this.numberOfColours,
    @required this.onNext,
    @required this.typeOfCVD,
    @required this.technique,
    @required this.patternMethod,
    @required this.colourDiffCode,
    @required this.distinctColours,
  }) : super(key: key);

  @override
  _ColourDistinctionTaskState createState() => _ColourDistinctionTaskState();
}

class _ColourDistinctionTaskState extends State<ColourDistinctionTask> {
  int rows;
  int columns;
  List<Color> colours = [];
  Stopwatch myStopWatch;
  int startTime;
  int endTime;
  bool skip = false;
  bool ineligible = false;
  String colourSet;
  int patternNum;
  Map<String, bool> colourNamesInSet;

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now().millisecondsSinceEpoch;

    //colours = ColourDistinctionModel.generateColours(80, widget.distinctColours).colourSet;

    // for(int i = 0; i < widget.numberOfColours; i++) {
    //   colours.add(Colors.red);
    // }
    myStopWatch = Stopwatch()..start();
  }

  @override
  Widget build(BuildContext context) {
    //var colourTaskData = context.watch<ColourTaskData>();
    return Provider<ColourTaskData>(
        create: (context) => colourTaskData,
        builder: (context, child) {
          var cvdString = colourTaskData.preStudyData.cvdType;
          CvdType cvd;
          int ageGroup = colourTaskData.preStudyData.ageGroup;
          bool alreadyParticipated =
              colourTaskData.preStudyData.alreadyParticipated;

          if (ageGroup == 0 || alreadyParticipated) {
            ineligible = true;
          }
          if (cvdString == "Protan") {
            cvd = CvdType.protan;
            colourSet = "Protan";
            patternNum = widget.patternMethod;

            ///colours = This is where distinction colour model will go
          } else if (cvdString == "Deutan") {
            cvd = CvdType.deutan;
            colourSet = "Deutan";
            patternNum = widget.patternMethod;
            //colours =
          } else if (cvdString == "Tritan") {
            cvd = CvdType.tritan;
            colourSet = "Tritan";
            patternNum = widget.patternMethod;
            // colours = ColourTransitionModel(
            //         cvdType: CvdType.tritan,
            //         colourCode: widget.colourNumber,
            //         isChroma: widget.isChroma,
            //         secondaryColourCode: 2)
            //     .colourList;
          } else if (cvdString == "Monochromacy") {
            cvd = CvdType.monochromat;
            // cvd = CvdType.monochromat;
            // patternNum = widget.patternMethod;
            // var rng = new Random();
            // var randNum = rng.nextInt(3);
            // if (widget.colourNumber == 0) {
            //   colourSet = "Protan";
            //   colours = ColourTransitionModel(
            //           cvdType: CvdType.protan,
            //           colourCode: randNum,
            //           isChroma: widget.isChroma,
            //           secondaryColourCode: 2)
            //       .colourList;
            // } else if (widget.colourNumber == 1) {
            //   colourSet = "Deutan";
            //   colours = ColourTransitionModel(
            //           cvdType: CvdType.deutan,
            //           colourCode: randNum,
            //           isChroma: widget.isChroma,
            //           secondaryColourCode: 2)
            //       .colourList;
            // } else if (widget.colourNumber == 2) {
            //   colourSet = "Tritan";
            //   colours = ColourTransitionModel(
            //           cvdType: CvdType.tritan,
            //           colourCode: randNum,
            //           isChroma: widget.isChroma,
            //           secondaryColourCode: 2)
            //       .colourList;
            // }
          } else if (cvdString == "None") {
            cvd = CvdType.normal;
            patternNum = 0;
            if (widget.patternMethod == 0) {
              colourSet = "Protan";
              // colours = ColourTransitionModel(
              //         cvdType: CvdType.protan,
              //         colourCode: widget.colourNumber,
              //         isChroma: widget.isChroma,
              //         secondaryColourCode: 2)
              //     .colourList;
            } else if (widget.patternMethod == 1) {
              colourSet = "Deutan";
              // colours = ColourTransitionModel(
              //         cvdType: CvdType.deutan,
              //         colourCode: widget.colourNumber,
              //         isChroma: widget.isChroma,
              //         secondaryColourCode: 2)
              //     .colourList;
            } else if (widget.patternMethod == 2) {
              colourSet = "Tritan";
              // colours = ColourTransitionModel(
              //         cvdType: CvdType.tritan,
              //         colourCode: widget.colourNumber,
              //         isChroma: widget.isChroma,
              //         secondaryColourCode: 2)
              //     .colourList;
            } else {
              skip = true;
              cvd = CvdType.normal;
              colourSet = "Protan";
              // colours = ColourTransitionModel(
              //         cvdType: CvdType.protan,
              //         colourCode: widget.colourNumber,
              //         isChroma: widget.isChroma,
              //         secondaryColourCode: 2)
              //     .colourList;
            }
          }
          // _buildColourRow(colours);

          if (widget.distinctColours == 1) {
            colourNamesInSet = {
              "red": false,
              "orange": false,
              "yellow": false,
              "green": false,
              "blue": true,
              "purple": false,
              "pink": false,
              "grey": false,
              "brown": false,
              "black": false
            };
            colours = [
              Color(0xff1854e8),
              Color(0xff0000d0),
              Color(0xff4000c8),
              Color(0xff305cc0),
              Color(0xff6880f8),
              Color(0xffb8dcf8),
              Color(0xff0000d0),
              Color(0xff6880f8),
              Color(0xff0088d8),
              Color(0xffb8dcf8),
              Color(0xff0088d8),
              Color(0xff3800c0),
              Color(0xff0018a0),
              Color(0xff48b0e8),
              Color(0xff08a8f8),
              Color(0xff6880f8),
              Color(0xff0088c0),
              Color(0xff6880f8),
              Color(0xff184870),
              Color(0xff80a8e0),
              Color(0xff08a8f8),
              Color(0xff98c8e8),
              Color(0xffb8dcf8),
              Color(0xff0088c0),
              Color(0xff1854e8),
              Color(0xff305cc0),
              Color(0xff6880f8),
              Color(0xff98c8e8),
              Color(0xff709cf8),
              Color(0xff100058),
              Color(0xff305cc0),
              Color(0xff002c50),
              Color(0xff0088c0),
              Color(0xff3864a0),
              Color(0xff0000d0),
              Color(0xff1854e8),
              Color(0xff90d4f8),
              Color(0xff002c50),
              Color(0xff98c8e8),
              Color(0xff0018a0),
              Color(0xff98c8e8),
              Color(0xff98c8e8),
              Color(0xff100058),
              Color(0xff0088f8),
              Color(0xff1854e8),
              Color(0xff100058),
              Color(0xff0088f8),
              Color(0xff3800c0),
              Color(0xff0000d0),
              Color(0xff100058),
              Color(0xff3800c0),
              Color(0xff305cc0),
              Color(0xff90d4f8),
              Color(0xff002870),
              Color(0xff002870),
              Color(0xff4000c8),
              Color(0xff98c8e8),
              Color(0xff305cc0),
              Color(0xff80a8e0),
              Color(0xff0018a0),
              Color(0xff08a8f8),
              Color(0xff184870),
              Color(0xff002870),
              Color(0xff0088c0),
              Color(0xff08a8f8),
              Color(0xff08a8f8),
              Color(0xff1854e8),
              Color(0xff98c8e8),
              Color(0xff184870),
              Color(0xff90d4f8),
              Color(0xff0000d0),
              Color(0xff305cc0),
              Color(0xff184870),
              Color(0xff48b0e8),
              Color(0xff002870),
              Color(0xff184870),
              Color(0xff0088c0),
              Color(0xffb8dcf8),
              Color(0xff305cc0),
              Color(0xff3864a0)
            ];
          } else if (widget.distinctColours == 2) {
            colourNamesInSet = {
              "red": false,
              "orange": true,
              "yellow": true,
              "green": false,
              "blue": false,
              "purple": false,
              "pink": false,
              "grey": false,
              "brown": false,
              "black": false
            };
            colours = [
              Color(0xfff8e028),
              Color(0xfff86800),
              Color(0xfff89828),
              Color(0xffe8ec38),
              Color(0xffe8d028),
              Color(0xfff05800),
              Color(0xfff8e050),
              Color(0xffd85400),
              Color(0xffe06400),
              Color(0xfff89828),
              Color(0xffe07c18),
              Color(0xffe8d028),
              Color(0xfff0d000),
              Color(0xffe06400),
              Color(0xffe06400),
              Color(0xffe0f010),
              Color(0xfff8f878),
              Color(0xffd86000),
              Color(0xfff87410),
              Color(0xfff8d430),
              Color(0xfff8f078),
              Color(0xffe8f000),
              Color(0xfff09030),
              Color(0xffe0d000),
              Color(0xffd85400),
              Color(0xfff87410),
              Color(0xfff05800),
              Color(0xfff8e028),
              Color(0xffe8d028),
              Color(0xffe0d438),
              Color(0xffe8ec38),
              Color(0xfff0e430),
              Color(0xffd85400),
              Color(0xfff0d000),
              Color(0xffd86000),
              Color(0xfff8fc60),
              Color(0xfff85c18),
              Color(0xfff08400),
              Color(0xfff8e028),
              Color(0xffd85400),
              Color(0xfff05800),
              Color(0xfff05800),
              Color(0xffe07c18),
              Color(0xfff0e458),
              Color(0xffe8f000),
              Color(0xfff08400),
              Color(0xffd86000),
              Color(0xfff09030),
              Color(0xfff8d430),
              Color(0xffe8d000),
              Color(0xfff0d000),
              Color(0xfff86000),
              Color(0xfff07818),
              Color(0xfff08400),
              Color(0xffd86000),
              Color(0xffe0f010),
              Color(0xffe8f000),
              Color(0xfff8e028),
              Color(0xffe8f000),
              Color(0xfff09030),
              Color(0xfff0e430),
              Color(0xfff8fc38),
              Color(0xfff8e028),
              Color(0xfff0e458),
              Color(0xffe87c20),
              Color(0xfff8fc60),
              Color(0xfff87410),
              Color(0xfff8d430),
              Color(0xfff89020),
              Color(0xffe06400),
              Color(0xfff88400),
              Color(0xffe05400),
              Color(0xffe8d028),
              Color(0xfff89020),
              Color(0xfff8fc60),
              Color(0xfff89828),
              Color(0xfff8d430),
              Color(0xffe8d000),
              Color(0xffe0d438),
              Color(0xfff86000)
            ];
          } else if (widget.distinctColours == 3) {
            colourNamesInSet = {
              "red": true,
              "orange": false,
              "yellow": false,
              "green": false,
              "blue": true,
              "purple": false,
              "pink": false,
              "brown": false,
              "grey": true
            };
            colours = [
              Color(0xff787470),
              Color(0xff787468),
              Color(0xffe00018),
              Color(0xff909490),
              Color(0xffc01c28),
              Color(0xff305cc0),
              Color(0xff787c78),
              Color(0xff585c58),
              Color(0xfff80020),
              Color(0xff807c78),
              Color(0xff787870),
              Color(0xff807c78),
              Color(0xff3800c0),
              Color(0xff808080),
              Color(0xff0088d8),
              Color(0xff807c78),
              Color(0xfff02428),
              Color(0xff90d4f8),
              Color(0xff002c50),
              Color(0xff100058),
              Color(0xff707870),
              Color(0xff787c78),
              Color(0xff787068),
              Color(0xffc01c28),
              Color(0xfff80c00),
              Color(0xff807c78),
              Color(0xffd81420),
              Color(0xff1854e8),
              Color(0xff1854e8),
              Color(0xffc01c28),
              Color(0xff787470),
              Color(0xff3800c0),
              Color(0xff08a8f8),
              Color(0xff4000c8),
              Color(0xffb01408),
              Color(0xfff80c00),
              Color(0xfff80020),
              Color(0xff707870),
              Color(0xff6880f8),
              Color(0xff808480),
              Color(0xff08a8f8),
              Color(0xffb01408),
              Color(0xffe00018),
              Color(0xfff82c28),
              Color(0xff707870),
              Color(0xff08a8f8),
              Color(0xff787878),
              Color(0xff707c70),
              Color(0xff888888),
              Color(0xff989498),
              Color(0xff1854e8),
              Color(0xff707c70),
              Color(0xff0088c0),
              Color(0xffb80020),
              Color(0xffb80020),
              Color(0xff98c8e8),
              Color(0xff80a8e0),
              Color(0xffb01408),
              Color(0xff605c60),
              Color(0xffc00000),
              Color(0xff888c88),
              Color(0xff0018a0),
              Color(0xffe80010),
              Color(0xfff80c00),
              Color(0xff0088c0),
              Color(0xff707c70),
              Color(0xff787068),
              Color(0xff80a8e0),
              Color(0xffb82020),
              Color(0xfff82820),
              Color(0xffb80020),
              Color(0xffe81008),
              Color(0xff002c50),
              Color(0xff0088d8),
              Color(0xff002870),
              Color(0xffb8dcf8),
              Color(0xffd81420),
              Color(0xffa80018),
              Color(0xff0088c0),
              Color(0xff3800c0)
            ];
          } else if (widget.distinctColours == 4) {
            colourNamesInSet = {
              "red": true,
              "orange": true,
              "yellow": true,
              "green": false,
              "blue": true,
              "purple": false,
              "pink": false,
              "grey": false,
              "brown": false,
              "black": false
            };
            colours = [
              Color(0xffe8e858),
              Color(0xff3864a0),
              Color(0xffe0d438),
              Color(0xffb00800),
              Color(0xff002c50),
              Color(0xffb80020),
              Color(0xfff8e028),
              Color(0xffe81008),
              Color(0xfff80020),
              Color(0xff0000d0),
              Color(0xffe00018),
              Color(0xffe8e858),
              Color(0xfff05800),
              Color(0xff0018a0),
              Color(0xfff88c38),
              Color(0xfff0cc10),
              Color(0xff184870),
              Color(0xfff89828),
              Color(0xfff80c00),
              Color(0xffb00800),
              Color(0xff90d4f8),
              Color(0xff002c50),
              Color(0xffe81008),
              Color(0xfff8f878),
              Color(0xff709cf8),
              Color(0xff002870),
              Color(0xff80a8e0),
              Color(0xfff89828),
              Color(0xff1854e8),
              Color(0xffc02418),
              Color(0xfff0d000),
              Color(0xffb80020),
              Color(0xffe06400),
              Color(0xff184870),
              Color(0xfff8fc38),
              Color(0xfff85c18),
              Color(0xffb80020),
              Color(0xffe8d000),
              Color(0xffc80828),
              Color(0xffc00000),
              Color(0xff0088c0),
              Color(0xffe07c18),
              Color(0xffe07c18),
              Color(0xff100058),
              Color(0xffe00018),
              Color(0xfff0e458),
              Color(0xfff07818),
              Color(0xffe8f000),
              Color(0xfff06828),
              Color(0xfff81030),
              Color(0xfff0d000),
              Color(0xfff0cc10),
              Color(0xffe87c20),
              Color(0xfff02428),
              Color(0xfff0cc10),
              Color(0xfff8f878),
              Color(0xfff87410),
              Color(0xff002870),
              Color(0xfff0cc10),
              Color(0xfff87410),
              Color(0xfff05800),
              Color(0xff48b0e8),
              Color(0xffe0f010),
              Color(0xfff8f078),
              Color(0xff6880f8),
              Color(0xffe8e858),
              Color(0xfff86828),
              Color(0xfff09030),
              Color(0xffc80828),
              Color(0xfff02428),
              Color(0xffb00800),
              Color(0xff100058),
              Color(0xffc02418),
              Color(0xff80a8e0),
              Color(0xffe88800),
              Color(0xffe06400),
              Color(0xff80a8e0),
              Color(0xfff0e458),
              Color(0xfff07818),
              Color(0xfff07818)
            ];
          } else if (widget.distinctColours == 5) {
            colourNamesInSet = {
              "red": true,
              "orange": true,
              "yellow": false,
              "green": true,
              "blue": false,
              "purple": false,
              "pink": true,
              "brown": false,
              "grey": true
            };
            colours = [
              Color(0xffe80010),
              Color(0xfff08400),
              Color(0xff888c88),
              Color(0xffe87c20),
              Color(0xfff884a0),
              Color(0xff605c60),
              Color(0xff707c70),
              Color(0xffc80828),
              Color(0xffa80018),
              Color(0xff50fc58),
              Color(0xffa8e898),
              Color(0xff787068),
              Color(0xff888888),
              Color(0xff585c58),
              Color(0xfff880b0),
              Color(0xffe07c18),
              Color(0xfff09ca8),
              Color(0xfff86800),
              Color(0xff787878),
              Color(0xfff88400),
              Color(0xff008028),
              Color(0xfff81030),
              Color(0xffe07c18),
              Color(0xfff098c0),
              Color(0xffa0fc90),
              Color(0xfff864b8),
              Color(0xffd85400),
              Color(0xffe81008),
              Color(0xffb01408),
              Color(0xff003000),
              Color(0xffa80018),
              Color(0xffc01c28),
              Color(0xfff86000),
              Color(0xfff86800),
              Color(0xff808480),
              Color(0xffe81008),
              Color(0xfff89cb0),
              Color(0xff50fc58),
              Color(0xffc01c28),
              Color(0xfff06828),
              Color(0xffe80010),
              Color(0xfff87498),
              Color(0xfff888c0),
              Color(0xffc0fc88),
              Color(0xff585c58),
              Color(0xffa0fc50),
              Color(0xff909490),
              Color(0xff00dc50),
              Color(0xff807c78),
              Color(0xff787870),
              Color(0xff50fc58),
              Color(0xffc80828),
              Color(0xff48bc40),
              Color(0xffe05400),
              Color(0xfff09ca8),
              Color(0xff606460),
              Color(0xfff064b8),
              Color(0xfff89828),
              Color(0xfff80c00),
              Color(0xfff86890),
              Color(0xfff088b0),
              Color(0xfff89cb0),
              Color(0xff787c78),
              Color(0xfff86800),
              Color(0xfff09030),
              Color(0xfff86890),
              Color(0xffc01c28),
              Color(0xff48fc78),
              Color(0xffe06400),
              Color(0xffc01c28),
              Color(0xfff8a4b8),
              Color(0xffa8e898),
              Color(0xff707468),
              Color(0xff707070),
              Color(0xff50fc58),
              Color(0xff00dc50),
              Color(0xfff89cb0),
              Color(0xff588400),
              Color(0xffe81408),
              Color(0xfff05800)
            ];
          } else if (widget.distinctColours == 6) {
            colourNamesInSet = {
              "red": true,
              "orange": true,
              "yellow": false,
              "green": true,
              "blue": true,
              "purple": false,
              "pink": true,
              "brown": true,
              "grey": false
            };
            colours = [
              Color(0xfff880b0),
              Color(0xfff86498),
              Color(0xff008028),
              Color(0xffa06038),
              Color(0xffd81420),
              Color(0xfff064b8),
              Color(0xffe00018),
              Color(0xff0018a0),
              Color(0xfff884a0),
              Color(0xff683000),
              Color(0xfff80c00),
              Color(0xffe07c18),
              Color(0xff805800),
              Color(0xff80a8e0),
              Color(0xff00dc00),
              Color(0xfff85c18),
              Color(0xff008028),
              Color(0xffa80018),
              Color(0xff502810),
              Color(0xffb01408),
              Color(0xfff87498),
              Color(0xff683000),
              Color(0xffa07450),
              Color(0xffe06400),
              Color(0xffc02418),
              Color(0xffc01c28),
              Color(0xfff88c38),
              Color(0xff0018a0),
              Color(0xfff81030),
              Color(0xffa0fc90),
              Color(0xff008800),
              Color(0xfff87cb8),
              Color(0xfff07818),
              Color(0xffe87c20),
              Color(0xff00dc00),
              Color(0xfff87cb8),
              Color(0xff907438),
              Color(0xffe88800),
              Color(0xffc80828),
              Color(0xfff86800),
              Color(0xffa06038),
              Color(0xff48b0e8),
              Color(0xfff86000),
              Color(0xff3864a0),
              Color(0xff00dc50),
              Color(0xff50fc58),
              Color(0xffe88800),
              Color(0xff709cf8),
              Color(0xffc0fc88),
              Color(0xffe81008),
              Color(0xff90c848),
              Color(0xffa07838),
              Color(0xff002870),
              Color(0xff100058),
              Color(0xff503800),
              Color(0xfff87cb8),
              Color(0xff402810),
              Color(0xfff06828),
              Color(0xff40a860),
              Color(0xffd85400),
              Color(0xff0000d0),
              Color(0xfff860a8),
              Color(0xffa80018),
              Color(0xfff098c0),
              Color(0xffb80020),
              Color(0xff58d800),
              Color(0xff98c8e8),
              Color(0xff3864a0),
              Color(0xff98c8e8),
              Color(0xff604028),
              Color(0xfff088b0),
              Color(0xff40a860),
              Color(0xfff88400),
              Color(0xfff82820),
              Color(0xfff880b0),
              Color(0xff90d4f8),
              Color(0xfff86890),
              Color(0xffa0fc90),
              Color(0xff683000),
              Color(0xff3864a0)
            ];
          } else if (widget.distinctColours == 7) {
            colourNamesInSet = {
              "red": false,
              "orange": true,
              "yellow": true,
              "green": true,
              "blue": true,
              "purple": false,
              "pink": true,
              "grey": true,
              "brown": true,
              "black": false
            };
            colours = [
              Color(0xfff064b8),
              Color(0xfff0e430),
              Color(0xff687468),
              Color(0xffa0fc90),
              Color(0xfff880c8),
              Color(0xff004000),
              Color(0xff704430),
              Color(0xffe06400),
              Color(0xfff088a8),
              Color(0xfff8f078),
              Color(0xff785028),
              Color(0xfff06828),
              Color(0xff606460),
              Color(0xff004000),
              Color(0xff3864a0),
              Color(0xfff888c0),
              Color(0xff583400),
              Color(0xfff0e458),
              Color(0xff907438),
              Color(0xffe05400),
              Color(0xffe8f000),
              Color(0xffe0d438),
              Color(0xff184870),
              Color(0xff0088c0),
              Color(0xff002870),
              Color(0xff004000),
              Color(0xfff8e050),
              Color(0xff707870),
              Color(0xff787870),
              Color(0xff787878),
              Color(0xfff088b0),
              Color(0xff683000),
              Color(0xfff86800),
              Color(0xff907438),
              Color(0xff402810),
              Color(0xff004000),
              Color(0xff184870),
              Color(0xff0018a0),
              Color(0xff98ec98),
              Color(0xff08a8f8),
              Color(0xfff08400),
              Color(0xff50fc58),
              Color(0xffa8e898),
              Color(0xfff87498),
              Color(0xffa87038),
              Color(0xfff86890),
              Color(0xff205030),
              Color(0xfff870a8),
              Color(0xfff0cc10),
              Color(0xff588400),
              Color(0xfff09030),
              Color(0xfff8f478),
              Color(0xfff89020),
              Color(0xffe05400),
              Color(0xff90d4f8),
              Color(0xfff87498),
              Color(0xff787c70),
              Color(0xffa07450),
              Color(0xff707c70),
              Color(0xff588400),
              Color(0xfff89828),
              Color(0xff6880f8),
              Color(0xffe0d438),
              Color(0xffd85400),
              Color(0xff785028),
              Color(0xfff860a8),
              Color(0xff604028),
              Color(0xfff860a8),
              Color(0xff305cc0),
              Color(0xffe8e858),
              Color(0xff787470),
              Color(0xff808480),
              Color(0xfff8ec00),
              Color(0xff0088c0),
              Color(0xff707468),
              Color(0xff606460),
              Color(0xfff0d000),
              Color(0xfff06828),
              Color(0xff606460),
              Color(0xff604028)
            ];
          } else if (widget.distinctColours == 8) {
            colourNamesInSet = {
              "red": false,
              "orange": true,
              "yellow": true,
              "green": true,
              "blue": true,
              "purple": true,
              "pink": true,
              "grey": true,
              "brown": true,
              "black": false
            };
            colours = [
              Color(0xffc0fc88),
              Color(0xff707468),
              Color(0xff48bc40),
              Color(0xff4000c8),
              Color(0xff205030),
              Color(0xff184870),
              Color(0xfff8f478),
              Color(0xff583400),
              Color(0xff7850a0),
              Color(0xfff86cb0),
              Color(0xff684470),
              Color(0xffe86c28),
              Color(0xff606460),
              Color(0xfff09030),
              Color(0xfff860a8),
              Color(0xff787c78),
              Color(0xff687468),
              Color(0xff50fc58),
              Color(0xff686c68),
              Color(0xff402810),
              Color(0xff0088f8),
              Color(0xffe86c28),
              Color(0xfff088a8),
              Color(0xff184870),
              Color(0xfff86000),
              Color(0xff002c50),
              Color(0xfff89cb0),
              Color(0xff3864a0),
              Color(0xff685028),
              Color(0xfff89020),
              Color(0xff3864a0),
              Color(0xff683000),
              Color(0xff787468),
              Color(0xffa07838),
              Color(0xff98ec98),
              Color(0xff885ca8),
              Color(0xfff8fc38),
              Color(0xffe8d028),
              Color(0xffe0d000),
              Color(0xff707070),
              Color(0xffa87038),
              Color(0xff783cb0),
              Color(0xfff86498),
              Color(0xff907438),
              Color(0xfff8f078),
              Color(0xff08a8f8),
              Color(0xff989498),
              Color(0xfff8e050),
              Color(0xffe8f000),
              Color(0xff008800),
              Color(0xfff06828),
              Color(0xff784068),
              Color(0xff783cb0),
              Color(0xff68a058),
              Color(0xff90d4f8),
              Color(0xff808480),
              Color(0xff98ec98),
              Color(0xfff06828),
              Color(0xff885ca8),
              Color(0xff907438),
              Color(0xff305cc0),
              Color(0xff905400),
              Color(0xffa844b8),
              Color(0xfff87498),
              Color(0xfff880b0),
              Color(0xfff09ca8),
              Color(0xfff860a8),
              Color(0xff606060),
              Color(0xff008028),
              Color(0xff205030),
              Color(0xffa048c8),
              Color(0xfff88400),
              Color(0xfff87cb8),
              Color(0xffe0d438),
              Color(0xff684470),
              Color(0xfff89828),
              Color(0xfff8d418),
              Color(0xffe8e858),
              Color(0xfff86000),
              Color(0xffa07450)
            ];
          } else if (widget.distinctColours == 9) {
            colourNamesInSet = {
              "red": true,
              "orange": true,
              "yellow": true,
              "green": true,
              "blue": true,
              "purple": true,
              "pink": true,
              "grey": true,
              "brown": true,
              "black": false
            };
            colours = [
              Color(0xfff87410),
              Color(0xfff88400),
              Color(0xff583400),
              Color(0xffe0d000),
              Color(0xff604028),
              Color(0xff684878),
              Color(0xff707c70),
              Color(0xffa80018),
              Color(0xff002870),
              Color(0xfff8f478),
              Color(0xfff86828),
              Color(0xffe0d000),
              Color(0xffd02020),
              Color(0xffa0fc50),
              Color(0xffb80020),
              Color(0xff50fc58),
              Color(0xfff864b8),
              Color(0xfff09ca8),
              Color(0xfff86890),
              Color(0xff0088f8),
              Color(0xff909490),
              Color(0xfff82c28),
              Color(0xff004000),
              Color(0xfff89cb0),
              Color(0xff100058),
              Color(0xff6880f8),
              Color(0xff0018a0),
              Color(0xffe88800),
              Color(0xff008800),
              Color(0xffe0d000),
              Color(0xfff86000),
              Color(0xffe8d028),
              Color(0xffc0fc88),
              Color(0xfff898c0),
              Color(0xff90d4f8),
              Color(0xff808480),
              Color(0xff50fc58),
              Color(0xfff88c38),
              Color(0xff989498),
              Color(0xff580c80),
              Color(0xfff86cb0),
              Color(0xffe07c18),
              Color(0xff785028),
              Color(0xfff8a4b8),
              Color(0xff783478),
              Color(0xff981c98),
              Color(0xffe8e858),
              Color(0xfff8d418),
              Color(0xff7850a0),
              Color(0xfff884a0),
              Color(0xff909490),
              Color(0xff9864b0),
              Color(0xffe0d000),
              Color(0xff90c848),
              Color(0xff100058),
              Color(0xffa07838),
              Color(0xff40a860),
              Color(0xfff8a0c8),
              Color(0xff909490),
              Color(0xfff82c28),
              Color(0xffb01408),
              Color(0xffe81008),
              Color(0xff00dc00),
              Color(0xffb00800),
              Color(0xff887040),
              Color(0xff502810),
              Color(0xff707468),
              Color(0xff787870),
              Color(0xff3864a0),
              Color(0xfff85c18),
              Color(0xff806428),
              Color(0xffa83cc0),
              Color(0xffa048c8),
              Color(0xff804418),
              Color(0xff707468),
              Color(0xff907438),
              Color(0xff980cd0),
              Color(0xff6880f8),
              Color(0xffc01c28),
              Color(0xffe06400)
            ];
          }

          // var colourModel = ColourDistinctionModel.generateColours(
          //     widget.numberOfColours, widget.distinctColours);
          // colours = colourModel.colourSet;
          // //colours = ColourDistinctionModel.generateColours(80).colourSet;
          // var numDistinctColours = colourModel.numberOfColours;
          // colourNamesInSet = colourModel.colourNamesInSet;

          if (skip) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              setState(() {
                widget.onNext();
              });
            });
          }
          if (ineligible) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => IneligiblePage()));
            });
          }
          return (skip || ineligible)
              ? Container()
              : ColourDistinctionTask2(
                  key: widget.key,
                  onNext: widget.onNext,
                  technique: widget.technique,
                  typeOfCVD: cvd,
                  numberOfColours: widget.numberOfColours,
                  colourDiffCode: widget.colourDiffCode,
                  numDistinctColours: widget.distinctColours,
                  colours: colours,
                  colourNamesInSet: colourNamesInSet,
                );
        });
  }
}

class ColourDistinctionTask2 extends StatefulWidget {
  final int numberOfColours;
  final Function onNext;
  final CvdType typeOfCVD;
  final Widget Function(BuildContext context, double constraints, Color color)
      technique;
  final int colourDiffCode;
  final int numDistinctColours;
  final List<Color> colours;
  final Map<String, bool> colourNamesInSet;

  ColourDistinctionTask2({
    @required Key key,
    @required this.numberOfColours,
    @required this.onNext,
    @required this.typeOfCVD,
    @required this.technique,
    @required this.colourDiffCode,
    @required this.numDistinctColours,
    @required this.colours,
    @required this.colourNamesInSet,
  }) : super(key: key);

  @override
  _ColourDistinctionTaskState2 createState() => _ColourDistinctionTaskState2();
}

class _ColourDistinctionTaskState2 extends State<ColourDistinctionTask2> {
  int rows;
  int columns;

  Stopwatch myStopWatch;
  int startTime;
  int endTime;

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now().millisecondsSinceEpoch;

    // for(int i = 0; i < widget.numberOfColours; i++) {
    //   colours.add(Colors.red);
    // }
    myStopWatch = Stopwatch()..start();
  }

  Map<String, bool> isColourCategorySelected = {
    "red": false,
    "orange": false,
    "yellow": false,
    "green": false,
    "blue": false,
    "purple": false,
    "pink": false,
    "grey": false,
    "brown": false,
    "black": false,
  };

  void checkBoxSelected(String colourName) {
    setState(() {
      isColourCategorySelected[colourName] =
          !isColourCategorySelected[colourName];
    });
    //(isColourCategorySelected);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //if ((height < 500 || widget.isMobile) && height < width) {
    // if ((height < 500) && height < width) {
    //   Future.delayed(
    //       Duration.zero, () => showDialogIfFirstLoaded(context));
    // }

    AppBar appBar = AppBar(
      elevation: 0,
      centerTitle: true,
      title: FittedBox(
        child: SelectableText(
          // "Are there any ${taskColour}s present? (0 to ${widget.numTargetColours} possible)",
          "Please select all the distinct colours that are in the grid below",
          showCursor: true,
          toolbarOptions: ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: DesignTheme.headerFontSize,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );

    double squ = sqrt(widget.numberOfColours);
    if (squ == squ.toInt()) {
      rows = squ.toInt();
      columns = rows;
    } else {
      List<int> divisors = [];
      for (var i = 0; i <= widget.numberOfColours; i++) {
        if (widget.numberOfColours % i == 0) {
          divisors.add(i);
        }
      }
      var index = divisors.length ~/ 2 - 1;
      if (width > height) {
        columns = divisors[index];
        rows = divisors[index + 1];
      } else {
        rows = divisors[index];
        columns = divisors[index + 1];
      }
    }

    List<String> colourCategories = [
      "red",
      "orange",
      "yellow",
      "green",
      "blue",
      "purple",
      "pink",
      "grey",
      "brown",
      "black",
    ];

    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: _buildColourDistinctionGrid(),
          ),
          Expanded(
            child:
                _buildColourNameChecklist(colourCategories, checkBoxSelected),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            //child: _buildCompleteButton(colourTaskData, height, width),
            //child: _buildDistinctColourRowButtons(height, width),
            child: _buildCompleteButton(height, width, isColourCategorySelected,
                widget.colourNamesInSet),
          ),
        ],
      ),
    );
  }

  Widget _buildColourNameChecklist(
      List<String> colourCategories, Function(String) checkBoxSelected) {
    return Column(
      children: [
        _buildColourRow(colourCategories, 0, checkBoxSelected),
        _buildColourRow(colourCategories, 5, checkBoxSelected),
      ],
    );
  }

  Widget _buildColourRow(List<String> colourCategories, int index,
      Function(String) checkBoxSelected) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColourCheckBox(
              title: colourCategories[index],
              checkBoxSelected: checkBoxSelected),
          ColourCheckBox(
              title: colourCategories[index + 1],
              checkBoxSelected: checkBoxSelected),
          ColourCheckBox(
              title: colourCategories[index + 2],
              checkBoxSelected: checkBoxSelected),
          ColourCheckBox(
              title: colourCategories[index + 3],
              checkBoxSelected: checkBoxSelected),
          ColourCheckBox(
              title: colourCategories[index + 4],
              checkBoxSelected: checkBoxSelected),
        ],
      ),
    );
  }

  Widget _buildCompleteButton(
      var height,
      var width,
      Map<String, bool> isColourCategorySelected,
      Map<String, bool> colourNamesInSet) {
    var isOneCheckboxSelected = false;
    isColourCategorySelected.forEach((key, value) {
      if (isColourCategorySelected[key]) {
        isOneCheckboxSelected = true;
      }
    });

    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTheme.defaultRadiusVal),
      ),
      color: isOneCheckboxSelected ? DesignTheme.primaryColor : Colors.grey,
      onPressed: () {
        //print(widget.numDistinctColours);
        var secs = myStopWatch.elapsed.inMilliseconds;

        if (isOneCheckboxSelected && secs > 700) {
          var numCorrectlyGuessed = 0;
          var numTrueInGuessed = 0;
          double accuracy = 0.0;

          isColourCategorySelected.forEach((key, value) {
            if (key != 'black' &&
                (isColourCategorySelected[key] && colourNamesInSet[key]))
              numCorrectlyGuessed++;
            if (isColourCategorySelected[key]) numTrueInGuessed++;
          });

          if (numTrueInGuessed <= widget.numDistinctColours) {
            accuracy = numCorrectlyGuessed / widget.numDistinctColours;
            // print("Num Correctly Guess = $numCorrectlyGuessed");
            // print("Num Distinct = ${widget.numDistinctColours}");
            // print("Accuracy = $accuracy");
          } else {
            accuracy = numCorrectlyGuessed / numTrueInGuessed;
            // print("Num Correctly Guess = $numCorrectlyGuessed");
            // print("Num True In Guessed = ${numTrueInGuessed}");
            // print("Accuracy = $accuracy");
          }
          myStopWatch.stop();
          endTime = DateTime.now().millisecondsSinceEpoch;
          colourTaskData.addResultsColDisTask(
            ColourDistinctionTaskModel(
              technique: "TEMP_TECHNIQUE_ADJUST_LATER",
              accuracy: accuracy, //TEMP
              completionTime: myStopWatch.elapsed,
              numSwatches: widget.numberOfColours,
              colourSet: widget.colours.toString(),
              numDistinctColours: widget.numDistinctColours,
              colourNamesGuessed: isColourCategorySelected.toString(), // TEMP
              correctColourNames: colourNamesInSet.toString(), //, // TEMP
              startTime: startTime,
              endTime: endTime,
              screenHeight: height,
              screenWidth: width,
              colourDiffCode: widget.colourDiffCode,
              numDistinctColoursGuessed: numTrueInGuessed,
            ),
          );
          widget.onNext();
        }
      },
      child: Padding(
        padding: EdgeInsets.all(DesignTheme.mediumPadding),
        child: FittedBox(
          child: Text(
            "Continue",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: DesignTheme.titleFontSize,
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildDistinctColourRowButtons(var height, var width) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       for (int i = 0; i < 9; i++)
  //         _buildDistinctColourButton(i + 1, height, width),
  //     ],
  //   );
  // }

  //Widget _buildCompleteButton(var colourTaskData, var height, var width) {
  // Widget _buildDistinctColourButton(
  //   int index,
  //   var height,
  //   var width,
  // ) {
  //   return RaisedButton(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(DesignTheme.defaultRadiusVal),
  //     ),
  //     color: DesignTheme.primaryColor,
  //     onPressed: () {
  //       //print(widget.numDistinctColours);
  //       var secs = myStopWatch.elapsed.inMilliseconds;
  //       if (secs > 700) {
  //         myStopWatch.stop();
  //         endTime = DateTime.now().millisecondsSinceEpoch;
  //         colourTaskData.addResultsColDisTask(
  //           ColourDistinctionTaskModel(
  //             technique: "TEMP_TECHNIQUE_ADJUST_LATER",
  //             isCorrect: index == widget.numDistinctColours,
  //             completionTime: myStopWatch.elapsed,
  //             numSwatches: widget.numberOfColours,
  //             colourSet: "TEMP",
  //             numDistinctAnswer: widget.numDistinctColours,
  //             numDistinctGuessed: index,
  //             startTime: startTime,
  //             endTime: endTime,
  //             screenHeight: height,
  //             screenWidth: width,
  //             colourDiffCode: widget.colourDiffCode,
  //           ),
  //         );
  //         widget.onNext();
  //       }
  //     },
  //     child: Padding(
  //       padding: EdgeInsets.all(DesignTheme.mediumPadding),
  //       child: FittedBox(
  //         child: Text(
  //           index.toString(),
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: DesignTheme.titleFontSize,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildColourDistinctionGrid() {
    return LayoutBuilder(
      builder: (screenContext, screenConstraints) {
        final screenMin =
            (screenConstraints.maxHeight > screenConstraints.maxWidth)
                ? screenConstraints.maxWidth
                : screenConstraints.maxHeight;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenMin,
              width: screenMin,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < columns; i++)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var j = 0; j < rows; j++)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 50 / rows,
                                    horizontal: 50 / columns),
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    final min = (constraints.maxHeight >
                                            constraints.maxWidth)
                                        ? constraints.maxWidth
                                        : constraints.maxHeight;
                                    return ColourDistinctionSwatch(
                                      technique: widget.technique,
                                      totalNumberOfColours:
                                          widget.numberOfColours,
                                      numOfRows: rows,
                                      colours: widget.colours,
                                      //isSelected: isSelected,
                                      i: i,
                                      j: j,
                                      size: min,
                                      cvdType: widget.typeOfCVD,
                                    );
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
      //child:
    );
  }
}

class ColourDistinctionSwatch extends StatelessWidget {
  final Widget Function(BuildContext context, double size, Color color)
      technique;
  final int totalNumberOfColours;
  final int numOfRows;
  final List<Color> colours;
  final int i;
  final int j;
  final double size;
  final CvdType cvdType;

  ColourDistinctionSwatch({
    @required this.technique,
    @required this.totalNumberOfColours,
    @required this.numOfRows,
    @required this.colours,
    @required this.i,
    @required this.j,
    @required this.size,
    @required this.cvdType,
  });

  @override
  Widget build(BuildContext context) {
    int index = j + (i * numOfRows);
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: (cvdType != CvdType.normal)
                  ? colours[index]
                  : Colors.transparent,
            ),
            height: size,
            width: size,
            child: (cvdType != CvdType.normal)
                ? Container()
                : technique(
                    context,
                    size,
                    colours[index],
                  ),
          ),
        ],
      ),
    );
  }
}

class ColourCheckBox extends StatefulWidget {
  final String title;
  Function(String) checkBoxSelected;
  ColourCheckBox({@required this.title, @required this.checkBoxSelected});
  @override
  _ColourCheckBoxState createState() => _ColourCheckBoxState();
}

class _ColourCheckBoxState extends State<ColourCheckBox> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
              value: _isSelected,
              onChanged: (_) {
                widget.checkBoxSelected(widget.title);
                setState(() {
                  _isSelected = !_isSelected;
                });
              }),
        ),
      ],
    );
  }
}
