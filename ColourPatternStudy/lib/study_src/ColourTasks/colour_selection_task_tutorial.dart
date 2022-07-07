import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/models/colour_name.dart';
import 'package:observationStudyScaffold/models/cvd_type.dart';
import 'package:observationStudyScaffold/pages/ineligible_page.dart';
import 'package:observationStudyScaffold/study_src/ColourGeneration/colour_game.dart';
import 'package:observationStudyScaffold/study_src/ColourGeneration/colour_game_tutorial.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_selection_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/study_src/temp_colour_model.dart';
import 'package:observationStudyScaffold/study_src/tutorial_temp_colour_model.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColourSelectionTaskTutorial extends StatefulWidget {
  final int numberOfColours;
  final Function onNext;
  final CvdType typeOfCVD;
  final ColourName colourname;
  final int colourPairNumber;
  final Widget Function(BuildContext context, double constraints, Color color)
      technique;
  final int patternMethod;

  ColourSelectionTaskTutorial({
    @required Key key,
    @required this.numberOfColours,
    @required this.onNext,
    @required this.typeOfCVD,
    @required this.colourname,
    @required this.technique,
    @required this.colourPairNumber,
    @required
        this.patternMethod, // 0 None, 1 ColourMix, 2 ColourIconizer, 3 ColourMeters
  }) : super(key: key);

  @override
  _ColourSelectionTaskTutorialState createState() =>
      _ColourSelectionTaskTutorialState();
}

class _ColourSelectionTaskTutorialState
    extends State<ColourSelectionTaskTutorial> {
  ColourGameTutorial col;
  @override
  Widget build(BuildContext context) {
    //ColourTaskData colourTaskData = context.watch<ColourTaskData>();
    return Provider<ColourTaskData>(
        create: (context) => colourTaskData,
        builder: (context, child) {
          bool skip = false;
          bool ineligible = false;
          String cvdString = colourTaskData.preStudyData.cvdType;
          bool device = colourTaskData.preStudyData.deviceCode == 0;
          int ageGroup = colourTaskData.preStudyData.ageGroup;
          bool alreadyParticipated =
              colourTaskData.preStudyData.alreadyParticipated;
          if (ageGroup == 0 || alreadyParticipated) {
            ineligible = true;
          }
          int numTargetColours = 1;
          int numConfusionColours =
              ((widget.numberOfColours - numTargetColours) / 2).round();
          int numDistractorColours =
              widget.numberOfColours - numConfusionColours;
          if (ageGroup == 0 || alreadyParticipated) {
            ineligible = true;
          }
          CvdType cvd;
          if (cvdString == "Protan") {
            cvd = CvdType.protan;
          } else if (cvdString == "Deutan") {
            cvd = CvdType.deutan;
          } else if (cvdString == "Tritan") {
            cvd = CvdType.tritan;
          } else if (cvdString == "None") {
            cvd = CvdType.normal;
          } else if (cvdString == "Monochromacy") {
            cvd = CvdType.monochromat;
          }
          if (cvd == CvdType.protan) {
            col = ColourGameTutorial.protan(
              numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              1,
            );
          } else if (cvd == CvdType.deutan) {
            col = ColourGameTutorial.deutan(
              numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              1,
            );
          } else if (cvd == CvdType.tritan) {
            col = ColourGameTutorial.tritan(
              numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              1,
            );
          } else if (cvd == CvdType.normal) {
            skip = true;
          } else if (cvd == CvdType.monochromat) {
            // var rng = new Random();
            // var randNum = rng.nextInt(3);
            // if (widget.colourPairNumber == 0) {
            col = ColourGameTutorial.protan(
              numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              1,
            );
            // } else if (widget.colourPairNumber == 1) {
            //   col = ColourGameTutorial.deutan(
            //     numTargetColours,
            //     numConfusionColours,
            //     numDistractorColours,
            //     randNum,
            //     widget.numberOfColours,
            //     1,
            //   );
            // } else if (widget.colourPairNumber == 2) {
            //   col = ColourGameTutorial.tritan(
            //     numTargetColours,
            //     numConfusionColours,
            //     numDistractorColours,
            //     randNum,
            //     widget.numberOfColours,
            //     1,
            //   );
            // }
          }

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

          return (ineligible || skip)
              ? Container()
              : ColourSelectionTaskTutorial2(
                  key: widget.key,
                  numberOfColours: widget.numberOfColours,
                  onNext: widget.onNext,
                  typeOfCVD: widget.typeOfCVD,
                  colourname: widget.colourname,
                  technique: widget.technique,
                  patternMethod: widget.patternMethod,
                  col: col,
                  isMobile: device,
                );
        });
  }
}

class ColourSelectionTaskTutorial2 extends StatefulWidget {
  final int numberOfColours;
  final Function onNext;
  final CvdType typeOfCVD;
  final ColourName colourname;
  final Widget Function(BuildContext context, double constraints, Color color)
      technique;
  final int patternMethod;
  final ColourGameTutorial col;
  final bool isMobile;

  ColourSelectionTaskTutorial2({
    @required Key key,
    @required this.numberOfColours,
    @required this.onNext,
    @required this.typeOfCVD,
    @required this.colourname,
    @required this.technique,
    @required this.col,
    @required this.patternMethod,
    @required
        this.isMobile, // 0 None, 1 ColourMix, 2 ColourIconizer, 3 ColourMeters
  }) : super(key: key);

  @override
  _ColourSelectionTaskTutorialState2 createState() =>
      _ColourSelectionTaskTutorialState2();
}

class _ColourSelectionTaskTutorialState2
    extends State<ColourSelectionTaskTutorial2> {
  int rows;
  int columns;
  String taskColour;
  List<Color> colours = [];
  List<bool> isSelected = [];
  Stopwatch myStopWatch;
  int numTargetColours;
  final keyIsFirstLoaded = 'is_first_loaded';
  //TutorialTempColourModel col;

  @override
  void initState() {
    super.initState();

    // if (widget.numberOfColours <= 4) {
    //   numTargetColours = 1;
    // } else if (widget.numberOfColours <= 20) {
    //   numTargetColours = 2;
    // } else if (widget.numberOfColours <= 100) {
    //   numTargetColours = 3;
    // } else if (widget.numberOfColours <= 500) {
    //   numTargetColours = 4;
    // } else {
    //   numTargetColours = 5;
    // }

    // int numConfusionColours =
    //     ((widget.numberOfColours - numTargetColours) / 2).round();
    // int numDistractorColours =
    //     widget.numberOfColours - (numConfusionColours + numTargetColours);

    // if (widget.typeOfCVD == CvdType.protan) {
    //   col = TutorialTempColourModel.protan(
    //     maxTargetColours: numTargetColours,
    //     maxDistractorColours: numDistractorColours,
    //     maxConfusionColours: numConfusionColours,
    //     colourname: widget.colourname,
    //   );
    // } else {
    //   col = TutorialTempColourModel.deutan(
    //     maxTargetColours: numTargetColours,
    //     maxDistractorColours: numDistractorColours,
    //     maxConfusionColours: numConfusionColours,
    //     colourname: widget.colourname,
    //   );
    // }

    taskColour = widget.col.targetColourName;
    colours = widget.col.generatedColours;

    for (int i = 0; i < widget.numberOfColours; i++) {
      isSelected.add(false);
    }
    myStopWatch = Stopwatch()..start();
  }

  @override
  Widget build(BuildContext context) {
    //ColourTaskData colourTaskData = context.watch<ColourTaskData>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if ((height < 500 || widget.isMobile) && height < width) {
      Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    }
    return Provider<ColourTaskData>(
        create: (context) => colourTaskData,
        builder: (context, child) {
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;
          double boxSize = 0.0;
          if (height > width) {
            boxSize = width / 15;
          } else {
            boxSize = height / 15;
          }

          AppBar appBar = AppBar(
            elevation: 0,
            centerTitle: true,
            title: FittedBox(
              child: Text(
                "Tutorial: Find the $taskColour using the legend below ",
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

          // rows = sqrt(widget.numberOfColours).toInt();
          // columns = (widget.numberOfColours / rows.toDouble()).ceil();

          Map<String, Color> tutorialColors = {
            'red': Colors.red,
            'orange': Colors.orange,
            'yellow': Color(0xfffff500),
            'green': Colors.green,
            'teal': Colors.teal,
            'blue': Colors.blue,
            'purple': Colors.purple[300],
            'pink': Colors.pink[200],
            'brown': Color(0xffbe9672),
            'grey': Colors.grey,
          };

          return Scaffold(
            appBar: appBar,
            backgroundColor: Colors.grey[700],
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                          child: Text("${taskColour}s symbol is: ",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ))),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          color: widget.col.targetColor,
                        ),
                        height: boxSize,
                        width: boxSize,
                        child: widget.technique(
                          context,
                          boxSize,
                          //tutorialColors[taskColour],
                          widget.col.targetColor,
                          //widget.colours[index],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _buildColourGrid(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _buildCompleteButton(colourTaskData),
                ),
              ],
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
            title: Text("Rotate to Portrait"),
            content:  Text(
                "This task is very difficult to complete on a mobile phone in lanscape mode, please rotate to portrait mode before attempting the task."),
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

  double saveStudyData(var colourTaskData) {
    myStopWatch.stop();
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

    int numCorrect = 0;
    int numIncorrect = 0;

    for (var i = 0; i < isSelected.length; i++) {
      if (isSelected[i]) {
        if (widget.col.indexesOfTarget.contains(i))
          numCorrect += 1;
        else
          numIncorrect += 1;
      } else {
        if (widget.col.indexesOfTarget.contains(i)) numIncorrect += 1;
      }
    }

    int numSelected = 0;
    isSelected.forEach((element) {
      if (element) numSelected++;
    });

    double accuracy = 0.0;
    if (widget.col.numTargetColours == 0) {
      if (numIncorrect == 0) {
        accuracy = 1.0;
      } else {
        accuracy = 0.0;
      }
    } else {
      accuracy = numCorrect / widget.col.numTargetColours;
    }
    return accuracy;
    // colourTaskData.addResultsColSelectionTask(ColourSelectionTaskModel(
    //   technique: patternTechnique,
    //   accuracy: accuracy,
    //   completionTime: myStopWatch.elapsed,
    //   numSelected: numSelected,
    //   numSwatches: widget.numberOfColours,
    //   numTargetColours: col.numTargetColours,
    //   targetColour: col.targetColourName,
    //   //numConfusionColours: col.maxConfusionColours, //GIVES INCORRECT VALUE CURRENTLY
    //   numConfusionColours: (widget.numberOfColours -
    //       col.maxDistractorColours -
    //       col.numTargetColours),
    //   numDistractorColours: col.maxDistractorColours,
    // ));
  }

  Widget _buildCompleteButton(var colourTaskData) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTheme.defaultRadiusVal),
      ),
      color: DesignTheme.primaryColor,
      onPressed: () {
        var acc = saveStudyData(colourTaskData);
        if (acc == 1.0) {
          widget.onNext();
        } else {
          for (var i = 0; i < isSelected.length; i++) {
            setState(() => isSelected[i] = false);
          }
          showDialog(
              context: context,
              builder: (context) {
                Map<String, Color> tutorialColors = {
                  'red': Colors.red,
                  'orange': Colors.orange,
                  'yellow': Color(0xfffff500),
                  'green': Colors.green,
                  'teal': Colors.teal,
                  'blue': Colors.blue,
                  'purple': Colors.purple[300],
                  'pink': Colors.pink[200],
                  'brown': Color(0xffbe9672),
                  'grey': Colors.grey,
                };

                return AlertDialog(
                  title: Text(
                    'Incorrect: Here are some hints',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  content: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 300,
                      minWidth: 300,
                      maxWidth: 500,
                      minHeight: 300,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            children: [
                              TextSpan(text: 'This is the '),
                              TextSpan(
                                  text: 'tutorial ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: 'and here there will only be '),
                              TextSpan(
                                  text: 'one ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: 'box you need to select.'),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            children: [
                              TextSpan(text: 'You are looking for '),
                              TextSpan(
                                  text: '$taskColour ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      'and the corresponding pattern for $taskColour is shown below: '),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            color: widget.col.targetColor,
                          ),
                          height: 50,
                          width: 50,
                          child: widget.technique(
                            context,
                            50 * 0.9,
                            //tutorialColors[taskColour],
                            widget.col.targetColor,
                            //widget.colours[index],
                          ),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                DesignTheme.defaultRadiusVal),
                          ),
                          color: DesignTheme.primaryColor,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(DesignTheme.smallPadding),
                            child: FittedBox(
                              child: Text(
                                'Got it!',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(DesignTheme.mediumPadding),
        child: FittedBox(
          child: Text(
            'Confirm Selection',
            style: TextStyle(
              color: Colors.white,
              fontSize: DesignTheme.titleFontSize,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColourGrid() {
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
                                    return ColourSelectionSwatch(
                                      technique: widget.technique,
                                      totalNumberOfColours:
                                          widget.numberOfColours,
                                      numOfRows: rows,
                                      colours: colours,
                                      isSelected: isSelected,
                                      i: i,
                                      j: j,
                                      size: min,
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

class ColourSelectionSwatch extends StatefulWidget {
  final Widget Function(BuildContext context, double size, Color color)
      technique;
  final int totalNumberOfColours;
  final int numOfRows;
  final List<Color> colours;
  final List<bool> isSelected;
  final int i;
  final int j;
  final double size;

  ColourSelectionSwatch({
    @required this.technique,
    @required this.totalNumberOfColours,
    @required this.numOfRows,
    @required this.colours,
    @required this.isSelected,
    @required this.i,
    @required this.j,
    @required this.size,
  });

  @override
  _ColourSelectionSwatchState createState() => _ColourSelectionSwatchState();
}

class _ColourSelectionSwatchState extends State<ColourSelectionSwatch> {
  void selectColour(int index) {
    setState(() {
      widget.isSelected[index] = !widget.isSelected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.j + (widget.i * widget.numOfRows);
    double borderWidth = 5;

    BoxBorder unselected = Border.all(
      color: Colors.transparent,
    );
    BoxBorder selected = Border.all(color: Colors.black, width: borderWidth);

    return Container(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          if (widget.isSelected[index]) {
            //print(widget.colours[index]);
            selectColour(index);
          } else {
            int totalTrue = 0;
            widget.isSelected.forEach((element) {
              if (element) totalTrue++;
            });
            if (totalTrue == 0) {
              selectColour(index);
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: (widget.isSelected[index]) ? selected : unselected,
                color: widget.colours[index],
              ),
              height: widget.size,
              width: widget.size,
              child: widget.technique(
                context,
                widget.size,
                widget.colours[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
