import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/components/approve_button.dart';
import 'package:observationStudyScaffold/components/study_header.dart';
import 'package:observationStudyScaffold/components/study_subtitle.dart';
import 'package:observationStudyScaffold/pages/custom_route.dart';
import 'package:observationStudyScaffold/pages/ineligible_page.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';

class ColourSelectionTaskIntro extends StatefulWidget {
  final Function onNext;
  final int patternMethod;
  ColourSelectionTaskIntro({this.onNext, this.patternMethod});

  @override
  _ColourSelectionTaskIntroState createState() => _ColourSelectionTaskIntroState();
}

class _ColourSelectionTaskIntroState extends State<ColourSelectionTaskIntro> {
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
            if (widget.patternMethod == 3) {
              skip = true;
            }
            
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
              : ColourSelectionTaskIntro2(onNext: widget.onNext);
        });
  }
}

class ColourSelectionTaskIntro2 extends StatefulWidget {
  final Function onNext;
  ColourSelectionTaskIntro2({this.onNext});

  @override
  _ColourSelectionTaskIntroState2 createState() => _ColourSelectionTaskIntroState2();
}

class _ColourSelectionTaskIntroState2 extends State<ColourSelectionTaskIntro2> {
  @override
  Widget build(BuildContext context) {
    //var colourTaskData = context.watch<ColourTaskData>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      // minWidth: 250,
                      // maxWidth: 500,
                      maxHeight: 500,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 250,
                              maxWidth: 500,
                              //maxHeight: 500,
                            ),
                            child: StudyHeader(
                                header:
                                    "Colour Selection Task"),
                          ),
                          //Spacer(),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 250,
                              maxWidth: 500,
                              //maxHeight: 500,
                            ),
                                                      child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: StudySubTitle(
                                  title:
                                      "In this task you will be presented with a grid of coloured squares from which, you will be required to find all the coloured squares matching a desired target colour (indicated at the top)."),
                            ),
                          ),
                          //Spacer(),
                          //Expanded(
                          Center(
                            child: _buildCompleteButton(),
                          ),
                          //),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCompleteButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTheme.defaultRadiusVal),
      ),
      color: DesignTheme.primaryColor,
      onPressed: () {
          widget.onNext();
      },
      child: Padding(
        padding: EdgeInsets.all(DesignTheme.mediumPadding),
        child: FittedBox(
          child: Text(
            'Start',
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
}
