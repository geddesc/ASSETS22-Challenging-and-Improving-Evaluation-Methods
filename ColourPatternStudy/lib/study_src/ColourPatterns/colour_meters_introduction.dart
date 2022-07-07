import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hsluv/hsluv.dart';
import 'package:observationStudyScaffold/pages/ineligible_page.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_meters_widget.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vector_math/vector_math.dart' show radians;

class ColourMetersIntroduction extends StatefulWidget {
  final Function onNext;
  ColourMetersIntroduction({@required this.onNext});

  @override
  _ColourMetersIntroductionState createState() =>
      _ColourMetersIntroductionState();
}

class _ColourMetersIntroductionState extends State<ColourMetersIntroduction> {
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
              : ColourMetersIntroduction2(onNext: widget.onNext);
        });
  }
}

class ColourMetersIntroduction2 extends StatefulWidget {
  final Function onNext;
  ColourMetersIntroduction2({@required this.onNext});

  @override
  _ColourMetersIntroductionState2 createState() =>
      _ColourMetersIntroductionState2();
}

class _ColourMetersIntroductionState2 extends State<ColourMetersIntroduction2> {
  final controller = PageController();
  var appBar = AppBar(
    backgroundColor: Colors.grey[700],
    elevation: 0,
    title: FittedBox(
      child: Text(
        'ColourMeters Introduction',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: DesignTheme.headerFontSize,
          color: Colors.white,
        ),
      ),
    ),
  );

  num degToRad(num deg) {
    return (deg * pi) / 180;
  }

  double multiplier = 200;
  double multiplier2 = 1;

  double getHueAngle(Color color) {
    final List<double> lch =
        Hsluv.rgbToLch([color.red / 255, color.green / 255, color.blue / 255]);
    double hue = lch[2];
    hue = 360 - hue;
    return hue;
  }

  @override
  Widget build(BuildContext context) {
    Widget bigCircle = Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
    );

    var height =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    var width = MediaQuery.of(context).size.width;
    double size = (height / 10);

    if (height > width) {
      multiplier2 = 1.3;
    }

    multiplier = height / 4;
    if (width < height) {
      multiplier = width / 4;
      size = width / 10;
    }

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
                  children: List.generate(3, (index) {
                    Widget child;
                    if (index == 0) {
                      child = _buildIntroCard(height, size);
                    } else if (index == 1) {
                      child = _buildSecondaryCard();
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
                      count: 3,
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

  Widget _buildIntroCard(double height, double size) {
    return Card(
      color: Colors.grey,
      child: Container(
        child: Column(
          children: [
            Text(
              "Determining Colours with ColourMeters",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              //color: Colors.white,
              width: double.infinity,
              height: (height / 1.5),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  _buildColourSwatch(
                      "yellow",
                      Colors.yellowAccent,
                      //0,
                      //270
                      getHueAngle(Colors.yellowAccent),
                      size),
                  _buildColourSwatch(
                      "orange",
                      Colors.orangeAccent,
                      //45,
                      //300,
                      getHueAngle(Colors.orangeAccent),
                      size),
                  _buildColourSwatch(
                      "brown",
                      Colors.brown,
                      //90,
                      //315,
                      getHueAngle(Colors.brown),
                      size),
                  _buildColourSwatch(
                      "red",
                      Colors.red,
                      //135,
                      //330,
                      getHueAngle(Colors.red),
                      size),
                  _buildColourSwatch(
                      "pink",
                      Colors.pink[200],
                      //0,
                      getHueAngle(Colors.pink[200]),
                      size),
                  _buildColourSwatch(
                      "teal",
                      Colors.teal,
                      //225,
                      //180
                      getHueAngle(Colors.teal),
                      size),
                  _buildColourSwatch(
                      "purple",
                      Colors.purple,
                      //45,
                      getHueAngle(Colors.purple),
                      size),
                  _buildColourSwatch(
                      "blue",
                      Colors.blue,
                      //135,
                      getHueAngle(Colors.blue),
                      size),
                  _buildColourSwatch(
                      "green",
                      Colors.lightGreenAccent,
                      //225,
                      getHueAngle(Colors.lightGreenAccent),
                      size),
                ],
              ),
            ),
            Expanded(
              child: Container(
                //color: Colors.red,
                child: Center(
                  child: Text(
                    "ColourMeters uses a meter (like a speedometer) to indicate the hue of the colour underneath each meter is shown above.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondaryCard() {
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
            "ColourMeters changes the meter length depending on how rich/vibrant/saturated the represented colour is: shorter implies lower saturation, longer implies higher saturation. Grey colours are shown using a very short or no line.",
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
                  _buildColourSwatch2(
                    "Pink",
                    Color(0xffFBB7C0),
                    //getHueAngle(Color(0xffFBB7C0)),
                  ),
                  _buildColourSwatch2(
                    "",
                    Color(0xffF6B8C1),
                    //getHueAngle(Color(0xffF6B8C1)),
                  ),
                  _buildColourSwatch2(
                    "",
                    Color(0xffF1BBC2),
                    //getHueAngle(Color(0xffF1BBC2),),
                  ),
                  _buildColourSwatch2(
                    "",
                    Color(0xffEBBDC3),
                    //getHueAngle(Color(0xffEBBDC3),)
                  ),
                  _buildColourSwatch2(
                    "",
                    Color(0xffE6BEC3),
                    //getHueAngle(Color(0xffE6BEC3),)
                  ),
                  _buildColourSwatch2(
                    "",
                    Color(0xffE0C1C4),
                    //getHueAngle(Color(0xffE0C1C4))
                  ),
                  _buildColourSwatch2(
                    "",
                    Color(0xffDBC3C5),
                    //getHueAngle(Color(0xffDBC3C5))
                  ),
                  _buildColourSwatch2(
                    "",
                    Color(0xffD4C5C7),
                    //getHueAngle(Color(0xffD4C5C7))
                  ),
                  _buildColourSwatch2(
                    "",
                    Color(0xffCFC6C8),
                    //getHueAngle(Color(0xffCFC6C8))
                  ),
                  _buildColourSwatch2(
                    "Grey",
                    Color(0xffc9c9c9),
                    //getHueAngle(Color(0xffCFC6C8)),
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
            "If you feel comfortable with colour meters please continue to the tutorial run of the colour selection task. Otherwise hit the back button to review ColourMeters.",
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
              if (controller.page < 3) {
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

  Column _buildColourSwatch2(String colourName, Color color) {
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
          child: ColourMetersWidget(
            color: color,
            square: 50,
          ),
        ),
      ],
    );
  }

  Widget _buildColourSwatch(
      String colourName, Color color, double angle, double size) {
    //print(size);
    var size2 = size / 1.5;
    // if(multiplier != multiplier2) {
    //   size2 = size / 1.5;
    // }
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          multiplier * cos(rad),
          multiplier * multiplier2 * sin(rad),
        ),
      child: SizedBox(
          height: size,
          width: size,
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  colourName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Container(
                height: size2 * 0.75,
                width: size2 * 0.75,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(),
                  onPressed: null,
                  backgroundColor: color,
                  child: ColourMetersWidget(color: color, square: size2 * 0.75),
                ),
              ),
            ],
          )),
    );
  }
}
