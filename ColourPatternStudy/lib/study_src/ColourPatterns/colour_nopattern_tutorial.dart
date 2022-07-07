import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';

class ColourNopatternTutorial extends StatelessWidget {
  final Function onNext;
  ColourNopatternTutorial({@required this.onNext});
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: FittedBox(
        child: Text(
          'No Pattern',
          style: TextStyle(
            fontSize: DesignTheme.headerFontSize,
            color: Colors.black,
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Text("This version will use no pattern"),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DesignTheme.defaultRadiusVal),
              ),
              color: DesignTheme.primaryColor,
              onPressed: () {
                onNext();
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: DesignTheme.mediumPadding),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: DesignTheme.titleFontSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
