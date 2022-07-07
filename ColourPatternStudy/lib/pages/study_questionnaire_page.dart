import 'package:flutter/material.dart';

class StudyQuestionnairePage extends StatelessWidget {

  final Function onNext;

  StudyQuestionnairePage({@required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questionnaire"),
      ),
      body: Container(
        
      ),
    );
  }
}