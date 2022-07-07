import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/pages/ineligible_page.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_mix_widget.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';

import 'colour_mixer_widget.dart';

class ColourMixTutorial extends StatelessWidget {
  final Function onNext;
  ColourMixTutorial({@required this.onNext});

  @override
  Widget build(BuildContext context) {
    //ColourTaskData colourTaskData = context.watch<ColourTaskData>();
    return ColourMixTutorial2(onNext: onNext);
    // return Provider<ColourTaskData>(
    //     create: (context) => colourTaskData,
    //     builder: (context, child) {
    //       bool skip = false;
    //       bool ineligible = false;
    //       String cvdString = colourTaskData.preStudyData.cvdType;
    //       int ageGroup = colourTaskData.preStudyData.ageGroup;
    //       bool alreadyParticipated =
    //           colourTaskData.preStudyData.alreadyParticipated;
    //       if (ageGroup == 0 || alreadyParticipated) {
    //         ineligible = true;
    //       }
    //       if (cvdString == "None") {
    //         skip = true;
    //       }
    //       if (skip) {
    //         SchedulerBinding.instance.addPostFrameCallback((_) {
    //           onNext();
    //         });
    //       }
    //       if (ineligible) {
    //         SchedulerBinding.instance.addPostFrameCallback((_) {
    //           Navigator.pushReplacement(
    //               context,
    //               new MaterialPageRoute(
    //                   builder: (context) => IneligiblePage()));
    //         });
    //       }
    //       return (ineligible || skip)
    //           ? Container()
    //           : ColourMixTutorial2(onNext: onNext);
    //     });
  }
}

class ColourMixTutorial2 extends StatelessWidget {
  final Function onNext;
  ColourMixTutorial2({@required this.onNext});

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      elevation: 0,
      title: FittedBox(
        child: Text(
          "Colour Mix Tutorial",
          style: TextStyle(
            color: Colors.black,
            fontSize: DesignTheme.headerFontSize,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );

    double width = MediaQuery.of(context).size.width;
    double height =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double sizeOfSquare = 100;
    if (height > width) {
      sizeOfSquare = width / 15;
    } else {
      sizeOfSquare = height / 15;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _buildBasicColours(sizeOfSquare),
              _buildSecondaryColours(sizeOfSquare),
              _buildAdditionalColours(sizeOfSquare),
              _buildTransitionColours(sizeOfSquare),
              _buildChromaColours(sizeOfSquare),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Padding(
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
                    fit: BoxFit.fitWidth,
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

  Widget _buildBasicColours(double sizeOfSquare) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Four Basic Colours: Colour Mix Utilizes four base patterns",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildColourColumn(HSLColor.fromAHSL(1.0, 0, 1.0, 0.5).toColor(), "Red", sizeOfSquare),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildColourColumn(Colors.yellow, "Yellow", sizeOfSquare),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildColourColumn(Color(0xff00ff08), "Green", sizeOfSquare),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildColourColumn(Colors.blue, "Blue", sizeOfSquare),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSecondaryColours(double sizeOfSquare) {
    Map<String, List> colourMap = {
      "ColourNameOne": [
        ["Red", "Green"],
        ["Yellow", "Blue"]
      ],
      "ColourOne": [
        [HSLColor.fromAHSL(1.0, 0, 1.0, 0.5).toColor(), Color(0xff00ff08)],
        [Colors.yellow, Colors.blue]
      ],
      "ColourNameTwo": [
        ["Yellow", "Blue"],
        ["Green", "Red"]
      ],
      "ColourTwo": [
        [Colors.yellow, Colors.blue],
        [Color(0xff00ff08), HSLColor.fromAHSL(1.0, 0, 1.0, 0.5).toColor()]
      ],
      "ColourNameThree": [
        ["Orange", "Teal"],
        ["YellowGreen", "Purple"]
      ],
      "ColourThree": [
        [Colors.orange, Color(0xff00ad9d)],
        [Color(0xffc5db00), Color(0xff9800b3)]
      ],
    };

    return Column(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Secondary Colours: Colour Mix uses combinations of base colours to create further colours",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < 2; i++)
              Column(
                children: [
                  for (var j = 0; j < 2; j++)
                    _buildColorMixEquations(
                      colourMap["ColourOne"][i][j],
                      colourMap["ColourNameOne"][i][j],
                      colourMap["ColourTwo"][i][j],
                      colourMap["ColourNameTwo"][i][j],
                      colourMap["ColourThree"][i][j],
                      colourMap["ColourNameThree"][i][j],
                      sizeOfSquare,
                    ),
                ],
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdditionalColours(double sizeOfSquare) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Additional Colours: Pink, Brown & Grey (no symbol)",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildColourColumn(Colors.pink[200], "Pink", sizeOfSquare),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:  _buildColourColumn(Color(0xff4d2b0c), "Brown", sizeOfSquare),//_buildBrownColour(sizeOfSquare),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildColourColumn(Colors.grey, "Grey", sizeOfSquare),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTransitionColours(double sizeOfSquare) {
    List<Color> transitionColourList = [
      HSLColor.fromAHSL(1.0, 0, 1.0, 0.5).toColor(),
      HSLColor.fromAHSL(1.0, 15, 1.0, 0.5).toColor(),
      HSLColor.fromAHSL(1.0, 20, 1.0, 0.5).toColor(),
      HSLColor.fromAHSL(1.0, 25, 1.0, 0.5).toColor(),
      HSLColor.fromAHSL(1.0, 30, 1.0, 0.5).toColor(),
      HSLColor.fromAHSL(1.0, 35, 1.0, 0.5).toColor(),
      HSLColor.fromAHSL(1.0, 40, 1.0, 0.5).toColor(),
      HSLColor.fromAHSL(1.0, 45, 1.0, 0.5).toColor(),
      HSLColor.fromAHSL(1.0, 50, 1.0, 0.5).toColor(),
      HSLColor.fromAHSL(1.0, 60, 1.0, 0.5).toColor(),
    ];
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Complex Colours: Colour Mix uses opacity with combinations to allow to identify the intensity of specific colours present",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < transitionColourList.length; i++)
              (i == 0)
                  ? _buildColourColumn(
                      transitionColourList[i], "red", sizeOfSquare)
                  : (i == transitionColourList.length - 1)
                      ? _buildColourColumn(
                          transitionColourList[i], "yellow", sizeOfSquare)
                      : _buildColourColumn(
                          transitionColourList[i], "  ", sizeOfSquare),
          ],
        ),
      ],
    );
  }

  Widget _buildChromaColours(double sizeOfSquare) {
    List<Color> chromaColourList = [
      Color(0xffc9c9c9),
      Color(0xffCFC6C8),
      Color(0xffD4C5C7),
      Color(0xffDBC3C5),
      Color(0xffE0C1C4),
      Color(0xffE6BEC3),
      Color(0xffEBBDC3),
      Color(0xffF1BBC2),
      Color(0xffF6B8C1),
      Color(0xffFBB7C0),
    ];
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Saturation/Chroma: Colour Mix uses size to represent saturation/chroma",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < chromaColourList.length; i++)
              (i == 0)
                  ? _buildColourColumn(
                      chromaColourList[i], "low saturation", sizeOfSquare)
                  : (i == chromaColourList.length - 1)
                      ? _buildColourColumn(
                          chromaColourList[i], "high saturation", sizeOfSquare)
                      : _buildColourColumn(
                          chromaColourList[i], "  ", sizeOfSquare),
          ],
        ),
      ],
    );
  }

  Widget _buildBrownColour(double sizeOfSquare) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Brown",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        _buildColourSwatch(Color(0xff4d2b0c), sizeOfSquare),
        // Row(
        //   children: [
        //     //_buildColourSwatch(Color(0xff450c0c), sizeOfSquare),
        //     _buildColourSwatch(Color(0xff4d2b0c), sizeOfSquare),
        //     //_buildColourSwatch(Color(0xff45420a), sizeOfSquare),
        //   ],
        // ),
      ],
    );
  }

  Widget _buildColorMixEquations(
    Color colourOne,
    String colourOneName,
    Color colourTwo,
    String colourTwoName,
    Color colourThree,
    String colourThreeName,
    double sizeOfSquare,
  ) {
    // if(colourThreeName == "YellowGreen") {

    // }
    return Row(
      children: [
        _buildColourColumn(colourOne, colourOneName, sizeOfSquare),
        Center(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "+",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        _buildColourColumn(colourTwo, colourTwoName, sizeOfSquare),
        Center(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "=",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        _buildColourColumn(colourThree, colourThreeName, sizeOfSquare),
      ],
    );
  }

  Widget _buildColourColumn(
      Color color, String colourName, double sizeOfSquare) {

    if(colourName == "YellowGreen") {
      return Column(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Column(
            children: [
              Text(
                "Yellow-",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "Green",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        _buildColourSwatch(color, sizeOfSquare),
      ],
    );
    } else {
      return Column(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Column(
            children: [
              Text(
                " ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                colourName,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        _buildColourSwatch(color, sizeOfSquare),
      ],
    );
    }
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            colourName,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        _buildColourSwatch(color, sizeOfSquare),
      ],
    );
  }

  Widget _buildColourSwatch(Color color, double sizeOfSquare) {
    return Container(
      width: sizeOfSquare,
      height: sizeOfSquare,
      color: color,
      child: ColourMixerWidget(
        color: color,
        square: sizeOfSquare,
      ),
    );
  }
}
