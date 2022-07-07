import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/components/study_subtitle.dart';
import 'package:observationStudyScaffold/models/push_button_task_model.dart';

class StudyScaffoldPage extends StatefulWidget {
  final List<Widget> studyTasks;
  final PushButtonTaskModel taskModel;
  int currentIndex = 0;
  
  //final List<String> description;

  // TODO: Add an optinonal parameter for current position in the study

  StudyScaffoldPage({
    @required this.studyTasks,
    @required this.taskModel,
  });

  @override
  _StudyScaffoldPageState createState() => _StudyScaffoldPageState();
}

class _StudyScaffoldPageState extends State<StudyScaffoldPage> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.taskModel.widgets[0] ?? Container(child: Text('Done'),)
    );
  }
}
