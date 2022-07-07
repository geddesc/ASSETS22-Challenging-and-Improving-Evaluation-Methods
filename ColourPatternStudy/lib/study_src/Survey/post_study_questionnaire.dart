import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/pages/ineligible_page.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_iconizer.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_meters_widget.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_mix_widget.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/post_study_questionnaire_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';

class PostStudyQuestionnaire extends StatefulWidget {
  final Function onNext;

  PostStudyQuestionnaire({
    @required this.onNext,
  });

  @override
  _PostStudyQuestionnaireState createState() => _PostStudyQuestionnaireState();
}

class _PostStudyQuestionnaireState extends State<PostStudyQuestionnaire> {
  @override
  Widget build(BuildContext context) {
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
          if (cvdString == "None" && !ineligible) {
            skip = true;
          }
          if (skip) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              widget.onNext();
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
              : PostStudyQuestionnaire2(onNext: widget.onNext);
        });
  }
}
class PostStudyQuestionnaire2 extends StatefulWidget {
  final Function onNext;

  PostStudyQuestionnaire2({
    @required this.onNext,
  });

  @override
  _PostStudyQuestionnaireState2 createState() => _PostStudyQuestionnaireState2();
}

class _PostStudyQuestionnaireState2 extends State<PostStudyQuestionnaire2> {
  List<Function(BuildContext context, double constraints, Color color)>
      techniques = [
    (context, size, color) {
      return Container();
    },
    (context, size, color) {
      return ColourMixWidget(
        color: color,
        square: size,
      );
    },
    (context, size, color) {
      return ColourIconizer(
        color,
      ).getImage();
    },
    (context, size, color) {
      return ColourMetersWidget(
        color: color,
        square: size,
      );
    },
  ];
  List<double> sliderListValue = [3.0, 3.0, 3.0, 3.0];

  List<TextEditingController> sliderRankExp = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> patternProsCons = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> patternRealWorld = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> patternSuggestions = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    //ColourTaskData colourTaskData = context.watch<ColourTaskData>();

    var appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: FittedBox(
        child: Text(
          'Post-Study Questionnaire',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: DesignTheme.headerFontSize,
            color: Colors.black,
          ),
        ),
      ),
    );

    double height =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.only(
          top: 15,
        ),
        height: height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "1. Rate each of the colour patterns according to how useful you thought each pattern was (1 = not useful and 5 = very useful)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Column(
                    children: [
                      for (var i = 0; i < techniques.length; i++)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildColourSwatch(i, context),
                                Slider(
                                  value: sliderListValue[i],
                                  min: 1,
                                  max: 5,
                                  divisions: 4,
                                  label: sliderListValue[i].toString(),
                                  onChanged: (double val) {
                                    setState(() {
                                      sliderListValue[i] = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Text(
                              "(Optional) Provide a brief explanation for the rating you provided",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 250,
                                  maxWidth: 1000,
                                ),
                                child: TextField(
                                  minLines: 3,
                                  maxLines: 5,
                                  controller: sliderRankExp[i],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "2. What advantages/disadvantages do you feel each pattern has?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Column(
                    children: [
                      for (var i = 1; i < techniques.length; i++)
                        Column(
                          children: [
                            // Container(
                            //   height: 50,
                            //   width: 50,
                            //   child: techniques[i](context, 50, Colors.red),
                            //   color: Colors.red,
                            // ),
                            _buildColourSwatch(i, context),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 250,
                                  maxWidth: 1000,
                                ),
                                child: TextField(
                                  minLines: 3,
                                  maxLines: 5,
                                  controller: patternProsCons[i - 1],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "3. How might you use these colour patterns in your day-to-day life?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Column(
                    children: [
                      for (var i = 1; i < techniques.length; i++)
                        Column(
                          children: [
                            // Container(
                            //   height: 50,
                            //   width: 50,
                            //   child: techniques[i](context, 50, Colors.red),
                            //   color: Colors.red,
                            // ),
                            _buildColourSwatch(i, context),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 250,
                                  maxWidth: 1000,
                                ),
                                child: TextField(
                                  minLines: 3,
                                  maxLines: 5,
                                  controller: patternRealWorld[i - 1],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "4. Do you have any ideas for improving each colour pattern?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Column(
                    children: [
                      for (var i = 1; i < techniques.length; i++)
                        Column(
                          children: [
                            // Container(
                            //   height: 50,
                            //   width: 50,
                            //   child: techniques[i](context, 50, Colors.red),
                            //   color: Colors.red,
                            // ),
                            _buildColourSwatch(i, context),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 250,
                                  maxWidth: 1000,
                                ),
                                child: TextField(
                                  minLines: 3,
                                  maxLines: 5,
                                  controller: patternSuggestions[i - 1],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 250,
                maxWidth: 500,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Provider<ColourTaskData>(
                  create: (context) => colourTaskData,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(DesignTheme.defaultRadiusVal),
                    ),
                    color: DesignTheme.primaryColor,
                    onPressed: () {
                      colourTaskData.setPostStudyQuestionnaireData(
                          PostStudyQuestionnaireData(
                        rankOfNoPattern: sliderListValue[0],
                        expOfNoPatternRank: sliderRankExp[0].text,
                        rankOfColourMix: sliderListValue[1],
                        expOfMixRank: sliderRankExp[1].text,
                        rankOfColourIconizer: sliderListValue[2],
                        expOfIconizerRank: sliderRankExp[2].text,
                        rankOfColourMeters: sliderListValue[3],
                        expOfMeterRank: sliderRankExp[3].text,
                        mixProsCons: patternProsCons[0].text,
                        iconProsCons: patternProsCons[1].text,
                        metersProsCons: patternProsCons[2].text,
                        mixRealWorld: patternRealWorld[0].text,
                        iconRealWorld: patternRealWorld[1].text,
                        metersRealWorld: patternRealWorld[2].text,
                        mixImprove: patternSuggestions[0].text,
                        iconImprove: patternSuggestions[1].text,
                        metersImprove: patternSuggestions[2].text,
                      ));
                      widget.onNext();
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: DesignTheme.mediumPadding),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            'Submit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: DesignTheme.titleFontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColourSwatch(int i, BuildContext context) {
    String colourName;
    if(i == 0) {
      colourName = "None/Control";
    } else if(i == 1) {
      colourName = "ColourMix";
    } else if(i == 2) {
      colourName = "ColourIconizer";
    } else if(i == 3) {
      colourName = "ColourMeters";
    }
    return Column(
      children: [
        Text(
          colourName,
        ),
        Container(
          height: 50,
          width: 50,
          child: techniques[i](context, 50, Colors.red),
          color: Colors.red,
        ),
      ],
    );
  }
}
