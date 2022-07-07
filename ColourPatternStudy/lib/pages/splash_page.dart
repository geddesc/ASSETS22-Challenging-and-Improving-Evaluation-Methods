import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/components/approve_button.dart';
import 'package:observationStudyScaffold/components/study_header.dart';
import 'package:observationStudyScaffold/components/study_subtitle.dart';
import 'package:observationStudyScaffold/pages/custom_route.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  final Function onNext;
  SplashPage({this.onNext});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
                                    "Improving Evaluation Methods of Colour Vision Deficiency Aids"),
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
                                      "This research project is concerned with evaluating the potential effectiveness of different types of colour identification tasks. This study involves the completion of five different colour related tasks, and the completion of a pre-study questionnaire. Through the tasks you will be asked to select colours from amongst distractors, order colours to fufill a gradient, sort colours into a specific named term, identify the names of all distinct colours, and identify the correct category a colour belongs to."),
                            ),
                          ),
                          //Spacer(),
                          //Expanded(
                          Center(
                            child: Provider<ColourTaskData>(
                              create: (context) => colourTaskData,
                              child: ApproveButton(
                                onPressed: () {
                                  colourTaskData.startingStudyTime =
                                      DateTime.now().millisecondsSinceEpoch;
                                  Navigator.of(context).pushReplacement(
                                      CustomRoute(builder: (context) {
                                    return widget.onNext();
                                  }));
                                },
                              ),
                            ),
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
}
