import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/pages/ineligible_page.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_iconizer.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';

class ColourIconizerTutorial extends StatelessWidget {
  final Function onNext;
  ColourIconizerTutorial({
    @required this.onNext,
  });

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
          if (cvdString == "None" && !ineligible) {
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
              : ColourIconizerTutorial2(onNext: onNext);
        });
  }
}

bool isSingleColumn(context) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  if (width < height) {
    return true;
  } else {
    return false;
  }
}

class ColourIconizerTutorial2 extends StatelessWidget {
  final Function onNext;
  ColourIconizerTutorial2({
    @required this.onNext,
  });

  Widget getSingleContent(
      int i, List<String> colourNames, List<Color> lightColours) {
    if (i % 2 == 0) {
      return _buildGridViewElement(colourNames[(i / 2).toInt()]);
    } else {
      return _buildGridViewColour(lightColours[((i - 1) / 2).toInt()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      elevation: 0,
      title: FittedBox(
        child: Text(
          "ColourIconizer Tutorial",
          style: TextStyle(
            color: Colors.white,
            fontSize: DesignTheme.headerFontSize,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
    List<String> colourNames = [
      "Red",
      "Orange",
      "Yellow",
      "Green",
      "Teal",
      "Blue",
      "Purple",
      "Pink",
      "Brown",
      "Grey"
    ];
    List<Color> lightColours = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple[300],
      Colors.pink[200],
      Color(0xffbe9672),
      Colors.grey,
    ];

    // List<Color> darkColours = [
    //   Colors.red[900],
    //   Color(0xffb94414),
    //   Colors.yellow[600],
    //   Colors.green[900],
    //   Colors.teal[700],
    //   Colors.blue[900],
    //   Colors.purple[900],
    //   Colors.pink[600],
    //   Colors.brown,
    //   Colors.grey[800],
    // ];

    var singleColumn = isSingleColumn(context);
    int length;
    var height = MediaQuery.of(context).size.height;

    if (singleColumn) {
      length = colourNames.length * 2;
    } else {
      length = colourNames.length;
    }
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: GridView.count(
              childAspectRatio: (singleColumn) ? 25 : 15,
              primary: false,
              crossAxisCount: singleColumn ? 1 : 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: EdgeInsets.all(20),
              children: [
                for (var i = 0; i < length; i++)
                  if (singleColumn)
                    getSingleContent(i, colourNames, lightColours)
                  // Column(
                  //   children: [
                  //     _buildGridViewElement(colourNames[i]),
                  //     _buildGridViewColour(lightColours[i])
                  //   ],
                  // )
                  else
                    for (var j = 0; j < 2; j++)
                      (j == 0)
                          ? _buildGridViewElement(colourNames[i])
                          : _buildGridViewColour(lightColours[i])
                // : (j == 1)
                //     ? _buildGridViewColour(lightColours[i])
                //: _buildGridViewColour(darkColours[i]),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
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
                      'Confirm Selection',
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

  Widget _buildGridViewElement(String colourName) {
    return Center(
      child: FittedBox(
        child: Text(
          colourName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildGridViewColour(Color color) {
    return Container(
      color: color,
      child: ColourIconizer(color).getImage(),
    );
  }
}
