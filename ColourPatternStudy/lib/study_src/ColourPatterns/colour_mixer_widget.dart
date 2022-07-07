import 'dart:math';

import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_mixer.dart';


class ColourMixerWidget extends StatelessWidget {
  final Color color;
  final double square; // square size

  ColourMixerWidget({@required this.color, @required this.square});

  @override
  Widget build(BuildContext context) {
    double saturationLevel = HSLColor.fromColor(color).saturation;
    // final List<double> lch = Hsluv.rgbToLch([color.red/255,color.green/255,color.blue/255]);
    // double newSquare = square / 2;
    // double len = min((2.0 * lch[1] / Hsluv.maxChromaForLH(lch[0], lch[2])) * newSquare, newSquare);
    double adjustedSquareSize = saturationLevel * square;

    return Center(
      child: Container(
        height: adjustedSquareSize,
        width: adjustedSquareSize,
        // height: len,
        // width: len,
        child: CustomPaint(
          painter: ColourMixer(
            r: color.red,
            g: color.green,
            b: color.blue,
            padding: 0,
            lineWidth: 10,
            square: adjustedSquareSize,
            isOpacity: false,
            // square: len, 
          ),
        ),
      ),
    );
  }
}
