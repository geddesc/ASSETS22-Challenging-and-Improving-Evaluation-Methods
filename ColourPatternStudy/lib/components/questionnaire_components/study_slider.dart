import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/components/study_subtitle.dart';

class StudySlider extends StatefulWidget {

  final String question;
  final double max;
  final double min;
  final double defaultVal;

  StudySlider({
    @required this.question,
    this.max = 100,
    this.min = 0,
    this.defaultVal = 0,
  });

  @override
  _StudySliderState createState() => _StudySliderState();
}

class _StudySliderState extends State<StudySlider> {

  double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.defaultVal;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StudySubTitle(title: widget.question),
        Slider(
          value: _currentValue,
          max: widget.max,
          min: widget.min,
          label: _currentValue.round().toString(),
          onChanged: (val) {
            setState(() {
              _currentValue = val;
            });
          },
        ),
      ],
    );
  }
}
