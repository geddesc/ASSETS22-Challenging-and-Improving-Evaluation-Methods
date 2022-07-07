import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/components/study_subtitle.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';

class TextResponse extends StatelessWidget {
  final String question;
  final int minLines;
  final int maxLines;

  TextResponse({
    @required this.question,
    this.minLines = 1,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StudySubTitle(title: question),
        Padding(
          padding: EdgeInsets.all(DesignTheme.largePadding),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DesignTheme.defaultRadiusVal),
              borderSide: BorderSide(width: 1.0, color: Colors.black),
            )),
            keyboardType: TextInputType.multiline,
            minLines: minLines,
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}
