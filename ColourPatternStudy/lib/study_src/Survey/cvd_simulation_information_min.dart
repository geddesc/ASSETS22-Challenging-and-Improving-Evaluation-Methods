import 'package:flutter/material.dart';

import '../../theme/design_theme.dart';

class CvdSimulationInformationMin extends StatelessWidget {
  final Function onNext;

  var appBar = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: FittedBox(
      child: SelectableText(
        'Colour Blindness Simulation',
        showCursor: true,
        toolbarOptions: ToolbarOptions(
          copy: true,
          selectAll: true,
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: DesignTheme.headerFontSize,
          color: Colors.black,
        ),
      ),
    ),
  );

  CvdSimulationInformationMin({
    @required this.onNext,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 600,
            minWidth: 300,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                "For this study, you will be shown colours through a red-green colour blind simulation at a given severity. As such, colours won't appear as they normally do, so many of the tasks (which are colour-related) will likely be challenging. Regardless, please try your best to complete each task.",
                showCursor: true,
                toolbarOptions: ToolbarOptions(
                  copy: true,
                  selectAll: true,
                ),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: RaisedButton(
                  onPressed: onNext,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(DesignTheme.defaultRadiusVal),
                  ),
                  color: DesignTheme.primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(DesignTheme.mediumPadding),
                    child: FittedBox(
                      child: Text(
                        "Continue",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: DesignTheme.titleFontSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
