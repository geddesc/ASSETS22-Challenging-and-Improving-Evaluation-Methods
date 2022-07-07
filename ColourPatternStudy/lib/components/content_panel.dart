import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/components/study_subtitle.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';

class ContentPanel extends StatelessWidget {
  final StudySubTitle subTitle;
  final String paragraph;

  ContentPanel({
    @required this.subTitle,
    @required this.paragraph,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: DesignTheme.largePadding),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          subTitle,
          Text(
            paragraph,
            style: TextStyle(
              fontSize: DesignTheme.defaultFontSize,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
