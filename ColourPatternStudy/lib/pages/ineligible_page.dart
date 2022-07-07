import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/components/study_subtitle.dart';

class IneligiblePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StudySubTitle(
          title:
              "Unfortunately you are ineligible to complete the study, thank you for taking your time to participate.",
        ),
      ),
    );
  }
}
