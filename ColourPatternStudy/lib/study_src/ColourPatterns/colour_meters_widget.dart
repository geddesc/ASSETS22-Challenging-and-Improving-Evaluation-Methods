import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_meters.dart';

class ColourMetersWidget extends StatelessWidget {
  final Color color;
  final double square; // square size

  ColourMetersWidget({@required this.color, @required this.square});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: square,
        width: square,
        child: CustomPaint(
          painter: ColourMeters(
            r: color.red,
            g: color.green,
            b: color.blue,
            square: square,
            padding: 0,
          ),
        ),
      ),
    );
  }
}
