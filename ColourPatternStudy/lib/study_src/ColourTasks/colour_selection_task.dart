import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/models/cvd_type.dart';
import 'package:observationStudyScaffold/pages/ineligible_page.dart';
import 'package:observationStudyScaffold/study_src/ColourGeneration/colour_game.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_selection_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColourSelectionTask extends StatefulWidget {
  final int numberOfColours;
  final Function onNext;
  final CvdType typeOfCVD;
  final Widget Function(BuildContext context, double constraints, Color color)
      technique;
  final int patternMethod;
  final int colourPairNumber;
  final int numTargetColours;
  final int colourDiffCode;
  final int treatment;

  ColourSelectionTask(
      {@required
          Key key,
      @required
          this.numberOfColours,
      @required
          this.onNext,
      @required
          this.typeOfCVD,
      @required
          this.technique,
      @required
          this.patternMethod,
      @required
          this.numTargetColours,
      @required
          this.colourPairNumber, // 0 None, 1 ColourMix, 2 ColourIconizer, 3 ColourMeters
      @required
          this.colourDiffCode,
      @required this.treatment, // 0 for easy // 1 for hard
      })
      : super(key: key);

  @override
  _ColourSelectionTaskState createState() => _ColourSelectionTaskState();
}

class _ColourSelectionTaskState extends State<ColourSelectionTask> {
  ColourGame col;

  int maxNumTargetColours;

  Widget build(BuildContext context) {
    //ColourTaskData colourTaskData = context.watch<ColourTaskData>();
    return Provider<ColourTaskData>(
      create: (context) => colourTaskData,
      builder: (context, child) {
        bool skip = false;
        bool ineligible = false;
        String cvdString = colourTaskData.preStudyData.cvdType;
        int ageGroup = colourTaskData.preStudyData.ageGroup;
        var device = colourTaskData.preStudyData.deviceCode == 0;
        bool alreadyParticipated =
            colourTaskData.preStudyData.alreadyParticipated;
        int patternNum;

        //print("Colour Selection Task number of target colours = ${widget.numTargetColours}");

        int numConfusionColours =
            ((widget.numberOfColours - widget.numTargetColours) / 2).round();
        int numDistractorColours = widget.numberOfColours - numConfusionColours;
        if (ageGroup == 0 || alreadyParticipated) {
          ineligible = true;
        }
        CvdType cvd;
        String colourSet;
        if (cvdString == "Protan") {
          patternNum = widget.patternMethod;
          cvd = CvdType.protan;
        } else if (cvdString == "Deutan") {
          patternNum = widget.patternMethod;
          cvd = CvdType.deutan;
        } else if (cvdString == "Tritan") {
          patternNum = widget.patternMethod;
          cvd = CvdType.tritan;
        } else if (cvdString == "None") {
          patternNum = 0;
          cvd = CvdType.normal;
        } else if (cvdString == "Monochromacy") {
          patternNum = widget.patternMethod;
          cvd = CvdType.monochromat;
        }

        if (cvd == CvdType.protan) {
          colourSet = "Protan";
          col = ColourGame.protan(
            widget.numTargetColours,
            numConfusionColours,
            numDistractorColours,
            widget.colourPairNumber,
            widget.numberOfColours,
            widget.numTargetColours,
          );
        } else if (cvd == CvdType.deutan) {
          colourSet = "Deutan";
          col = ColourGame.deutan(
            widget.numTargetColours,
            numConfusionColours,
            numDistractorColours,
            widget.colourPairNumber,
            widget.numberOfColours,
            widget.numTargetColours,
          );
        } else if (cvd == CvdType.tritan) {
          colourSet = "Tritan";
          col = ColourGame.tritan(
            widget.numTargetColours,
            numConfusionColours,
            numDistractorColours,
            widget.colourPairNumber,
            widget.numberOfColours,
            widget.numTargetColours,
          );
        } else if (cvd == CvdType.normal) {

          if(widget.treatment == 0) {
            colourSet = "Protan";
            col = ColourGame.protan(
              widget.numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              widget.numTargetColours,
            );
          } else if(widget.treatment == 1) {
            colourSet = "Deutan";
            col = ColourGame.deutan(
              widget.numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              widget.numTargetColours,
            );
          } else if(widget.treatment >= 2 && widget.treatment <= 4) {

            colourSet = "Protan";
            col = ColourGame.protan(
              widget.numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              widget.numTargetColours,
            );
          } else if(widget.treatment >= 5 && widget.treatment <= 7) {
            colourSet = "Deutan";
            col = ColourGame.deutan(
              widget.numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              widget.numTargetColours,
            );
          } else if(widget.treatment >= 8 && widget.treatment <= 10) {
            colourSet = "Protan";
            col = ColourGame.protan(
              widget.numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              widget.numTargetColours,
            );
          } else if(widget.treatment >= 11 && widget.treatment <= 13) {
            colourSet = "Deutan";
            col = ColourGame.deutan(
              widget.numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              widget.numTargetColours,
            );
          } else if(widget.treatment >= 14 && widget.treatment <= 16) {
            colourSet = "Protan";
            col = ColourGame.protan(
              widget.numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              widget.numTargetColours,
            );
          } else if(widget.treatment >= 17 && widget.treatment <= 19) {
            colourSet = "Deutan";
            col = ColourGame.deutan(
              widget.numTargetColours,
              numConfusionColours,
              numDistractorColours,
              widget.colourPairNumber,
              widget.numberOfColours,
              widget.numTargetColours,
            );
          }

          // if (widget.patternMethod == 0) {
          //   colourSet = "Protan";
          //   col = ColourGame.protan(
          //     widget.numTargetColours,
          //     numConfusionColours,
          //     numDistractorColours,
          //     widget.colourPairNumber,
          //     widget.numberOfColours,
          //     widget.numTargetColours,
          //   );
          // } else if (widget.patternMethod == 1) {
          //   colourSet = "Deutan";
          //   col = ColourGame.deutan(
          //     widget.numTargetColours,
          //     numConfusionColours,
          //     numDistractorColours,
          //     widget.colourPairNumber,
          //     widget.numberOfColours,
          //     widget.numTargetColours,
          //   );
          // } else if (widget.patternMethod == 2) {
          //   colourSet = "Tritan";
          //   col = ColourGame.tritan(
          //     widget.numTargetColours,
          //     numConfusionColours,
          //     numDistractorColours,
          //     widget.colourPairNumber,
          //     widget.numberOfColours,
          //     widget.numTargetColours,
          //   );
          // } else {
          //   skip = true;
          //   colourSet = "Protan";
          //   col = ColourGame.protan(
          //     widget.numTargetColours,
          //     numConfusionColours,
          //     numDistractorColours,
          //     widget.colourPairNumber,
          //     widget.numberOfColours,
          //     widget.numTargetColours,
          //   );
          // }
        } else if (cvd == CvdType.monochromat) {
          var rng = new Random();
          var randNum = rng.nextInt(3);
          if (widget.colourPairNumber == 0) {
            colourSet = "Protan";
            col = ColourGame.protan(
              widget.numTargetColours,
              numConfusionColours,
              numDistractorColours,
              randNum,
              widget.numberOfColours,
              widget.numTargetColours,
            );
          } else if (widget.colourPairNumber == 1) {
            colourSet = "Deutan";
            col = ColourGame.deutan(
              widget.numTargetColours,
              numConfusionColours,
              numDistractorColours,
              randNum,
              widget.numberOfColours,
              widget.numTargetColours,
            );
          } else if (widget.colourPairNumber == 2) {
            colourSet = "Tritan";
            col = ColourGame.tritan(
              widget.numTargetColours,
              numConfusionColours,
              numDistractorColours,
              randNum,
              widget.numberOfColours,
              widget.numTargetColours,
            );
          }
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
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => IneligiblePage()));
          });
        }
        return (ineligible || skip)
            ? Container()
            : ColourSelectionTask2(
                key: widget.key,
                numberOfColours: widget.numberOfColours,
                onNext: widget.onNext,
                typeOfCVD: cvd,
                technique: widget.technique,
                patternMethod: widget.patternMethod,
                colourPairNumber: widget.colourPairNumber,
                numTargetColours: widget.numTargetColours,
                col: col,
                cvdType: cvdString,
                colourSet: colourSet,
                isMobile: device,
                colourDiffCode: widget.colourDiffCode,
              );
      },
    );
  }
}

class ColourSelectionTask2 extends StatefulWidget {
  final int numberOfColours;
  final Function onNext;
  final CvdType typeOfCVD;
  final Widget Function(BuildContext context, double constraints, Color color)
      technique;
  final int patternMethod;
  final int colourPairNumber;
  final ColourGame col;
  final int numTargetColours;
  final String cvdType;
  final String colourSet;
  final bool isMobile;
  final int colourDiffCode;

  ColourSelectionTask2({
    @required Key key,
    @required this.numberOfColours,
    @required this.onNext,
    @required this.typeOfCVD,
    @required this.technique,
    @required this.patternMethod,
    @required this.col,
    @required this.numTargetColours,
    @required this.cvdType,
    @required this.colourSet,
    @required this.colourPairNumber,
    @required
        this.isMobile, // 0 None, 1 ColourMix, 2 ColourIconizer, 3 ColourMeters
    @required this.colourDiffCode,
  }) : super(key: key);

  @override
  _ColourSelectionTaskState2 createState() => _ColourSelectionTaskState2();
}

class _ColourSelectionTaskState2 extends State<ColourSelectionTask2> {
  int rows;
  int columns;
  String taskColour;
  List<Color> colours = [];
  List<bool> isSelected = [];
  Stopwatch myStopWatch;
  int startTime;
  int endTime;
  final keyIsFirstLoaded = 'is_first_loaded';
  int maxNumTargetColours;
  //TempColourModel col;
  //ColourGame col;

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now().millisecondsSinceEpoch;
    // if (widget.typeOfCVD == CvdType.protan) {
    //   col = ColourGame.protan(numTargetColours, numConfusionColours, numDistractorColours, widget.colourPairNumber, widget.numberOfColours);
    // } else if (widget.typeOfCVD == CvdType.deutan) {
    //   col = ColourGame.deutan(numTargetColours, numConfusionColours, numDistractorColours, widget.colourPairNumber, widget.numberOfColours);
    // } else if (widget.typeOfCVD == CvdType.tritan) {
    //   col = ColourGame.tritan(numTargetColours, numConfusionColours, numDistractorColours, widget.colourPairNumber, widget.numberOfColours);
    // }
    // taskColour = col.targetColourName;
    // colours = col.generatedColours;
    // for (int i = 0; i < widget.numberOfColours; i++) {
    //   isSelected.add(false);
    // }

    if (widget.numberOfColours <= 4) {
      maxNumTargetColours = 1;
    } else if (widget.numberOfColours <= 20) {
      maxNumTargetColours = 2;
    } else if (widget.numberOfColours <= 100) {
      maxNumTargetColours = 3;
    } else if (widget.numberOfColours <= 500) {
      maxNumTargetColours = 4;
    } else {
      maxNumTargetColours = 5;
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
          taskColour = widget.col.targetColourName;
          //taskColour = 'yellow'; // used for images in paper
          colours = widget.col.generatedColours;
          //used for images in paper
          // if(widget.numberOfColours == 20) {
          //   colours = [
          //     Color(0xffe1b1b9),
          //     Color(0xff39fc39),
          //     Color(0xff3f3fea),
          //     Color(0xff51ff51),
          //     Color(0xfff8f842),
          //     Color(0xff39fc39),
          //     Color(0xffb2b2b2),
          //     Color(0xff51ff51),
          //     Color(0xff972be1),
          //     Color(0xff39fc39),
          //     Color(0xff46ff46),
          //     Color(0xff51ff51),
          //     Color(0xff3f3fea),
          //     Color(0xff5cff5c),
          //     Color(0xff65ff65),
          //     Color(0xff4848ed),
          //     Color(0xff5cff5c),
          //     Color(0xff3f3fea),
          //     Color(0xffe1b1b9),
          //     Color(0xff8700d5),
          //   ];
          // }
          for (int i = 0; i < widget.numberOfColours; i++) {
            isSelected.add(false);
          }

          AppBar appBar = AppBar(
            elevation: 0,
            centerTitle: true,
            title: FittedBox(
              child: SelectableText(
                // "Are there any ${taskColour}s present? (0 to ${widget.numTargetColours} possible)",
                "Please select any $taskColour squares from the grid below (0 to $maxNumTargetColours possible)",
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

          //rows = sqrt(widget.numberOfColours).toInt();
          //columns = (widget.numberOfColours / rows.toDouble()).ceil();

          return Scaffold(
            backgroundColor: Colors.grey[700],
            appBar: appBar,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: _buildColourGrid(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _buildCompleteButton(colourTaskData, height, width),
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
            content: Text(
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

  void saveStudyData(var colourTaskData, var height, var width) {
    myStopWatch.stop();
    endTime = DateTime.now().millisecondsSinceEpoch;
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

    List<Color> selectedColoursCorrect = [];
    List<Color> selectedColoursWrong = [];
    List<Color> missedColours = [];

    for (var i = 0; i < isSelected.length; i++) {
      if (isSelected[i]) {
        if (widget.col.indexesOfTarget.contains(i)) {
          selectedColoursCorrect.add(widget.col.colourSet[i]);
          numCorrect += 1;
        } else {
          selectedColoursWrong.add(widget.col.colourSet[i]);
          numIncorrect += 1;
        }
      } else {
        if (widget.col.indexesOfTarget.contains(i)) {
          missedColours.add(widget.col.colourSet[i]);
          numIncorrect += 1;
        }
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
      if (numSelected > widget.col.numTargetColours) {
        accuracy = numCorrect / numSelected;
      } else {
        accuracy = numCorrect / widget.col.numTargetColours;
      }
    }
    colourTaskData.addResultsColSelectionTask(ColourSelectionTaskModel(
      technique: patternTechnique,
      accuracy: accuracy,
      completionTime: myStopWatch.elapsed,
      numSelected: numSelected,
      numSwatches: widget.numberOfColours,
      numTargetColours: widget.col.numTargetColours,
      targetColour: widget.col.targetColourName,
      colourSet: widget.colourSet,
      selectedColoursCorrect:
          selectedColoursCorrect.toString().replaceAll(",", ";"),
      selectedColoursWrong:
          selectedColoursWrong.toString().replaceAll(",", ";"),
      missedColours: missedColours.toString().replaceAll(",", ";"),
      confusionColours:
          widget.col.confusionColourList.toString().replaceAll(",", ";"),
      distractorColours:
          widget.col.distactorColourList.toString().replaceAll(",", ";"),
      targetColours:
          widget.col.targetColourList.toString().replaceAll(",", ";"),
      numConfusionColours: (widget.numberOfColours -
          widget.col.maxDistractorColours -
          widget.col.numTargetColours),
      numDistractorColours: widget.col.maxDistractorColours,
      startTime: startTime,
      endTime: endTime,
      screenHeight: height,
      screenWidth: width,
      colourDiffCode: widget.colourDiffCode,
    ));
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
                                      cvdType: widget.cvdType,
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
  final String cvdType;

  ColourSelectionSwatch({
    @required this.technique,
    @required this.totalNumberOfColours,
    @required this.numOfRows,
    @required this.colours,
    @required this.isSelected,
    @required this.i,
    @required this.j,
    @required this.size,
    @required this.cvdType,
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
    // double borderWidth = 5;

    // BoxBorder unselected = Border.all(
    //   color: Colors.transparent,
    // );
    // BoxBorder selected = Border.all(color: Colors.black, width: borderWidth);

    return Container(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          //print(widget.colours[index]);
          selectColour(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //   //border: (widget.isSelected[index]) ? selected : unselected,
                  //   color: widget.colours[index],
                  // ),
                  color: (widget.cvdType != "None")
                      ? widget.colours[index]
                      : Colors.transparent,
                  height: widget.size,
                  width: widget.size,
                  child: (widget.cvdType != "None")
                      ? Container()
                      : widget.technique(
                          context,
                          widget.size,
                          widget.colours[index],
                        ),
                ),
                widget.isSelected[index]
                    ? Icon(
                        Icons.check_circle,
                        size: widget.size * 0.4,
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
