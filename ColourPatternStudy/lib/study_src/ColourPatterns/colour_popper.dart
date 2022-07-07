import 'package:flutter/material.dart';
import 'package:hsluv/hsluv.dart';
import 'package:observationStudyScaffold/study_src/ColourDictionary/colour_mix_dictionary_list.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_mix.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_namer.dart';

class ColourPopper extends StatelessWidget {
  final Color color;
  final double square; // square size

  ColourPopper({@required this.color, @required this.square});

  Color colorFilterValue = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    var rgb = ((color.red & int.parse("11111000", radix: 2)) << 8) |
        ((color.green & int.parse("11111100", radix: 2)) << 3) |
        (color.blue >> 3);

    //print("r = $r, g = $g, b = $b");
    // print("RGB Value: $rgb");

    Map<String, String> mixMap = colourMixList[rgb];
    //print("Colour mix mapping is $mixMap");
    var redOpacity = double.parse(mixMap['red']) / 100;
    var yellowOpacity = double.parse(mixMap['yellow']) / 100;
    var greenOpacity = double.parse(mixMap['green']) / 100;
    var blueOpacity = double.parse(mixMap['blue']) / 100;

    redOpacity += yellowOpacity / 2;
    greenOpacity += yellowOpacity / 2;

    var brownOpacity = double.parse(mixMap['brown']) / 100;
    var pinkOpacity = double.parse(mixMap['pink']) / 100;

    var divisor = 1;
    if (redOpacity > 0.5) {
      //if(redOpacity > 0.7) divisor = 1;
      colorFilterValue = Color.fromRGBO(
          ((redOpacity) * 255).toInt(),
          (greenOpacity * 255).toInt(),
          ((blueOpacity + redOpacity) * 255).toInt(),
          (blueOpacity + redOpacity/2) / divisor);
          //(redOpacity) / 4);
    }
    if (greenOpacity > 0.5) {
      //if(greenOpacity > 0.7) divisor = 1;
        colorFilterValue = Color.fromRGBO(
            (redOpacity * 255).toInt(),
            ((blueOpacity + greenOpacity/2) * 255).toInt(),
            ((blueOpacity + greenOpacity) * 255).toInt(),
            (blueOpacity + greenOpacity) / divisor);
            //(greenOpacity) / 4);
    }
    if (blueOpacity > 0.5) {
      //if(blueOpacity > 0.7) divisor = 1;
          colorFilterValue = Color.fromRGBO(
              (redOpacity * 255).toInt(),
              ((blueOpacity + greenOpacity) * 255).toInt(),
              ((blueOpacity + greenOpacity) * 255).toInt(),
              (blueOpacity/2 + greenOpacity) / divisor);
              //(blueOpacity) / 4);
    }
    if (pinkOpacity > 0.5) {
            colorFilterValue = Color.fromRGBO(
                ((pinkOpacity + redOpacity) * 255).toInt(),
                (greenOpacity * 255).toInt(),
                ((pinkOpacity/2 + blueOpacity) * 255).toInt(),
                (pinkOpacity + redOpacity) / 2);
    }
  

    // if (ColourNamer(color).getName() != 'pink' ||
    //     ColourNamer(color).getName() != 'brown' ||
    //     ColourNamer(color).getName() != 'grey') {

    //       // only pure reds and maybe red oranges
    //   if (redOpacity > greenOpacity && redOpacity > blueOpacity) {

    //         colorFilterValue = Color.fromRGBO(
    //         (blueOpacity * 255).toInt(),
    //         (greenOpacity * 255).toInt(),
    //         (redOpacity * 255).toInt(),
    //         (redOpacity) / 4);

    //   } else if (greenOpacity > blueOpacity) {
    //     colorFilterValue = Color.fromRGBO(
    //         (redOpacity * 255).toInt(),
    //         (blueOpacity * 255).toInt(),
    //         (greenOpacity * 255).toInt(),
    //         (greenOpacity) / 4);
    //   } else {
    //     colorFilterValue = Color.fromRGBO(
    //         (blueOpacity * 255).toInt(),
    //         (greenOpacity * 255).toInt(),
    //         (redOpacity * 255).toInt(),
    //         (blueOpacity) / 4);
    //   }
    // } else {
    //   if (ColourNamer(color).getName() == 'pink') {
    //     colorFilterValue = Color.fromRGBO(
    //         (blueOpacity * 255).toInt(),
    //         (greenOpacity * 255).toInt(),
    //         (redOpacity * 255).toInt(),
    //         (redOpacity + greenOpacity + blueOpacity) / 3);
    //   } else {
    //     colorFilterValue = Colors.transparent;
    //   }
    // }

    // if(ColourNamer(color).getName() == 'red') {
    //   colorFilterValue =   Color.fromRGBO((blueOpacity * 255).toInt(), (greenOpacity * 255).toInt(), (redOpacity * 255).toInt(), (redOpacity) / 4); //Color.fromRGBO(255 * redOpacity, 0, 255, 0.2);
    // } else if(ColourNamer(color).getName() == 'orange') {
    //   colorFilterValue =   Color.fromRGBO((blueOpacity * 255).toInt(), (greenOpacity * 255).toInt(), (redOpacity * 255).toInt(), (redOpacity + greenOpacity) / 3);
    // } else if(ColourNamer(color).getName() == 'yellow') {
    //   colorFilterValue =   Color.fromRGBO((blueOpacity * 255).toInt(), (greenOpacity * 255).toInt(), (redOpacity * 255).toInt(), (greenOpacity + redOpacity) / 3);
    // } else if(ColourNamer(color).getName() == 'green') {
    //   colorFilterValue =   Color.fromRGBO((redOpacity * 255).toInt(), (blueOpacity * 255).toInt(), (greenOpacity * 255).toInt(), (greenOpacity) / 4);
    // } else if(ColourNamer(color).getName() == 'teal') {
    //   colorFilterValue =   Color.fromRGBO((blueOpacity * 255).toInt(), (greenOpacity * 255).toInt(), (redOpacity * 255).toInt(), (blueOpacity + greenOpacity) / 3);
    // } else if(ColourNamer(color).getName() == 'blue') {
    //   colorFilterValue =   Color.fromRGBO((blueOpacity * 255).toInt(), (greenOpacity * 255).toInt(), (redOpacity * 255).toInt(), (blueOpacity) / 4);
    // } else if(ColourNamer(color).getName() == 'purple') {
    //   colorFilterValue =   Color.fromRGBO((blueOpacity * 255).toInt(), (greenOpacity * 255).toInt(), (redOpacity * 255).toInt(), (redOpacity + blueOpacity) / 3);
    // } else if(ColourNamer(color).getName() == 'pink') {
    //   colorFilterValue =   Color.fromRGBO((blueOpacity * 255).toInt(), (greenOpacity * 255).toInt(), (redOpacity * 255).toInt(), (redOpacity + greenOpacity + blueOpacity) / 3);
    // } else {
    //   colorFilterValue = Colors.transparent;
    // }

    return Container(
      height: square,
      width: square,
      color: colorFilterValue,
      //color: (ColourNamer(color).getName() == 'red' || ColourNamer(color).getName() == 'orange' || ColourNamer(color).getName() == 'yellow') ? Color.fromRGBO(0, 255, 255, 0.2) : (ColourNamer(color).getName() == 'green' || ColourNamer(color).getName() == 'teal' || ColourNamer(color).getName() == 'blue') ? Color.fromRGBO(255, 0, 0, 0.2)  : (ColourNamer(color).getName() == 'purple' || ColourNamer(color).getName() == 'pink') ? Color.fromRGBO(0, 255, 0, 0.2)  : Colors.transparent,//Colors.black87,
      // height: len,
      // width: len,
    );
  }
}
