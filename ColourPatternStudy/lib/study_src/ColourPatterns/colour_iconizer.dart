import 'dart:io';
//import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hsluv/hsluv.dart';
import 'package:observationStudyScaffold/study_src/ColourDictionary/colour_dictionary_list.dart';

class ColourIconizer {
  final Color color;
  // final String redAssetName =
  //       "https://colourpattern-acc0d.web.app/assets/images/redIcon.svg";
  final String redAssetName =
        "/images/redIcon.png";

  final String redDarkAssetName =
        "/images/redIconwhite.png";

  final String orangeAssetName =
        "/images/orange.png";

  final String orangeDarkAssetName =
        "/images/orangewhite.png";

  final String yellowAssetName =
        "/images/star.png";

  final String yellowDarkAssetName =
        "/images/starwhite.png";

  final String greenAssetName =
        "images/tree.png";

  final String greenDarkAssetName =
        "/images/treewhite.png";

  final String tealAssetName =
        "/images/nest.png";

  final String tealDarkAssetName =
        "/images/nestwhite.png";

  final String blueAssetName =
        "/images/drop.png";

  final String blueDarkAssetName =
        "/images/dropwhite.png";

  final String purpleAssetName =
        "/images/grapes.png";

  final String purpleDarkAssetName =
        "/images/grapeswhite.png";

  final String pinkAssetName =
        "/images/flamingo2.png";

  final String pinkDarkAssetName =
        "/images/flamingo2white.png";
  
  final String greyAssetName =
        "/images/mountains2.png";

  final String greyDarkAssetName =
        "/images/mountains2white.png";

  final String brownAssetName =
        "/images/poop.png";

  final String brownDarkAssetName =
        "images/poopwhite.png";


  ColourIconizer(this.color);

  Widget getImage([double square]) {
    var rgb = ((color.red & int.parse("11111000", radix: 2)) << 8) |
        ((color.green & int.parse("11111100", radix: 2)) << 3) |
        (color.blue >> 3);
    //var colourName = ColourDictionary.colourData[rgb];
    var colourName = colourDictionaryList[rgb];

    final List<double> lch =
        Hsluv.rgbToLch([color.red / 255, color.green / 255, color.blue / 255]);

    bool dark = false;

    if (lch[0] >= 50.0) {
      dark = false;
    } else {
      dark = true;
    }

    if (colourName == 'red') {
      if (dark)
        return Image.asset(
          redDarkAssetName,
        );
      return Image.asset(
        redAssetName,
      );

    } else if (colourName == 'orange') {
      if (dark)
        return Image.asset(
          orangeDarkAssetName,
        );
      return Image.asset(orangeAssetName);
    } else if (colourName == 'yellow') {
      if (dark)
        return Image.asset(
          yellowDarkAssetName,
        );
      return Image.asset(yellowAssetName);
    } else if (colourName == 'green') {
      if (dark)
        return Image.asset(
          greenDarkAssetName,
        );
      return Image.asset(
        greenAssetName,
      );
    } else if (colourName == 'teal') {
      if (dark)
        return Image.asset(
          tealDarkAssetName,
        );
      return Image.asset(tealAssetName);
    } else if (colourName == 'blue') {
      if (dark)
        return Image.asset(
          blueDarkAssetName,
        );
      return Image.asset(blueAssetName);
    } else if (colourName == 'purple') {
      if (dark)
        return Image.asset(
          purpleDarkAssetName,
        );
      return Image.asset(purpleAssetName);
    } else if (colourName == 'pink') {
      if (dark)
        return Image.asset(
          pinkDarkAssetName,
        );
      return Image.asset(pinkAssetName);
    } else if (colourName == 'grey') {
      if (dark)
        return Image.asset(
          greyDarkAssetName,
        );
      return Image.asset(greyAssetName);
    } else if (colourName == 'brown') {
      if (dark)
        return Image.asset(
          brownDarkAssetName,
        );
      return Image.asset(brownAssetName);
    } else {
      return Container();
    }
  }
}
class MyPainter extends CustomPainter {
  final Path path;
  final Color color;
  final bool showPath;
  MyPainter(this.path, this.color, {this.showPath = true});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;
    canvas.drawPath(path, paint);
    if (showPath) {
      var border = Paint()
        ..color = Colors.black
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke;
      canvas.drawPath(path, border);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
