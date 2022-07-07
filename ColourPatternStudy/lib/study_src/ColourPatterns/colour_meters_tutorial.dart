import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/pages/ineligible_page.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_meters_widget.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';

class ColourMetersTutorial extends StatelessWidget {
  final Function onNext;
  ColourMetersTutorial({@required this.onNext});
  @override
  Widget build(BuildContext context) {
    //ColourTaskData colourTaskData = context.watch<ColourTaskData>();
    return Provider<ColourTaskData>(
        create: (context) => colourTaskData,
        builder: (context, child) {
          bool skip = false;
          bool ineligible = false;
          String cvdString = colourTaskData.preStudyData.cvdType;
          int ageGroup = colourTaskData.preStudyData.ageGroup;
          bool alreadyParticipated =
              colourTaskData.preStudyData.alreadyParticipated;
          if (ageGroup == 0 || alreadyParticipated) {
            ineligible = true;
          }
          if (cvdString == "None") {
            skip = true;
          }
          if (skip) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              onNext();
            });
          }
          if (ineligible) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => IneligiblePage()));
            });
          }
          return (ineligible || skip)
              ? Container()
              : ColourMetersTutorial2(onNext: onNext);
        });
  }
}

class ColourMetersTutorial2 extends StatelessWidget {
  final Function onNext;
  ColourMetersTutorial2({@required this.onNext});
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      elevation: 0,
      title: FittedBox(
        child: Text(
          "Colour Meters Tutorial",
          style: TextStyle(
            color: Colors.black,
            fontSize: DesignTheme.headerFontSize,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        width: double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenMin = (constraints.maxHeight > constraints.maxWidth)
                ? constraints.maxWidth
                : constraints.maxHeight;
            return Container(
              height: screenMin,
              width: screenMin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: _buildColourMetersRow()),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(DesignTheme.defaultRadiusVal),
                      ),
                      color: DesignTheme.primaryColor,
                      onPressed: () {
                        onNext();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(DesignTheme.mediumPadding),
                        child: FittedBox(
                          child: Text(
                            'Continue',
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildColourMetersRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: _buildColourMetersBlock(
          "Blue",
          Colors.blue,
        )),
        Expanded(
            child: _buildColourMetersBlock(
          "Teal",
          Colors.teal,
        )),
        Expanded(
            child: _buildColourMetersBlock(
          "Green",
          Colors.green,
        )),
        Expanded(
            child: _buildColourMetersBlock(
          "Yellow",
          Colors.yellow,
        )),
        Expanded(
            child: _buildColourMetersBlock(
          "Orange",
          Colors.orange,
        )),
        Expanded(
            child: _buildColourMetersBlock(
          "Brown",
          Colors.brown,
        )),
        Expanded(
            child: _buildColourMetersBlock(
          "Red",
          Colors.red,
        )),
        Expanded(
            child: _buildColourMetersBlock(
          "Pink",
          Colors.pink,
        )),
        Expanded(
            child: _buildColourMetersBlock(
          "Purple",
          Colors.purple,
        )),
      ],
    );
  }

  Widget _buildColourMetersBlock(
    String colourName,
    Color color,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final squareSize = (constraints.maxHeight > constraints.maxWidth)
            ? constraints.maxWidth
            : constraints.maxHeight;
        return Column(
          children: [
            FittedBox(
              child: Text(
                colourName,
                style: TextStyle(fontSize: 32),
              ),
            ),
            Container(
              color: color,
              child: ColourMetersWidget(
                color: color,
                square: squareSize,
              ),
            ),
          ],
        );
      },
    );
  }
}
