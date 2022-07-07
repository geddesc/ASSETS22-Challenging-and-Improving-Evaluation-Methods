import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_category_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_distinction_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_selection_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_sort_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_transition_task_model.dart';
import 'package:observationStudyScaffold/study_src/StudyData/post_study_questionnaire_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/pre_study_questionnaire_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/struggle_feedback_model.dart';

class ColourTaskData extends ChangeNotifier{
  List<ColourSelectionTaskModel> colSelectTask = [];
  List<ColourTransitionTaskModel> colTransTask = [];
  List<ColourSortTaskModel> colSortTask = [];
  List<ColourDistinctionTaskModel> colDisTask = [];
  List<ColourCategoryTaskModel> colCatTask = [];
  PreStudyQuestionnaireData preStudyData;
  PostStudyQuestionnaireData postStudyData;
  List<StruggleFeedbackModel> taskStruggleData = [];
  int treatment;
  int cvdSimInfo;
  int startingStudyTime;

  void addResultsColSelectionTask(ColourSelectionTaskModel colSelectionTask) {
    this.colSelectTask.add(colSelectionTask);
    notifyListeners();
  }

  void addResultsColTransitionTask(ColourTransitionTaskModel colTransTask) {
    this.colTransTask.add(colTransTask);
    notifyListeners();
  }

  void addResultsColSortTask(ColourSortTaskModel colSortTask) {
    this.colSortTask.add(colSortTask);
    notifyListeners();
  }

  void addResultsColDisTask(ColourDistinctionTaskModel colDisTask) {
    this.colDisTask.add(colDisTask);
    notifyListeners();
  }

  void addResultsColCatTask(ColourCategoryTaskModel colCatTask) {
    this.colCatTask.add(colCatTask);
    notifyListeners();
  }

  void setPreStudyQuestionnaireData(PreStudyQuestionnaireData preStudyData) {
    this.preStudyData = preStudyData;
    notifyListeners();
  } 

  void setPostStudyQuestionnaireData(PostStudyQuestionnaireData postStudyData) {
    this.postStudyData = postStudyData;
    notifyListeners();
  }

  void addTaskStruggleData(StruggleFeedbackModel struggleData) {
    this.taskStruggleData.add(struggleData);
    notifyListeners();
  }
}
