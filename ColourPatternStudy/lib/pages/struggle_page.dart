import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/pages/ineligible_page.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/struggle_feedback_model.dart';
import 'package:provider/provider.dart';
import 'package:observationStudyScaffold/components/approve_button.dart';
import 'package:observationStudyScaffold/components/study_subtitle.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';

class StrugglePage extends StatefulWidget {
  final Function onNext;
  final int
      technique; // 0 is no technique, 1 is mix, 2 is iconizer, and 3 is meters
  final int taskId; // 0 is selection, 1 is transition, and 2 is sorting
  StrugglePage({
    @required this.onNext,
    @required this.technique,
    @required this.taskId,
  });

  @override
  _StrugglePageState createState() => _StrugglePageState();
}

class _StrugglePageState extends State<StrugglePage> {
  @override
  Widget build(BuildContext context) {
    //ColourTaskData colourTaskData = context.watch<ColourTaskData>();
    return Provider<ColourTaskData>(
        create: (context) => colourTaskData,
        builder: (context, child) {
          bool skip = false;
          bool ineligible = false;
          String cvdString = colourTaskData.preStudyData.cvdType;
          int ageGroup = colourTaskData.preStudyData.ageGroup;
          bool alreadyParticipated =
              colourTaskData.preStudyData.alreadyParticipated;

          if (ageGroup == 0 || alreadyParticipated) {
            ineligible = true;
          }
          // if (cvdString == "None") {
          //   skip = true;
          // }
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
              : StrugglePage2(
                  onNext: widget.onNext,
                  technique: widget.technique,
                  taskId: widget.taskId);
        });
  }
}

class StrugglePage2 extends StatefulWidget {
  final Function onNext;
  final int
      technique; // 0 is no technique, 1 is mix, 2 is iconizer, and 3 is meters
  final int taskId; // 0 is selection, 1 is transition, and 2 is sorting
  StrugglePage2({
    @required this.onNext,
    @required this.technique,
    @required this.taskId,
  });

  @override
  _StrugglePageState2 createState() => _StrugglePageState2();
}

class _StrugglePageState2 extends State<StrugglePage2> {
  bool _checkBoxValue = false;

  String pattern;
  String task;
  int participation = -1;

  final struggleTextController = TextEditingController();

  @override
  void dispose() {
    struggleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var colourTaskData = context.watch<ColourTaskData>();
    return Provider<ColourTaskData>(
        create: (context) => colourTaskData,
        builder: (context, child) {
          if (widget.technique == 0) {
            pattern = "None";
          } else if (widget.technique == 1) {
            pattern = "Mix";
          } else if (widget.technique == 2) {
            pattern = "Iconizer";
          } else {
            pattern = "Meters";
          }

          if (widget.taskId == 0) {
            task = "Colour Selection Task";
          } else if (widget.taskId == 1) {
            task = "Colour Transition Task";
          } else if(widget.taskId == 2) {
            task = "Colour Sorting Task";
          } else if(widget.taskId == 2) {
            task = "Colour Distinction Task";
          } else {
            task = "Colour Category Task";
          }

          // AppBar appBar = AppBar(
          //   elevation: 0,
          //   title: FittedBox(
          //     child: Text(
          //       "$pattern after $task",
          //       style: TextStyle(
          //         color: Colors.black,
          //         fontSize: DesignTheme.headerFontSize,
          //       ),
          //     ),
          //   ),
          //   backgroundColor: Colors.transparent,
          // );
          return Scaffold(
            //appBar: appBar,
            backgroundColor: Colors.grey[700],
            body: Center(
              child: LayoutBuilder(
                builder: (screenContext, screenConstraints) {
                  var screenMin =
                      (screenConstraints.maxHeight > screenConstraints.maxWidth)
                          ? screenConstraints.maxWidth / 2
                          : screenConstraints.maxHeight / 2;
                  if (screenMin < 400) screenMin = 300;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: screenMin,
                        width: screenMin,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Card(
                                      color: Colors.grey[400],
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //StudyHeader(header: ""),
                                            ConstrainedBox(
                                              constraints: BoxConstraints(
                                                maxWidth: 1000,
                                                minWidth: 300,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: FittedBox(
                                                  child: Text(
                                                    "Did you struggle at any point in the previous task?",
                                                    // showCursor: true,
                                                    // toolbarOptions:
                                                    //     ToolbarOptions(
                                                    //   copy: true,
                                                    //   selectAll: true,
                                                    // ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: DesignTheme
                                                          .titleFontSize,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // CheckboxListTile(
                                            //   title: Text(
                                            //     "Yes",
                                            //     //textAlign: TextAlign.center,
                                            //   ),
                                            //   value: _checkBoxValue,
                                            //   onChanged: (val) {
                                            //     setState(
                                            //       () {
                                            //         _checkBoxValue = !_checkBoxValue;
                                            //       },
                                            //     );
                                            //   },
                                            // ),
                                            Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxWidth: 1000,
                                                  minWidth: 300,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        child: ListTile(
                                                          //leading: Icon(Icons.circle),
                                                          title: Text(
                                                            "Yes",
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),

                                                          tileColor:
                                                              participation == 0
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .transparent,
                                                          onTap: () {
                                                            setState(() {
                                                              participation = 0;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        child: ListTile(
                                                          title: Text(
                                                            "No",
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          tileColor:
                                                              participation == 1
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .transparent,
                                                          onTap: () {
                                                            setState(() {
                                                              participation = 1;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            (participation == 0)
                                                ? Spacer()
                                                : Spacer(
                                                    flex: 3,
                                                  ),
                                            (participation == 0)
                                                ? ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      maxWidth: 1000,
                                                      minWidth: 300,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: FittedBox(
                                                            child:
                                                                Text
                                                                    .rich(
                                                              TextSpan(
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20,
                                                                ),
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          '(Optional) ',
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  TextSpan(
                                                                      text:
                                                                          'Please provide some details on how you struggled.'),
                                                                ],
                                                              ),
                                                              // showCursor: true,
                                                              // toolbarOptions:
                                                              //     ToolbarOptions(
                                                              //   copy: true,
                                                              //   selectAll: true,
                                                              // ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                          // child: Text(
                                                          //   "(Optional) Please provide more details about anything in specific you struggled with.",
                                                          //   textAlign:
                                                          //       TextAlign.center,
                                                          // ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: TextField(
                                                            minLines: 3,
                                                            maxLines: 5,
                                                            controller:
                                                                struggleTextController,
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Container(),
                                            (participation == 0)
                                                ? Spacer(
                                                    flex: 1,
                                                  )
                                                : Container(),
                                            Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(DesignTheme
                                                            .defaultRadiusVal),
                                                  ),
                                                  color: (participation == -1)
                                                      ? Colors.grey
                                                      : DesignTheme
                                                          .primaryColor,
                                                  onPressed:
                                                      (participation == -1)
                                                          ? () {}
                                                          : () {
                                                              if (participation ==
                                                                  0) {
                                                                colourTaskData
                                                                    .addTaskStruggleData(
                                                                  StruggleFeedbackModel(
                                                                      struggle:
                                                                          true,
                                                                      feedback:
                                                                          struggleTextController
                                                                              .text,
                                                                      techniqueName:
                                                                          pattern,
                                                                      taskId: widget
                                                                          .taskId),
                                                                );
                                                              } else {
                                                                colourTaskData
                                                                    .addTaskStruggleData(
                                                                  StruggleFeedbackModel(
                                                                      struggle:
                                                                          false,
                                                                      techniqueName:
                                                                          pattern,
                                                                      taskId: widget
                                                                          .taskId),
                                                                );
                                                              }
                                                              widget.onNext();
                                                            },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: DesignTheme
                                                            .mediumPadding),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      child: Text(
                                                        'Submit',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: DesignTheme
                                                              .titleFontSize,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
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
              ),
            ),
          );
        });
  }
}
