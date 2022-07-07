import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/models/cvd_type.dart';
import 'package:observationStudyScaffold/study_src/ColourGeneration/colour_category_model.dart';
import 'package:observationStudyScaffold/study_src/ColourGeneration/colour_distinction_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_category_task_model.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';

import '../../pages/ineligible_page.dart';
import '../StudyData/colour_task_data.dart';
import '../StudyData/provider_data.dart';

class ColourCategoryTask extends StatefulWidget {
  final Function onNext;
  final CvdType cvdType;
  final Widget Function(BuildContext context, double constraints, Color color)
      technique;
  final int patternMethod;
  final int colourDiffCode;
  final String colourCategoryName;

  ColourCategoryTask({
    @required Key key,
    @required this.onNext,
    @required this.cvdType,
    @required this.technique,
    @required this.patternMethod,
    @required this.colourDiffCode,
    @required this.colourCategoryName,
  }) : super(key: key);

  _ColourCategoryTaskState createState() => _ColourCategoryTaskState();
}

class _ColourCategoryTaskState extends State<ColourCategoryTask> {
  bool skip = false;
  bool ineligible = false;
  String colourSet;
  int patternNum;
  Color categoryColour;
  Map<String, Color> colors;
  @override
  Widget build(BuildContext context) {
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
            //patternNum = widget.patternMethod;

            ///colours = This is where distinction colour model will go
          } else if (cvdString == "Deutan") {
            cvd = CvdType.deutan;
            colourSet = "Deutan";
            //patternNum = widget.patternMethod;
            //colours =
          } else if (cvdString == "Tritan") {
            cvd = CvdType.tritan;
            colourSet = "Tritan";
            //patternNum = widget.patternMethod;
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

          if (widget.colourCategoryName == "red") {
            categoryColour = Color(0xffa80018);
            colors = {
              "red": Color(0xffb80020),
              "orange": Color(0xfff08400),
              "yellow": Color(0xfff8e050),
              "green": Color(0xff588400),
              "blue": Color(0xff709cf8),
              "purple": Color(0xff885ca8),
              "pink": Color(0xfff86cb0),
              "brown": Color(0xff402810),
              "grey": Color(0xff787470),
              "black": Color(0xff080408)
            };
          } else if (widget.colourCategoryName == "orange") {
            categoryColour = Color(0xfff85c18);
            colors = {
              "red": Color(0xffc00000),
              "orange": Color(0xfff86000),
              "yellow": Color(0xfff8f078),
              "green": Color(0xff008800),
              "blue": Color(0xff0088c0),
              "purple": Color(0xff7850a0),
              "pink": Color(0xfff8a4b8),
              "brown": Color(0xff806428),
              "grey": Color(0xff787c78),
              "black": Color(0xff000808)
            };
          } else if (widget.colourCategoryName == "yellow") {
            categoryColour = Color(0xfff8d430);
            colors = {
              "red": Color(0xffa80018),
              "orange": Color(0xfff09030),
              "yellow": Color(0xfff0e458),
              "green": Color(0xff00dc00),
              "blue": Color(0xff0088f8),
              "purple": Color(0xff400048),
              "pink": Color(0xfff86498),
              "brown": Color(0xff886850),
              "grey": Color(0xff606060),
              "black": Color(0xff080808)
            };
          } else if (widget.colourCategoryName == "green") {
            categoryColour = Color(0xff588400);
            colors = {
              "red": Color(0xffc80828),
              "orange": Color(0xfff07818),
              "yellow": Color(0xfff8d418),
              "green": Color(0xff00dc00),
              "blue": Color(0xff100058),
              "purple": Color(0xff981c98),
              "pink": Color(0xfff8a0c8),
              "brown": Color(0xff704430),
              "grey": Color(0xff606060),
              "black": Color(0xff000808)
            };
          } else if (widget.colourCategoryName == "blue") {
            categoryColour = Color(0xff002c50);
            colors = {
              "red": Color(0xfff80c00),
              "orange": Color(0xfff88c38),
              "yellow": Color(0xfff8e050),
              "green": Color(0xff90c848),
              "blue": Color(0xff305cc0),
              "purple": Color(0xffa83cc0),
              'pink': Color(0xfff088a8),
              "brown": Color(0xff503800),
              "grey": Color(0xff808480),
              "black": Color(0xff000808)
            };
          } else if (widget.colourCategoryName == "purple") {
            categoryColour = Color(0xffa83cc0);
            colors = {
              "red": Color(0xffb01408),
              "orange": Color(0xfff85c18),
              "yellow": Color(0xffe8ec38),
              "green": Color(0xff48bc40),
              "blue": Color(0xffb8dcf8),
              "purple": Color(0xff7850a0),
              "pink": Color(0xfff860a8),
              "brown": Color(0xff604028),
              "grey": Color(0xff686c68),
              "black": Color(0xff000808)
            };
          } else if (widget.colourCategoryName == "pink") {
            categoryColour = Color(0xfff888c0);
            colors = {
              "red": Color(0xffb00800),
              "orange": Color(0xffe05400),
              "yellow": Color(0xfff8e050),
              "green": Color(0xff40a860),
              "blue": Color(0xff48b0e8),
              "purple": Color(0xffa020b0),
              "pink": Color(0xfff8a4b8),
              "brown": Color(0xff806428),
              "grey": Color(0xff707070),
              "black": Color(0xff000400)
            };
          } else if (widget.colourCategoryName == "brown") {
            categoryColour = Color(0xff805800);
            colors = {
              "red": Color(0xfff81030),
              "orange": Color(0xfff09030),
              "yellow": Color(0xfff0e430),
              "green": Color(0xff00dc00),
              "blue": Color(0xff6880f8),
              "purple": Color(0xffa834e0),
              "pink": Color(0xfff8a0c8),
              "brown": Color(0xff805800),
              "grey": Color(0xff707070),
              "black": Color(0xff080808)
            };
          }

          // var colourModel =
          //     ColourCategoryModel.generateColours(widget.colourCategoryName);
          // categoryColour = colourModel.categoryColor;
          // colors = colourModel.categoryColours;

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
              : ColourCategoryTask2(
                  key: widget.key,
                  onNext: widget.onNext,
                  technique: widget.technique,
                  cvdType: cvd,
                  patternMethod: widget.patternMethod,
                  colourDiffCode: widget.colourDiffCode,
                  colourCategoryName: widget.colourCategoryName,
                  colourCategory: categoryColour,
                  colourCategories: colors,
                );
        });
  }
}

class ColourCategoryTask2 extends StatefulWidget {
  final Function onNext;
  final CvdType cvdType;
  final Widget Function(BuildContext context, double constraints, Color color)
      technique;
  final int patternMethod;
  final int colourDiffCode;
  final String colourCategoryName;
  final Color colourCategory;
  final Map<String, Color> colourCategories;

  ColourCategoryTask2({
    @required Key key,
    @required this.onNext,
    @required this.cvdType,
    @required this.technique,
    @required this.patternMethod,
    @required this.colourDiffCode,
    @required this.colourCategoryName,
    @required this.colourCategory,
    @required this.colourCategories,
  }) : super(key: key);

  _ColourCategoryTaskState2 createState() => _ColourCategoryTaskState2();
}

class _ColourCategoryTaskState2 extends State<ColourCategoryTask2> {
  List<Color> colours = [];
  List<String> colourSwatchCategories = [
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
  Stopwatch myStopWatch;
  String targetColourName;
  int startTime;
  int endTime;
  Color targetColour;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime = DateTime.now().millisecondsSinceEpoch;

    //TODO: THIS IS WHERE YOU GET THE COLOUR SWATCH CATEGORIES AND THE TARGET COLOUR SWATCH COLOR
    targetColourName = "red";
    targetColour = widget.colourCategory;
    colourSwatchCategories.shuffle();

    myStopWatch = Stopwatch()..start();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double size;

    if (width < height) {
      size = width;
    } else {
      size = height;
    }

    AppBar appBar = AppBar(
      elevation: 0,
      centerTitle: true,
      title: FittedBox(
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectableText(
              // "Are there any ${taskColour}s present? (0 to ${widget.numTargetColours} possible)",
              "Please select the corresponding category that best matches this colour",
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
            SizedBox(width: 30),
            Container(
              //padding: EdgeInsets.all(10),
              height: 100,
              width: 100,
              color: (widget.cvdType != CvdType.normal)
                  ? targetColour
                  : Colors.transparent,
              child: (widget.cvdType != CvdType.normal)
                  ? Container()
                  : widget.technique(
                      context,
                      100,
                      targetColour,
                    ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );

    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: appBar,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final screenMin =
                      (constraints.maxHeight > constraints.maxWidth)
                          ? constraints.maxWidth
                          : constraints.maxHeight;
                  return Container(
                    height: screenMin,
                    width: screenMin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildColourCategoryRow(
                            colourSwatchCategories[0],
                            colourSwatchCategories[1],
                            colourSwatchCategories[2],
                            colourSwatchCategories[3],
                            colourSwatchCategories[4],
                            0,
                            width,
                            height,
                            colourSwatchCategories),
                        _buildColourCategoryRow(
                            colourSwatchCategories[5],
                            colourSwatchCategories[6],
                            colourSwatchCategories[7],
                            colourSwatchCategories[8],
                            colourSwatchCategories[9],
                            5,
                            width,
                            height,
                            colourSwatchCategories),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: RaisedButton(
            //     child: Text("Continue"),
            //     onPressed: () {

            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildColourCategoryRow(
      String termOne,
      String termTwo,
      String termThree,
      String termFour,
      String termFive,
      int index,
      var width,
      var height,
      List<String> colourSwatchCategories) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildColourCategory(
              termOne, index, width, height, colourSwatchCategories),
          _buildColourCategory(
              termTwo, index + 1, width, height, colourSwatchCategories),
          _buildColourCategory(
              termThree, index + 2, width, height, colourSwatchCategories),
          _buildColourCategory(
              termFour, index + 3, width, height, colourSwatchCategories),
          _buildColourCategory(
              termFive, index + 4, width, height, colourSwatchCategories),
        ],
      ),
    );
  }

  Widget _buildColourCategory(String term, int index, var width, var height,
      List<String> colourSwatchCategories) {
    //
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        final screenMin = (constraints.maxHeight > constraints.maxWidth)
            ? constraints.maxWidth
            : constraints.maxHeight;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: screenMin,
            width: screenMin,
            child: Container(
              color: (widget.cvdType != CvdType.normal)
                  ? widget.colourCategories[term]
                  : Colors.transparent,
              child: Center(
                child: Stack(
                  children: [
                    (widget.cvdType != CvdType.normal)
                        ? Container()
                        : widget.technique(
                            context,
                            screenMin,
                            widget.colourCategories[term],
                          ),
                    Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                DesignTheme.defaultRadiusVal),
                          ),
                          child: FittedBox(
                              child: Text(
                            "Category $index",
                            style: TextStyle(fontSize: 30),
                          )),
                          onPressed: () {
                            int correctIndex;
                            for (int i = 0;
                                i < colourSwatchCategories.length;
                                i++) {
                              if (colourSwatchCategories[i] ==
                                  widget.colourCategoryName) correctIndex = i;
                            }

                            ///DO STUFF HERE
                            var secs = myStopWatch.elapsed.inMilliseconds;
                            if (secs > 700) {
                              myStopWatch.stop();
                              endTime = DateTime.now().millisecondsSinceEpoch;
                              colourTaskData.addResultsColCatTask(
                                ColourCategoryTaskModel(
                                  technique: "TEMP_TECHNIQUE_ADJUST_LATER",
                                  isCorrect: widget.colourCategories[
                                          widget.colourCategoryName] ==
                                      widget.colourCategories[
                                          colourSwatchCategories[index]],
                                  categoryAnswer: "Category $correctIndex",
                                  categoryColourAnswer: widget.colourCategories[
                                          widget.colourCategoryName]
                                      .toString(),
                                  colourNameAnswer: widget.colourCategoryName,
                                  categoryColourGuessed: widget
                                      .colourCategories[
                                          colourSwatchCategories[index]]
                                      .toString(),
                                  categoryColours:
                                      widget.colourCategories.toString(),
                                  categoryGuessed: "Category $index",
                                  colourExample: targetColour.toString(),
                                  completionTime: myStopWatch.elapsed,
                                  startTime: startTime,
                                  endTime: endTime,
                                  screenHeight: height,
                                  screenWidth: width,
                                  colourDiffCode: widget.colourDiffCode,
                                  colourNameGuessed:
                                      colourSwatchCategories[index],
                                ),
                              );
                              widget.onNext();
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
