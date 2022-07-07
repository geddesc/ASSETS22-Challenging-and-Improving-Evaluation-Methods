import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/models/cvd_type.dart';
import 'package:observationStudyScaffold/pages/splash_page.dart';
import 'package:observationStudyScaffold/pages/study_complete_page.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_iconizer.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_meters_widget.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_mix_introduction.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_mix_tutorial.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_mixer_widget.dart';
import 'package:observationStudyScaffold/study_src/ColourTasks/colour_category_task.dart';
import 'package:observationStudyScaffold/study_src/ColourTasks/colour_distinction_task.dart';
import 'package:observationStudyScaffold/study_src/ColourTasks/colour_selection_task_intro.dart';
//import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_iconizer_widget.dart';
//import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_iconizer_widget.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/study_src/Survey/consent_form.dart';
import 'package:observationStudyScaffold/study_src/Survey/post_study_questionnaire.dart';
import 'package:observationStudyScaffold/study_src/Survey/pre_study_questionnaire.dart';
import 'package:observationStudyScaffold/study_src/generate_user_trials.dart';
import 'package:observationStudyScaffold/study_src/task.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    StudyScaffold(),
  );
}

class StudyScaffold extends StatefulWidget {
  @override
  _StudyScaffoldState createState() => _StudyScaffoldState();
}

class _StudyScaffoldState extends State<StudyScaffold> {
  List<Widget Function(Function() onNext)> test = [
    // (onNext) => StrugglePage(
    //       onNext: onNext,
    //       taskId: 0,
    //       technique: 0,
    //     ),
    (onNext) => PostStudyQuestionnaire(
          onNext: onNext,
        ),
    (onNext) => ColourMixIntroduction(onNext: onNext),
    (onNext) => ColourSelectionTaskIntro(onNext: onNext),
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    //colourTaskData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (context) => colourTaskData,
          // child: BuildTeaserImage(),
          child: SplashPage(
            onNext: () {
              return ConsentForm(onNext: () {
                return PreStudyQuestionnaire(
                  onNext: (int treatment, int cvdInfoTreatment) {
                    return Task(
                      list: GenerateUserTrials(treatment, cvdInfoTreatment).taskList,
                      completionWidget: StudyCompletePage(),
                    );
                  },
                );
              });
            },
          ),
          // child: ColourDistinctionTask(
          //   distinctColours: 9,
          //   key: UniqueKey(),
          //   onNext: () {},
          //   technique: (context, constraints, color) => Container(),
          //   numberOfColours: 80,
          //   typeOfCVD: CvdType.normal,
          //   patternMethod: 0,
          //   colourDiffCode: 0,
          // ),
          //child: ColourDistinctionTask(numberOfColours: 80, onNext: () {}, typeOfCVD: CvdType.normal, technique: (context, constraints, color) => Container())
          // child: ColourCategoryTask(onNext: () {}, cvdType: CvdType.normal, technique: (context, constraints, color) => Container())
          //BuildColourCodes(),
          //BuildColourPairs(), //BuildColourIconizerTable(), //ColourMixTutorial(onNext: (){},),
          // child: Task(
          //   //list: test,
          //   list: GenerateUserTrials().taskList,
          //   completionWidget: StudyCompletePage(),
          // ),
        ));
  }
}

class BuildColourCodes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
      ),
    );
  }
}

class BuildColourPairs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                //Confusion Colours
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                //Distractor Colours
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              children: [
                //Confusion Colours
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                //Distractor Colours
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              children: [
                //Confusion Colours
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                //Distractor Colours
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildColourIconizerTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("For making the table for Iconizer"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Red",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Colors.red,
                    child: ColourIconizer(Colors.red).getImage(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Blue",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Colors.blue,
                    child: ColourIconizer(Colors.blue).getImage(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Orange",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Colors.orange,
                    child: ColourIconizer(Colors.orange).getImage(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Purple",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Colors.purple[800],
                    child: ColourIconizer(Colors.purple[800]).getImage(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yellow",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Colors.yellow,
                    child: ColourIconizer(Colors.yellow).getImage(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Pink",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Colors.pink[100],
                    child: ColourIconizer(Colors.pink[100]).getImage(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Green",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Colors.green,
                    child: ColourIconizer(Colors.green).getImage(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Brown",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Colors.brown[900],
                    child: ColourIconizer(Colors.brown[900]).getImage(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Teal",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Colors.teal,
                    child: ColourIconizer(Colors.teal).getImage(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Grey",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Colors.grey[300],
                    child: ColourIconizer(Colors.grey[300]).getImage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildTeaserImage extends StatelessWidget {
  const BuildTeaserImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is a Test"),
      ),
      body: Column(
        children: [
          Flexible(
            child: _buildColorRow(
              [
                1.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                0.0,
              ],
              (context, constraints, color) => Container(),
              context,
            ),
          ),
          Flexible(
            child: _buildColorRow(
              [
                1.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                0.0,
              ],
              (context, constraints, color) =>
                  ColourMetersWidget(color: color, square: constraints),
              context,
            ),
          ),
          Flexible(
            child: _buildColorRow(
              [
                0.367322,
                0.860646,
                -0.227968,
                0.0,
                0.0,
                0.280085,
                0.672501,
                0.047413,
                0.0,
                0.0,
                -0.011820,
                0.042940,
                0.968881,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                0.0,
              ],
              (context, constraints, color) => ColourIconizer(color).getImage(),
              context,
            ),
          ),
          Flexible(
            child: _buildColorRow(
              [
                // Level 1.0
                0.152286, 1.052583, -0.204868, 0.0, 0.0,
                0.114503, 0.786281, 0.099216, 0.0, 0.0,
                -0.003882, -0.048116, 1.051998, 0.0, 0.0,
                0.0, 0.0, 0.0, 1.0, 0.0,
              ],
              (context, constraints, color) =>
                  ColourMixerWidget(color: color, square: constraints),
              context,
            ),
          ),
        ],
      ),
    );
  }

  Row _buildColorRow(
      List<double> matrix,
      Widget Function(
    BuildContext context,
    double constraints,
    Color color,
  )
          technique,
      BuildContext context) {
    return Row(
      children: [
        _buildColourSwatch(Colors.red, matrix, technique, context),
        _buildColourSwatch(Colors.yellow, matrix, technique, context),
        _buildColourSwatch(Colors.orange, matrix, technique, context),
        _buildColourSwatch(Colors.green, matrix, technique, context),
        _buildColourSwatch(Colors.teal, matrix, technique, context),
        _buildColourSwatch(Colors.blue, matrix, technique, context),
        _buildColourSwatch(Colors.purple, matrix, technique, context),
        _buildColourSwatch(Colors.pink, matrix, technique, context),
        _buildColourSwatch(Colors.brown, matrix, technique, context),
        _buildColourSwatch(Colors.grey, matrix, technique, context),
      ],
    );
  }

  Flexible _buildColourSwatch(
      Color color,
      List<double> matrix,
      Widget Function(BuildContext context, double constraints, Color color)
          technique,
      BuildContext context) {
    return Flexible(
      child: ColorFiltered(
        colorFilter: ColorFilter.matrix(
          matrix,
        ),
        child: Container(
          color: color,
          child: technique(
            context,
            70,
            color,
          ),
        ),
      ),
    );
  }
}
