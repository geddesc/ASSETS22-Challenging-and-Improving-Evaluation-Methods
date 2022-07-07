import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/components/study_subtitle.dart';

class MultipleChoice extends StatefulWidget {
  final String question;
  final List<String> options;
  final bool isRadioButton;

  MultipleChoice({
    @required this.question,
    @required this.options,
    this.isRadioButton = true,
  });

  @override
  _MultipleChoiceState createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {

  List<bool> _checkBoxSelected = []; 
  int _indexSelected = 0;

  @override
  void initState() {
    super.initState();
    int len = widget.options.length;
    for(int i = 0; i < len; i++) {
        _checkBoxSelected.add(false);
    } 
  }

  void selectCheckBox(int index, bool newVal) {
    setState((){
      _checkBoxSelected[index] = newVal;
    });
  }

  @override
  // TODO: Adjust so that multiple choice can be in a grid or horizontally labelled.
  Widget build(BuildContext context) {
    int totalQuestions = widget.options.length;

    return Column(
      children: [
        StudySubTitle(title: widget.question),
        for (int i = 0; i < totalQuestions; i++)
          widget.isRadioButton
              ? _buildRadioListTile(widget.options[i], i)
              : _buildCheckboxListTile(widget.options[i], i, _checkBoxSelected),
      ],
    );
  }

  Widget _buildRadioListTile(String option, int index) {
    return ListTile(
      title: Text(option),
      leading: Radio(
        value: index,
        groupValue: _indexSelected,
        onChanged: (val) {
          setState(() {
            _indexSelected = val;
          });
        },
      ),
    );
  }

  Widget _buildCheckboxListTile(String option, int index, List<bool> checkBoxSelected) {
    return ListTile(
      title: Text(option),
      leading: Checkbox(
        value: checkBoxSelected[index],
        onChanged: (val) {
          setState(() {
            selectCheckBox(index, val);
          });
        },
      ),
    );
  }
}
