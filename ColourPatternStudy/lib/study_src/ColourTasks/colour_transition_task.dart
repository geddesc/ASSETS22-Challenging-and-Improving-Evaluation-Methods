import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/models/cvd_type.dart';
import 'package:observationStudyScaffold/pages/ineligible_page.dart';
import 'package:observationStudyScaffold/study_src/ColourGeneration/colour_transition_model.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_namer.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_transition_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColourTransitionTask extends StatefulWidget {
  final Function onNext;
  final CvdType cvdType;
  final Widget Function(BuildContext context, double constraints, Color color)
      technique;
  final bool isChroma;
  final int colourNumber; // change name later
  final int patternMethod;
  final int secondaryColourNumber;
  final bool addBlackBorder;
  final int colourDiffCode;
  final int treatment;

  ColourTransitionTask({
    @required Key key,
    @required this.onNext,
    @required this.cvdType,
    @required this.technique,
    @required this.isChroma,
    @required this.colourNumber,
    @required this.patternMethod,
    @required this.secondaryColourNumber,
    @required this.addBlackBorder,
    @required this.colourDiffCode,
    @required this.treatment,
  }) : super(key: key);

  @override
  _ColourTransitionTaskState createState() => _ColourTransitionTaskState();
}

class _ColourTransitionTaskState extends State<ColourTransitionTask> {
  List<Color> colourTransitionList = [];
  List<Color> goalColourList = [];
  List<Widget> colourTransitionRow = [];
  List<Color> startingList = [];
  Stopwatch myStopWatch;
  int currentIndex = 0;
  List<Color> colours;
  bool skip = false;
  bool ineligible = false;
  String colourSet;
  int patternNum;

  // List<Color> loadColours() {
  //   List<Color> colours = ColourTransitionModel(cvdType: cvdType, colourCode: colourCode, isChroma: isChroma, secondaryColourCode: secondaryColourCode);
  //   return colours;
  // }

  void _buildColourRow(List<Color> colours) {
    //List<Widget> colourTransitionSwatches = [];

    // List<Color> colours = loadColours();
    colours.forEach((colour) {
      goalColourList.add(colour);
    });
    colourTransitionList = colours;
    var subList = colours.sublist(1, colours.length - 1);
    subList.shuffle();

    int j = 0;

    for (int i = 0; i < colours.length; i++) {
      if (i >= 1 && i <= 8) {
        colours[i] = subList[j];
        colourTransitionList[i] = subList[j];
        j += 1;
      }
    }
    // for(int i = 0; i < colours.length; i++) {
    //   startingList[i] = colours[i];
    // }
    startingList = [...colourTransitionList];
  }

  @override
  void initState() {
    super.initState();
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.landscapeRight,
    //     DeviceOrientation.landscapeLeft,
    // ]);
    myStopWatch = Stopwatch()..start();
  }

//   @override
// dispose(){
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.landscapeRight,
//     DeviceOrientation.landscapeLeft,
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   super.dispose();
// }

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
            colours = ColourTransitionModel(
                    cvdType: CvdType.protan,
                    colourCode: widget.colourNumber,
                    isChroma: widget.isChroma,
                    secondaryColourCode: 2)
                .colourList;
          } else if (cvdString == "Deutan") {
            cvd = CvdType.deutan;
            colourSet = "Deutan";
            patternNum = widget.patternMethod;
            colours = ColourTransitionModel(
                    cvdType: CvdType.deutan,
                    colourCode: widget.colourNumber,
                    isChroma: widget.isChroma,
                    secondaryColourCode: 2)
                .colourList;
          } else if (cvdString == "Tritan") {
            cvd = CvdType.tritan;
            colourSet = "Tritan";
            patternNum = widget.patternMethod;
            colours = ColourTransitionModel(
                    cvdType: CvdType.tritan,
                    colourCode: widget.colourNumber,
                    isChroma: widget.isChroma,
                    secondaryColourCode: 2)
                .colourList;
          } else if (cvdString == "Monochromacy") {
            cvd = CvdType.monochromat;
            patternNum = widget.patternMethod;
            var rng = new Random();
            var randNum = rng.nextInt(3);
            if (widget.colourNumber == 0) {
              colourSet = "Protan";
              colours = ColourTransitionModel(
                      cvdType: CvdType.protan,
                      colourCode: randNum,
                      isChroma: widget.isChroma,
                      secondaryColourCode: 2)
                  .colourList;
            } else if (widget.colourNumber == 1) {
              colourSet = "Deutan";
              colours = ColourTransitionModel(
                      cvdType: CvdType.deutan,
                      colourCode: randNum,
                      isChroma: widget.isChroma,
                      secondaryColourCode: 2)
                  .colourList;
            } else if (widget.colourNumber == 2) {
              colourSet = "Tritan";
              colours = ColourTransitionModel(
                      cvdType: CvdType.tritan,
                      colourCode: randNum,
                      isChroma: widget.isChroma,
                      secondaryColourCode: 2)
                  .colourList;
            }
          } else if (cvdString == "None") {
            cvd = CvdType.normal;
          if(widget.treatment == 0) {
            colourSet = "Protan";
             colours = ColourTransitionModel(
                    cvdType: CvdType.protan,
                    colourCode: widget.colourNumber,
                    isChroma: widget.isChroma,
                    secondaryColourCode: 2)
                .colourList;
          } else if(widget.treatment == 1) {
            colourSet = "Deutan";
            colours = ColourTransitionModel(
                    cvdType: CvdType.deutan,
                    colourCode: widget.colourNumber,
                    isChroma: widget.isChroma,
                    secondaryColourCode: 2)
                .colourList;
          } else if(widget.treatment >= 2 && widget.treatment <= 4) {

            colourSet = "Protan";
             colours = ColourTransitionModel(
                    cvdType: CvdType.protan,
                    colourCode: widget.colourNumber,
                    isChroma: widget.isChroma,
                    secondaryColourCode: 2)
                .colourList;
          } else if(widget.treatment >= 5 && widget.treatment <= 7) {
            colourSet = "Deutan";
            colours = ColourTransitionModel(
                    cvdType: CvdType.deutan,
                    colourCode: widget.colourNumber,
                    isChroma: widget.isChroma,
                    secondaryColourCode: 2)
                .colourList;
          } else if(widget.treatment >= 8 && widget.treatment <= 10) {
            colourSet = "Protan";
             colours = ColourTransitionModel(
                    cvdType: CvdType.protan,
                    colourCode: widget.colourNumber,
                    isChroma: widget.isChroma,
                    secondaryColourCode: 2)
                .colourList;
          } else if(widget.treatment >= 11 && widget.treatment <= 13) {
            colourSet = "Deutan";
           colours = ColourTransitionModel(
                    cvdType: CvdType.deutan,
                    colourCode: widget.colourNumber,
                    isChroma: widget.isChroma,
                    secondaryColourCode: 2)
                .colourList;
          } else if(widget.treatment >= 14 && widget.treatment <= 16) {
            colourSet = "Protan";
             colours = ColourTransitionModel(
                    cvdType: CvdType.protan,
                    colourCode: widget.colourNumber,
                    isChroma: widget.isChroma,
                    secondaryColourCode: 2)
                .colourList;
          } else if(widget.treatment >= 17 && widget.treatment <= 19) {
            colourSet = "Deutan";
            colours = ColourTransitionModel(
                    cvdType: CvdType.deutan,
                    colourCode: widget.colourNumber,
                    isChroma: widget.isChroma,
                    secondaryColourCode: 2)
                .colourList;
          }
          }
          _buildColourRow(colours);

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
              : ColourTransitionTask2(
                  key: widget.key,
                  onNext: widget.onNext,
                  cvdType: cvd,
                  technique: widget.technique,
                  isChroma: widget.isChroma,
                  colourNumber: widget.colourNumber,
                  patternMethod: widget.patternMethod,
                  secondaryColourNumber: widget.secondaryColourNumber,
                  colour: colours,
                  colourTransitionList: colourTransitionList,
                  goalColourList: goalColourList,
                  colourSet: colourSet,
                  startingList: startingList,
                  addBlackBorder: widget.addBlackBorder,
                  colourDiffCode: widget.colourDiffCode,
                );
        });
  }
}

class ColourTransitionTask2 extends StatefulWidget {
  final Function onNext;
  final CvdType cvdType;
  final Widget Function(BuildContext context, double constraints, Color color)
      technique;
  final bool isChroma;
  final int colourNumber; // change name later
  final int patternMethod;
  final int secondaryColourNumber;
  final List<Color> colour;
  final List<Color> colourTransitionList;
  final List<Color> goalColourList;
  final String colourSet;
  final List<Color> startingList;
  final bool addBlackBorder;
  final int colourDiffCode;

  ColourTransitionTask2({
    @required Key key,
    @required this.onNext,
    @required this.cvdType,
    @required this.technique,
    @required this.isChroma,
    @required this.colourNumber,
    @required this.patternMethod,
    @required this.secondaryColourNumber,
    @required this.colour,
    @required this.colourTransitionList,
    @required this.goalColourList,
    @required this.colourSet,
    @required this.startingList,
    @required this.addBlackBorder,
    @required this.colourDiffCode,
  }) : super(key: key);

  @override
  _ColourTransitionTask2State createState() => _ColourTransitionTask2State();
}

class _ColourTransitionTask2State extends State<ColourTransitionTask2> {
  List<Widget> colourTransitionRow = [];
  Stopwatch myStopWatch;
  int currentIndex = 0;
  int startTime;
  int endTime;
  final keyIsFirstLoaded = 'is_first_loaded';

  // List<Color> loadColours() {
  //   List<Color> colours = ColourTransitionModel(
  //       cvdType: cvdType,
  //       colourCode: colourCode,
  //       isChroma: isChroma,
  //       secondaryColourCode: secondaryColourCode);
  //   return colours;
  // }

  // void _buildColourRow() {
  //   //List<Widget> colourTransitionSwatches = [];

  //   List<Color> colours = loadColours();
  //   colours.forEach((colour) {
  //     goalColourList.add(colour);
  //   });
  //   colourTransitionList = colours;
  //   var subList = colours.sublist(1, colours.length - 1);
  //   subList.shuffle();

  //   int j = 0;

  //   for (int i = 0; i < colours.length; i++) {
  //     if (i >= 1 && i <= 8) {
  //       colours[i] = subList[j];
  //       colourTransitionList[i] = subList[j];
  //       j += 1;
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // _buildColourRow();
    startTime = DateTime.now().millisecondsSinceEpoch;
    myStopWatch = Stopwatch()..start();
  }

  @override
  Widget build(BuildContext context) {
    //var colourTaskData = context.watch<ColourTaskData>();
    // var cvd = colourTaskData.preStudyData.cvdType;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if (width < height) {
      Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    }

    return Provider<ColourTaskData>(
        create: (context) => colourTaskData,
        builder: (context, child) {
          AppBar appBar = AppBar(
            elevation: 0,
            centerTitle: true,
            title: FittedBox(
              child: SelectableText(
                "Reorder the Colours between the fixed end points",
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

          return Scaffold(
            appBar: appBar,
            backgroundColor: Colors.grey[700],
            body: Container(
              width: double.infinity,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 10; i++)
                                Expanded(child: _buildTransitionRow(i))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: _buildCompleteButton(
                              colourTaskData, height, width),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        });
  }

  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Rotate to Lanscape"),
            content: Text(
                "This task is very difficult to complete on a mobile phone in portrait mode, please rotate to lanscape mode before attempting the task."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(DesignTheme.defaultRadiusVal),
                ),
                color: DesignTheme.primaryColor,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(DesignTheme.smallPadding),
                  child: FittedBox(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void saveStudyData(ColourTaskData colourTaskData, var height, var width) {
    myStopWatch..stop();
    endTime = DateTime.now().millisecondsSinceEpoch;
    int totalScore = 0;
    for (var i = 0; i < widget.goalColourList.length; i++) {
      var index = widget.colourTransitionList.indexOf(widget.goalColourList[i]);
      totalScore += (index - i).abs();
    }
    String patternTechnique = "None";
    if (widget.patternMethod == 0) {
      patternTechnique = "None";
    } else if (widget.patternMethod == 1) {
      patternTechnique = "ColourMix";
    } else if (widget.patternMethod == 2) {
      patternTechnique = "ColourIconizer";
    } else if (widget.patternMethod == 3) {
      patternTechnique = "ColourMeters";
    }
    String startName = ColourNamer(widget.goalColourList[0]).getName();
    String endName =
        ColourNamer(widget.goalColourList[widget.goalColourList.length - 1])
            .getName();

    colourTaskData.addResultsColTransitionTask(
      ColourTransitionTaskModel(
        startColor: startName,
        endColor: endName,
        completionTime: myStopWatch.elapsed,
        score: (totalScore / 2),
        size: "Large",
        technique: patternTechnique,
        colourSet: widget.colourSet,
        userSolvedTransitionList:
            widget.colourTransitionList.toString().replaceAll(",", ";"),
        goalList: widget.goalColourList.toString().replaceAll(",", ";"),
        startTime: startTime,
        endTime: endTime,
        generatedStartingList:
            widget.startingList.toString().replaceAll(",", ";"),
        screenHeight: height,
        screenWidth: width,
        colourDiffCode: widget.colourDiffCode,
      ),
    );
  }

  Widget _buildCompleteButton(var colourTaskData, var height, var width) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTheme.defaultRadiusVal),
      ),
      color: DesignTheme.primaryColor,
      onPressed: () {
        var secs = myStopWatch.elapsed.inMilliseconds;
        if (secs > 700) {
          saveStudyData(colourTaskData, height, width);
          widget.onNext();
        }
      },
      child: Padding(
        padding: EdgeInsets.all(DesignTheme.mediumPadding),
        child: FittedBox(
          child: Text(
            'Confirm Selection',
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

  void swapColourSwatches(int index) {
    if (index == 0 || index == 9) return;
    Color tempColour = widget.colourTransitionList[index];
    widget.colourTransitionList[index] =
        widget.colourTransitionList[currentIndex];
    widget.colourTransitionList[currentIndex] = tempColour;
    setState(() {});
  }

  Container _buildColourBox(int i, double squareSize) {
    return Container(
      height: squareSize,
      width: squareSize,
      decoration: BoxDecoration(
        border: Border.all(
          color: (i == 0 || i == 9) ? Colors.black : Colors.black,
          width: (i == 0 || i == 9) ? squareSize * 0.08 : squareSize * 0.1,
        ),
        color: (widget.cvdType != CvdType.normal)
            ? widget.colourTransitionList[i]
            : Colors.transparent,
      ),
      child: (widget.cvdType != CvdType.normal)
          ? Container()
          : widget.technique(
              context,
              squareSize,
              widget.colourTransitionList[i],
            ),
    );
    // if(widget.addBlackBorder) {

    // } else {
    //   return Container(
    //   height: squareSize,
    //   width: squareSize,
    //   decoration: BoxDecoration(
    //     // border: Border.all(
    //     //   color: (i == 0 || i == 9) ? Colors.black : Colors.black,
    //     //   width: (i == 0 || i == 9) ? squareSize * 0.08 : squareSize * 0.1 ,
    //     // ),
    //     color: widget.colourTransitionList[i],
    //   ),
    //   child: (widget.cvdType != CvdType.normal)
    //       ? Container()
    //       : widget.technique(
    //           context,
    //           squareSize,
    //           widget.colourTransitionList[i],
    //         ),
    // );
    //}
  }

  Widget _buildColourBoxNoBorder(int i, double squareSize) {
    return Container(
      height: squareSize,
      width: squareSize,
      decoration: BoxDecoration(
        border: Border.all(
            //color: (i == 0 || i == 9) ? Colors.black : Colors.black,
            //width: (i == 0 || i == 9) ? squareSize * 0.08 : squareSize * 0.1 ,
            ),
        color: widget.colourTransitionList[i],
      ),
      child: (widget.cvdType != CvdType.normal)
          ? Container()
          : widget.technique(
              context,
              squareSize,
              widget.colourTransitionList[i],
            ),
    );
  }

  Widget _buildTransitionRow(int i) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colourBoxMin = (constraints.maxHeight > constraints.maxWidth)
            ? constraints.maxWidth
            : constraints.maxHeight;

        return DragTarget(
          key: UniqueKey(),
          builder: (context, List<String> candidateData, rejectData) {
            if (i == 0 || i == 9) {
              return widget.addBlackBorder
                  ? _buildColourBox(i, colourBoxMin)
                  : _buildColourBoxNoBorder(i, colourBoxMin);
            }
            return Draggable(
              data: 'BLAH',
              child: widget.addBlackBorder
                  ? _buildColourBox(i, colourBoxMin)
                  : _buildColourBoxNoBorder(i, colourBoxMin),
              feedback: widget.addBlackBorder
                  ? _buildColourBox(i, colourBoxMin)
                  : _buildColourBoxNoBorder(i, colourBoxMin),
              onDragStarted: () {
                setState(() {
                  currentIndex = i;
                });
              },
              childWhenDragging: Container(
                height: colourBoxMin,
                width: colourBoxMin,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  color: Colors.white,
                ),
              ),
            );
          },
          onWillAccept: (data) {
            return true;
          },
          onAccept: (str) {
            if (str == 'BLAH') {
              setState(() {
                swapColourSwatches(i);
              });
            }
          },
        );
      },
    );
  }
}
