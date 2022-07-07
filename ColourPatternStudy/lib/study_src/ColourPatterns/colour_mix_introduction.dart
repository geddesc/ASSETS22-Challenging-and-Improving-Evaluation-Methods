import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:observationStudyScaffold/pages/ineligible_page.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_mix_widget.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_mixer_widget.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ColourMixIntroduction extends StatefulWidget {
  final Function onNext;
  ColourMixIntroduction({@required this.onNext});
  static const length = 6;

  @override
  _ColourMixIntroductionState createState() => _ColourMixIntroductionState();
}

class _ColourMixIntroductionState extends State<ColourMixIntroduction> {
  @override
  Widget build(BuildContext context) {
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
              widget.onNext();
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
              : ColourMixIntroduction2(onNext: widget.onNext);
        });
  }
}

class ColourMixIntroduction2 extends StatefulWidget {
  final Function onNext;
  ColourMixIntroduction2({@required this.onNext});
  static const length = 6;

  @override
  _ColourMixIntroductionState2 createState() => _ColourMixIntroductionState2();
}

class _ColourMixIntroductionState2 extends State<ColourMixIntroduction2> {
  //final pageIndexNotifier = ValueNotifier<int>(0);
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      elevation: 0,
      title: FittedBox(
        child: Text(
          "ColourMix Introduction",
          style: TextStyle(
            color: Colors.white,
            fontSize: DesignTheme.headerFontSize,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey[700],
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 1000,
            minWidth: 300,
          ),
          child: Column(
            //alignment: FractionalOffset.bottomCenter,
            children: <Widget>[
              Expanded(
                child: PageView(
                  controller: controller,
                  children: List.generate(6, (index) {
                    Widget child;
                    if (index == 0) {
                      child = _buildIntroCard();
                    } else if (index == 1) {
                      child = _buildSecondaryCard();
                    } else if (index == 2) {
                      child = _buildComplexColoursCard();
                    } else if (index == 3) {
                      child = _buildSaturationColoursCard();
                    } else if (index == 4) {
                      child = _buildAdditionalColoursCard();
                    } else {
                      child = _buildIntroCompletionCard();
                    }
                    return child;
                  }),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildBottomArrows(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 6,
                      effect: WormEffect(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroCard() {
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Text(
            "Basic Colours",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            "ColourMix is a colour pattern technique that utilizes four basic colour patterns: ",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColourSwatchExp("Red", Colors.red,
                        "You might associate this pattern with closing an application window."),
                  _buildColourSwatchExp("Yellow", Colors.yellow,
                        "You might associate this pattern with a lighting bolt."),
                  _buildColourSwatchExp("Green", Color(0xff79ff0b),
                        "You might associate this pattern with addition."),
                  _buildColourSwatchExp("Blue", Colors.blue,
                        "You might associate this pattern with an anchor in water."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryCard() {
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Text(
            "Secondary Colours",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            "ColourMix uses combinations of basic colours in order to represent secondary colours: ",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColourEquation("Red", Colors.red, "Yellow", Colors.yellow,
                    "Orange", Colors.orange),
                _buildColourEquation("Yellow", Colors.yellow, "Green",
                    Color(0xff79ff0b), "YellowGreen", Color(0xffc5db00)),
                _buildColourEquation("Green", Color(0xff79ff0b), "Blue",
                    Colors.blue, "Teal", Color(0xff00ad9d)),
                _buildColourEquation("Blue", Colors.blue, "Red", Colors.red,
                    "Purple", Color(0xff9800b3)),
              ],
            ),
          ),
          //_buildBottomArrows(),
        ],
      ),
    );
  }

  Widget _buildComplexColoursCard() {
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Text(
            "Complex Colours",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            "ColourMix uses transparency to illustrate the relative mix of more complicated colours (e.g., red-orange below): ",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColourSwatch(
                    "Red",
                    HSLColor.fromAHSL(1.0, 0, 1.0, 0.5).toColor(),
                  ),
                  _buildColourSwatch(
                    "",
                    HSLColor.fromAHSL(1.0, 15, 1.0, 0.5).toColor(),
                  ),
                  _buildColourSwatch(
                    "",
                    HSLColor.fromAHSL(1.0, 20, 1.0, 0.5).toColor(),
                  ),
                  _buildColourSwatch(
                    "",
                    HSLColor.fromAHSL(1.0, 25, 1.0, 0.5).toColor(),
                  ),
                  _buildColourSwatch(
                    "",
                    HSLColor.fromAHSL(1.0, 30, 1.0, 0.5).toColor(),
                  ),
                  _buildColourSwatch(
                    "",
                    HSLColor.fromAHSL(1.0, 35, 1.0, 0.5).toColor(),
                  ),
                  _buildColourSwatch(
                    "",
                    HSLColor.fromAHSL(1.0, 40, 1.0, 0.5).toColor(),
                  ),
                  _buildColourSwatch(
                    "",
                    HSLColor.fromAHSL(1.0, 45, 1.0, 0.5).toColor(),
                  ),
                  _buildColourSwatch(
                    "",
                    HSLColor.fromAHSL(1.0, 50, 1.0, 0.5).toColor(),
                  ),
                  _buildColourSwatch(
                    "Yellow",
                    HSLColor.fromAHSL(1.0, 60, 1.0, 0.5).toColor(),
                  ),
                ],
              ),
            ),
          ),
          //_buildBottomArrows(),
        ],
      ),
    );
  }

  Widget _buildSaturationColoursCard() {
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Text(
            "Saturation/Chroma",
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "ColourMix changes size depending on how rich/vibrant/saturated the represented colour is smaller implies lower saturation, larger implies higher saturation. Grey colours are shown using a very small or no symbol.",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColourSwatch(
                    "Pink",
                    Color(0xffFBB7C0),
                  ),
                  _buildColourSwatch(
                    "",
                    Color(0xffF6B8C1),
                  ),
                  _buildColourSwatch(
                    "",
                    Color(0xffF1BBC2),
                  ),
                  _buildColourSwatch(
                    "",
                    Color(0xffEBBDC3),
                  ),
                  _buildColourSwatch(
                    "",
                    Color(0xffE6BEC3),
                  ),
                  _buildColourSwatch(
                    "",
                    Color(0xffE0C1C4),
                  ),
                  _buildColourSwatch(
                    "",
                    Color(0xffDBC3C5),
                  ),
                  _buildColourSwatch(
                    "",
                    Color(0xffD4C5C7),
                  ),
                  _buildColourSwatch(
                    "",
                    Color(0xffCFC6C8),
                  ),
                  _buildColourSwatch(
                    "Grey",
                    Color(0xffc9c9c9),
                  ),
                ],
              ),
            ),
          ),
          //_buildBottomArrows(),
        ],
      ),
    );
  }

  Widget _buildAdditionalColoursCard() {
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Text(
            "Additional Colours",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            "ColourMix further represents the addtional colours of Pink, Brown, and Grey in the following ways: ",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildColourSwatchExp("Pink", Colors.pink[200],
                      "You migh associate this pattern with light red."),
                  _buildColourSwatchExp("Brown", Colors.brown,
                      "Brown is illustrated using a box. Brown Boxes can surround any other colour symbols present to show brown mixtures (e.g., red-brown, orange-brown)."),
                  _buildColourSwatchExp(
                      "Grey",
                      Color.fromRGBO(119, 119, 119, 1.0),
                      "Grey is shown using very small symbols or no symbol."),
                ],
              ),
            ),
          ),

          //_buildBottomArrows(),
        ],
      ),
    );
  }

  Widget _buildIntroCompletionCard() {
    return Card(
      color: Colors.grey,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "End of Introduction",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            "If you feel comfortable with colour mix please continue to the tutorial run of the colour selection task. Otherwise hit the back button to review ColourMix.",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildContinueButton(),
          ),
          //_buildBottomArrows(),
        ],
      ),
    );
  }

  Row _buildColourEquation(
      String colourNameOne,
      Color colorOne,
      String colourNameTwo,
      Color colorTwo,
      String colourNameThree,
      Color colorThree) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildColourSwatch(colourNameOne, colorOne),
        Text(
          "+",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        _buildColourSwatch(colourNameTwo, colorTwo),
        Text(
          "=",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        _buildColourSwatch(colourNameThree, colorThree),
      ],
    );
  }

  Widget _buildContinueButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTheme.defaultRadiusVal),
      ),
      color: DesignTheme.primaryColor,
      onPressed: () {
        widget.onNext();
      },
      child: Padding(
        padding: EdgeInsets.all(DesignTheme.mediumPadding),
        child: FittedBox(
          child: Text(
            'Continue',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: DesignTheme.titleFontSize,
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildBottomArrows() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              if (controller.page > 0) {
                controller.previousPage(
                    duration: Duration(milliseconds: 1), curve: Curves.linear);
                setState(() {});
              }
            },
            //child: Icon(Icons.arrow_back),
            child: Text(
              "<-",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (controller.page < 5) {
                controller.nextPage(
                    duration: Duration(milliseconds: 1), curve: Curves.linear);
                setState(() {});
              }
            },
            //child: Icon(Icons.arrow_forward),
            child: Text(
              "->",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColourSwatchExp(
      String colourName, Color color, String explanation) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              _buildColourSwatch(colourName, color),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 600,
                  minWidth: 300,
                ),
                child: Text(
                  explanation,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildColourSwatch(String colourName, Color color) {
    return Column(
      children: [
        Text(
          colourName,
          textAlign: TextAlign.center,
        ),
        Container(
          height: 50,
          width: 50,
          color: color,
          child: ColourMixerWidget(
            color: color,
            square: 50,
          ),
        ),
      ],
    );
  }
}
