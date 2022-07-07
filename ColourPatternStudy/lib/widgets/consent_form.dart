import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/components/approve_button.dart';
import 'package:observationStudyScaffold/components/content_panel.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';

class ConsentForm extends StatefulWidget {
  final List<ContentPanel> consentContent;
  final Function onNext;

  ConsentForm({
    @required this.consentContent,
    @required this.onNext,
  });

  @override
  _ConsentFormState createState() => _ConsentFormState();
}

class _ConsentFormState extends State<ConsentForm>{


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(DesignTheme.largePadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...widget.consentContent,
            Center(
              child: ApproveButton(
                onLongPress: widget.onNext,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
