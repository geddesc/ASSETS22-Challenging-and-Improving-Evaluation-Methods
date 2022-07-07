import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_category_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_distinction_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_selection_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_sort_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_transition_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/post_study_questionnaire_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/pre_study_questionnaire_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/struggle_feedback_model.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';

class StudyCompletePage extends StatelessWidget {
  final Function onPressed;

  StudyCompletePage({this.onPressed});

  String removeBadStuff(String str) {
    str = str.replaceAll("\r", " ");
    str = str.replaceAll("\n", " ");
    str = str.replaceAll(",", ";;");
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Provider<ColourTaskData>(
        create: (context) => colourTaskData,
        builder: (context, child) {
          List<ColourSelectionTaskModel> colSelectionTaskModel =
              colourTaskData.colSelectTask;
          List<ColourSortTaskModel> colSortTaskModel =
              colourTaskData.colSortTask;
          List<ColourTransitionTaskModel> colTransTaskModel =
              colourTaskData.colTransTask;
          List<ColourDistinctionTaskModel> colDistTaskModel = colourTaskData.colDisTask;
          List<ColourCategoryTaskModel> colCatTaskModel = colourTaskData.colCatTask;
          PreStudyQuestionnaireData colPreStudyQuestionnaireData =
              colourTaskData.preStudyData;
          PostStudyQuestionnaireData colPostStudyQuestionnaireData =
              colourTaskData.postStudyData ?? PostStudyQuestionnaireData.normal();
          List<StruggleFeedbackModel> colStruggleFeedback =
              colourTaskData.taskStruggleData;


          List<Map<String, dynamic>> colourSelectionTaskFB = [];
          List<Map<String, dynamic>> colourTransitionTaskFB = [];
          List<Map<String, dynamic>> colourSortTaskFB = [];
          List<Map<String, dynamic>> colourDistTaskFB = [];
          List<Map<String, dynamic>> colourCatTaskFB = [];
          List<Map<String, dynamic>> taskStruggleDataFB = [];

          colSelectionTaskModel.forEach((colSelectionTask) {
            Map<String, dynamic> myMap = {
              "Technique": colSelectionTask.technique,
              "Accuracy": colSelectionTask.accuracy,
              "CompletionTime":
                  "${colSelectionTask.completionTime.inMilliseconds}",
              "ColourSet": colSelectionTask.colourSet,
              "TargetColourName": colSelectionTask.targetColour,
              "TotalColours": colSelectionTask.numSwatches,
              "TotalTargetColours": colSelectionTask.numTargetColours,
              "TotalColoursSelected": colSelectionTask.numSelected,
              "TotalConfusionColours": colSelectionTask.numConfusionColours,
              "TotalDistractorColours": colSelectionTask.numDistractorColours,
              "SelectedColoursCorrect": colSelectionTask.selectedColoursCorrect,
              "SelectedColoursIncorrect": colSelectionTask.selectedColoursWrong,
              "MissedColours": colSelectionTask.missedColours,
              "ConfusionColours": colSelectionTask.confusionColours,
              "DistractorColours": colSelectionTask.distractorColours,
              "TargetColoursList": colSelectionTask.targetColours,
              "StartTime": colSelectionTask.startTime,
              "EndTime": colSelectionTask.endTime,
              "ScreenHeight": colSelectionTask.screenHeight,
              "ScreenWidth": colSelectionTask.screenWidth,
              "ColourDiffCode": colSelectionTask.colourDiffCode,
              "treatment": colourTaskData.treatment,
              "CVDType": colPreStudyQuestionnaireData.cvdType,
            };
            colourSelectionTaskFB.add(myMap);
          });

          colTransTaskModel.forEach((colTransTask) {
            Map<String, dynamic> myMap = {
              "Technique": colTransTask.technique,
              "Score": colTransTask.score,
              "CompletionTime": "${colTransTask.completionTime.inMilliseconds}",
              "ColourSet": colTransTask.colourSet,
              "StartColour": colTransTask.startColor,
              "EndColour": colTransTask.endColor,
              "ParticipantTransitionList":
                  colTransTask.userSolvedTransitionList,
              "GoalTransitionList": colTransTask.goalList,
              "GeneratedStartingList": colTransTask.generatedStartingList,
              "StartTime": colTransTask.startTime,
              "EndTime": colTransTask.endTime,
              "ScreenHeight": colTransTask.screenHeight,
              "ScreenWidth": colTransTask.screenWidth,
              "ColourDiffCode": colTransTask.colourDiffCode,
              "treatment": colourTaskData.treatment,
              "CVDType": colPreStudyQuestionnaireData.cvdType,
              //"Size": colTransTask.size,
            };
            colourTransitionTaskFB.add(myMap);
          });

          colSortTaskModel.forEach((colSortTask) {
            Map<String, dynamic> myMap = {
              "Technique": colSortTask.technique,
              "Accuracy": colSortTask.accuracy,
              "CompletionTime": "${colSortTask.completionTime.inMilliseconds}",
              "NumCorrect": colSortTask.numCorrect,
              "NumIncorrect": colSortTask.numIncorrect,
              "CorrectlySortedColours": colSortTask.correctColours,
              "IncorrectlySortedColours": colSortTask.incorrectColours,
              "ColourList": colSortTask.colours,
              "StartTime": colSortTask.startTime,
              "EndTime": colSortTask.endTime,
              "ScreenHeight": colSortTask.screenHeight,
              "ScreenWidth": colSortTask.screenWidth,
              "ColourDiffCode": colSortTask.colourDiffCode,
              "treatment": colourTaskData.treatment,
              "CVDType": colPreStudyQuestionnaireData.cvdType,
              //'Size': colSortTask.size,
            };
            colourSortTaskFB.add(myMap);
          });

          colDistTaskModel.forEach((colDistTask) { 
            Map<String, dynamic> myMap = {
              "technique": colDistTask.technique,
              "accuracy": colDistTask.accuracy,
              "completionTime": "${colDistTask.completionTime.inMilliseconds}",
              "numDistinctColours": colDistTask.numDistinctColours,
              "numSwatches": colDistTask.numSwatches,
              "colourSet": removeBadStuff(colDistTask.colourSet),
              "startTime": colDistTask.startTime,
              "endTime": colDistTask.endTime,
              "screenHeight": colDistTask.screenHeight,
              "screenWidth": colDistTask.screenWidth,
              "ColourDiffCode": colDistTask.colourDiffCode,
              "colourNamesGuessed": removeBadStuff(colDistTask.colourNamesGuessed),
              "correctColourNames": removeBadStuff(colDistTask.correctColourNames),
              "numDistinctColoursGuessed": colDistTask.numDistinctColoursGuessed,
              "treatment": colourTaskData.treatment,
              "CVDType": colPreStudyQuestionnaireData.cvdType,
            };
            colourDistTaskFB.add(myMap);
          });

          colCatTaskModel.forEach((colCatTask) { 
            Map<String, dynamic> myMap = {
              "technique": colCatTask.technique,
              "isCorrect": colCatTask.isCorrect,
              "completionTime": "${colCatTask.completionTime.inMilliseconds}",
              "categoryGuessed": colCatTask.categoryGuessed,
              "categoryColourGuessed": colCatTask.categoryColourGuessed,
              "categoryAnswer": colCatTask.categoryAnswer,
              "categoryColourAnswered": colCatTask.categoryColourAnswer,
              "colourExample": colCatTask.colourExample,
              "categoryColours": removeBadStuff(colCatTask.categoryColours),
              "startTime": colCatTask.startTime,
              "endTime": colCatTask.endTime,
              "screenHeight": colCatTask.screenHeight,
              "screenWidth": colCatTask.screenWidth,
              "ColourDiffCode": colCatTask.colourDiffCode,
              "ColourNameAnswer": colCatTask.colourNameAnswer,
              "ColourNameGuessed": colCatTask.colourNameGuessed,
              "treatment": colourTaskData.treatment,
              "CVDType": colPreStudyQuestionnaireData.cvdType,
            };
            colourCatTaskFB.add(myMap);
          });

          //colPreStudyQuestionnaireData.

          String ageGroup;
          int ageCode = colPreStudyQuestionnaireData.ageGroup;
          if(ageCode == 0) {
            ageGroup = "less than 18";
          } else if(ageCode == 1) {
            ageGroup = "18-24";
          } else if(ageCode == 2) {
            ageGroup = "25-34";
          } else if(ageCode == 3) {
            ageGroup = "35-44";
          } else if(ageCode == 4) {
            ageGroup = "45-64";
          } else {
            ageGroup = "greater than 65";
          }

          String device;
          int deviceCode = colPreStudyQuestionnaireData.deviceCode;

          if(deviceCode == 0) {
            device = "Mobile";
          } else if(deviceCode == 1) {
            device = "Laptop";
          } else if(deviceCode == 2) {
            device = "Tablet";
          } else if(deviceCode == 3) {
            device = "Monitor/Desktop";
          } else {
            device = "Other";
          }


          Map<String, dynamic> preStudyQuestionnaireFB = {
            "AlreadyParticipated":
                colPreStudyQuestionnaireData.alreadyParticipated,
            "CVDType": colPreStudyQuestionnaireData.cvdType,
            "OtherStr": removeBadStuff(colPreStudyQuestionnaireData.otherStr),
            "AgeGroup": ageGroup,
            "device": device,
            "UsingMouse": colPreStudyQuestionnaireData.usingMouse,
            "Environment": colPreStudyQuestionnaireData.environment,
            "Lighting": colPreStudyQuestionnaireData.lighting,
            "BrightnessLevel": colPreStudyQuestionnaireData.brightness,
            "UsingRecoloring": colPreStudyQuestionnaireData.recoloring,
            "NativeLanguage": colPreStudyQuestionnaireData.nativeLanguage,
            "Sex": colPreStudyQuestionnaireData.sex,
            "Severity": colPreStudyQuestionnaireData.severity,
          };

          // Map<String, dynamic> postStudyQuestionnaireFB = {
          // };

          // if(colPreStudyQuestionnaireData.cvdType == "normal") {
          //   postStudyQuestionnaireFB = {
          // };
          // } else {
          //   postStudyQuestionnaireFB = {
          //   "noPatternRank": colPostStudyQuestionnaireData.rankOfNoPattern,
          //   "colourMixRank": colPostStudyQuestionnaireData.rankOfColourMix,
          //   "colourIconizerRank": colPostStudyQuestionnaireData.rankOfColourIconizer,
          //   "colourMetersRank": colPostStudyQuestionnaireData.rankOfColourMeters,
          //   "expOfRankNoPattern": removeBadStuff(colPostStudyQuestionnaireData.expOfNoPatternRank),
          //   "expOfRankColourMix": removeBadStuff(colPostStudyQuestionnaireData.expOfMixRank),
          //   "expOfRankColourIconizer": removeBadStuff(colPostStudyQuestionnaireData.expOfIconizerRank),
          //   "expOfRankColourMeters": removeBadStuff(colPostStudyQuestionnaireData.expOfMeterRank),
          //   "ProsAndConsColourMix": removeBadStuff(colPostStudyQuestionnaireData.mixProsCons),
          //   "ProsAndConsColourIconizer": removeBadStuff(colPostStudyQuestionnaireData.iconProsCons),
          //   "ProsAndConsColourMeters": removeBadStuff(colPostStudyQuestionnaireData.metersProsCons),
          //   "RealWorldApplicabilityMix": removeBadStuff(colPostStudyQuestionnaireData.mixRealWorld),
          //   "RealWorldApplicabilityIconizer": removeBadStuff(colPostStudyQuestionnaireData.iconRealWorld),
          //   "RealWorldApplicabilityMeters": removeBadStuff(colPostStudyQuestionnaireData.metersRealWorld),
          //   "SuggestionsForImprovementMix": removeBadStuff(colPostStudyQuestionnaireData.mixImprove),
          //   "SuggestionsForImprovementIconizer": removeBadStuff(colPostStudyQuestionnaireData.iconImprove),
          //   "SuggestionsForImprovementMeters": removeBadStuff(colPostStudyQuestionnaireData.metersImprove),
          // };
          // }


          // Map<String, dynamic> postStudyQuestionnaireFB = {
          //   "noPatternRank": colPostStudyQuestionnaireData.rankOfNoPattern,
          //   "colourMixRank": colPostStudyQuestionnaireData.rankOfColourMix,
          //   "colourIconizerRank": colPostStudyQuestionnaireData.rankOfColourIconizer,
          //   "colourMetersRank": colPostStudyQuestionnaireData.rankOfColourMeters,
          //   "expOfRankNoPattern": removeBadStuff(colPostStudyQuestionnaireData.expOfNoPatternRank),
          //   "expOfRankColourMix": removeBadStuff(colPostStudyQuestionnaireData.expOfMixRank),
          //   "expOfRankColourIconizer": removeBadStuff(colPostStudyQuestionnaireData.expOfIconizerRank),
          //   "expOfRankColourMeters": removeBadStuff(colPostStudyQuestionnaireData.expOfMeterRank),
          //   "ProsAndConsColourMix": removeBadStuff(colPostStudyQuestionnaireData.mixProsCons),
          //   "ProsAndConsColourIconizer": removeBadStuff(colPostStudyQuestionnaireData.iconProsCons),
          //   "ProsAndConsColourMeters": removeBadStuff(colPostStudyQuestionnaireData.metersProsCons),
          //   "RealWorldApplicabilityMix": removeBadStuff(colPostStudyQuestionnaireData.mixRealWorld),
          //   "RealWorldApplicabilityIconizer": removeBadStuff(colPostStudyQuestionnaireData.iconRealWorld),
          //   "RealWorldApplicabilityMeters": removeBadStuff(colPostStudyQuestionnaireData.metersRealWorld),
          //   "SuggestionsForImprovementMix": removeBadStuff(colPostStudyQuestionnaireData.mixImprove),
          //   "SuggestionsForImprovementIconizer": removeBadStuff(colPostStudyQuestionnaireData.iconImprove),
          //   "SuggestionsForImprovementMeters": removeBadStuff(colPostStudyQuestionnaireData.metersImprove),
          // };

          

          colStruggleFeedback.forEach((colStruggle) {
            String task;

            if(colStruggle.taskId == 0) {
              task = "ColourSelectionTask";
            } else if(colStruggle.taskId == 1) {
              task = "ColourTransitionTask";
            } else if(colStruggle.taskId == 2) {
              task = "ColourSortingTask";
            } else if(colStruggle.taskId == 3) {
              task = "ColourDistinctionTask";
            } else if(colStruggle.taskId == 4) {
              task = "ColourCategoryTask";
            }
            //String furtherInfo;
            // var temp = colStruggle.feedback.replaceAll("\n", " ");
            // furtherInfo = temp.replaceAll(",", ";;");
            Map<String, dynamic> myMap = {
              "Struggle": colStruggle.struggle,
              "FurtherInfo": removeBadStuff(colStruggle.feedback),
              "Technique": colStruggle.techniqueName,
              "TaskName": task,
            };
            taskStruggleDataFB.add(myMap);
          });

          FirebaseFirestore.instance.collection("FinalResultsForStudy").add(
            {
              "Id": "MACADO_SIM_FIXED",
              "TreatmentNumber": colourTaskData.treatment,
              "PreStudyQuestionnaire": preStudyQuestionnaireFB,
              //"PostStudyQuestionnaire": postStudyQuestionnaireFB,
              "StruggleData": taskStruggleDataFB,
              "StudyCompletionDate": DateTime.now().millisecondsSinceEpoch,
              "ColourSelectionTask": colourSelectionTaskFB,
              "ColourTransitionTask": colourTransitionTaskFB,
              "ColourSortingTask": colourSortTaskFB,
              "ColourDistinctionTask": colourDistTaskFB,
              "ColourCategoryTask": colourCatTaskFB,
              "TotalStudyTime": (DateTime.now().millisecondsSinceEpoch -
                      colourTaskData.startingStudyTime)
                  .toString(),
            },
          );

          /// Map<String, dynamic> {
          ///   val1: int
          ///   val2: Map<String, dynamic>
          ///   val3: Map<String, dynamic> 
          ///   val4: List[]
          ///   val5: int,
          ///   val6: List[]
          ///   val7: 
          /// }
          // FirebaseFirestore.instance.collection("studyResults").add(
          //   {
          //     "Id": "TESTING FIVE",
          //     "Pre-Study Questionnaire": preStudyQuestionnaireFB,
          //     "Study Completion Date": DateTime.now().millisecondsSinceEpoch,
          //     "Colour Selection Task": colourSelectionTaskFB,
          //     "Colour Transition Task": colourTransitionTaskFB,
          //     "Colour Sorting Task": colourSortTaskFB,
          //   },
          // );
          //  FirebaseFirestore.instance.collection("prestudyQuestionnaire").add(
          //   {
          //     //"Id": "TESTING FOUR",
          //     "Pre-Study Questionnaire": preStudyQuestionnaireFB,
          //     // "Study Completion Date": DateTime.now().millisecondsSinceEpoch,
          //     // "Colour Selection Task": colourSelectionTaskFB,
          //     // "Colour Transition Task": colourTransitionTaskFB,
          //     // "Colour Sorting Task": colourSortTaskFB,
          //   },
          // );

          var appBar = AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Study Complete',
              style: TextStyle(
                fontSize: DesignTheme.headerFontSize,
                color: Colors.black,
              ),
            ),
          );

          return Scaffold(
            appBar: appBar,
            body: Center(
              child: Text(
                  "Congratulations, You have completed the study! Thank you for participating!"),
            ),
          );
        });
  }
}
