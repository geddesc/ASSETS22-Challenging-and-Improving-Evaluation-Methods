import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:hsluv/hsluv.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_namer.dart';
import 'package:observationStudyScaffold/study_src/ColourDictionary/colour_mix_dictionary_list.dart';
//import 'package:observationStudyScaffold/study_src/colour_namer_model.dart';

class ColourMixer extends CustomPainter {
  CustomPainter painter;
  int r;
  int g;
  int b;
  Size size;
  double padding;
  double satVal;
  double lineWidth;
  double square;
  bool isTutorial;
  int tutorialPresets; // 0 for nothing,  1 for orange, 2 for yellowgreen, 3 for cyan and 4 for purple
  bool
      isOpacity; // true for transition via opacity or false for transition via line thickness
  ColourMixer({
    this.painter,
    this.r,
    this.g,
    this.b,
    this.size,
    this.padding,
    this.satVal = 1.0,
    this.lineWidth = 10.0,
    this.square,
    this.isTutorial = false,
    this.tutorialPresets = 0,
    this.isOpacity = true,
  });

  void redPattern(Canvas canvas, Size size, Paint paint, double padValue) {
    //double padValue = 0;//size.width / 10;
    final p1 = Offset(padValue, padValue);
    final p2 = Offset(size.width - padValue, size.height - padValue);
    final p3 = Offset(padValue, size.height - padValue);
    final p4 = Offset(size.width - padValue, padValue);

    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p3, p4, paint);
  }

  void pinkPattern(
      Canvas canvas, Size size, Paint paint, Paint paint2, double padValue) {
    //double padValue = 0;//size.width / 10;
    final p1 = Offset(padValue, padValue);
    final p2 = Offset(size.width - padValue, size.height - padValue);
    final p3 = Offset(padValue, size.height - padValue);
    final p4 = Offset(size.width - padValue, padValue);

    canvas.drawLine(p1, p2, paint2);
    canvas.drawLine(p3, p4, paint);
  }

  void brownPattern(Canvas canvas, Size size, Paint paint, double padValue) {
    //left vertical
    final p1 = Offset(padValue, padValue);
    final p2 = Offset(padValue, size.height - padValue);
    //final p2 = Offset(size.width-padValue, size.height-padValue);

    //right vertical
    final p3 = Offset(size.width - padValue, padValue);
    final p4 = Offset(size.width - padValue, size.height - padValue);

    //top horizontal
    final p5 = Offset(padValue, padValue);
    final p6 = Offset(size.width - padValue, padValue);

    //bottom horizontal
    final p7 = Offset(padValue, size.height - padValue);
    final p8 = Offset(size.width - padValue, size.height - padValue);

    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p3, p4, paint);
    canvas.drawLine(p5, p6, paint);
    canvas.drawLine(p7, p8, paint);
  }

  void yellowPattern(Canvas canvas, Size size, Paint paint, double padValue) {
    //double padValue = 0;//size.width / 20;
    // final p1 = Offset(((size.width - padValue)/2), padValue);
    // final p2 = Offset(padValue, ((size.height - padValue)/2));

    final p1 = Offset((size.width - padValue) / 2, padValue);
    final p2 = Offset(padValue, (size.height - padValue) / 2);

    final p3 = Offset(padValue, ((size.height - padValue) / 2));
    final p4 = Offset(size.width - padValue, ((size.height - padValue) / 2));

    final p5 = Offset(size.width - padValue, ((size.height - padValue) / 2));
    final p6 = Offset(((size.width - padValue) / 2), size.height - padValue);

    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p3, p4, paint);
    canvas.drawLine(p5, p6, paint);
  }

  void greenPattern(Canvas canvas, Size size, Paint paint, double padValue) {
    //double padValue = 0;//size.width / 20;
    final p1 = Offset(((size.width - padValue) / 2), padValue);
    final p2 = Offset(((size.width - padValue) / 2), size.width - padValue);
    final p3 = Offset(padValue, ((size.width - padValue) / 2));
    final p4 = Offset(size.height - padValue, ((size.width - padValue) / 2));

    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p3, p4, paint);
  }

  void bluePattern(Canvas canvas, Size size, Paint paint, double padValue) {
    //double padValue = 0;//size.width / 20;
    Path path = new Path();
    var val = 1.0;
    path.relativeMoveTo(padValue, ((size.height - padValue) / 2));
    path.relativeQuadraticBezierTo(((size.width - (2 * padValue)) / 4),
        val * (size.height / 2), ((size.width - (2 * padValue)) / 2), 0);
    path.relativeQuadraticBezierTo(((size.width - (2 * padValue)) / 4),
        -val * (size.height / 2), ((size.width - (2 * padValue)) / 2), 0);

    canvas.drawPath(path, paint);
  }

  void bluePattern2(Canvas canvas, Size size, Paint paint, double padValue) {
    Path path = new Path();
    var val = 1.0;
    final rect = Rect.fromLTRB(
        padValue, padValue, size.width - padValue, size.height - padValue);
    final startAngle = math.pi;
    final sweepAngle = -math.pi;
    final useCenter = false;
    // final paint = Paint()
    // ..color = Colors.black
    // ..style = PaintingStyle.stroke
    // ..strokeWidth = 1;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);

    final p1 = Offset(((size.width - padValue) / 2), 3 * padValue);
    final p2 = Offset(((size.width - padValue) / 2), size.width - padValue);

    final p3 =
        Offset(((size.width - padValue) / 3), ((size.height - padValue) / 3));
    final p4 =
        Offset((size.width - padValue) / 1.5, ((size.height - padValue) / 3));

    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p3, p4, paint);
  }

  void bluePattern3(Canvas canvas, Size size, Paint paint, double padValue) {
    Path path = new Path();
    var val = 1.0;
    final rect = Rect.fromLTRB(
        padValue, padValue, size.width - padValue, size.height - padValue);
    final startAngle = math.pi;
    final sweepAngle = -math.pi;
    final useCenter = false;
    // final paint = Paint()
    // ..color = Colors.black
    // ..style = PaintingStyle.stroke
    // ..strokeWidth = 1;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);

    // final p1 = Offset(((size.width - padValue)/2) , 3*padValue);
    // final p2 = Offset(((size.width - padValue)/2), size.width-padValue);

    final p3 =
        Offset(((size.width - padValue) / 3), ((size.height - padValue) / 3));
    final p4 =
        Offset((size.width - padValue) / 1.5, ((size.height - padValue) / 3));

    //canvas.drawLine(p1, p2, paint);
    //canvas.drawLine(p3, p4, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    double redOpacity = 0; //r/255;
    double greenOpacity = 0; //g/255;
    double blueOpacity = 0; //b/255;
    double yellowOpacity = 0; //r/255;
    double pinkOpacity = 0;
    double brownOpacity = 0;
    // if(redOpacity > 90 && redOpacity != 0) redOpacity = 0.05;
    // if(greenOpacity > 90 && greenOpacity != 0) greenOpacity = 0.05;
    // if(blueOpacity > 90 && blueOpacity != 0) blueOpacity = 0.05;
    var hsl = HSLColor.fromColor(Color.fromRGBO(r, g, b, 1));
    var hue = hsl.hue;

    //TODO: ADD LOGIC FOR PINK COLOURS
    //TODO: ADD LOGIC FOR BROWN COLOURS
    //TODO: ADD HEER & STONE PROBABILITY DISTRIBUTIONS


    //double redWidth = square / (15 * 4);
    double redWidth = square / (100 * 2);
    double pinkWidth = redWidth;
    double yellowWidth = redWidth / 1;
    double brownWidth = yellowWidth;
    double greenWidth = redWidth;
    double blueWidth = yellowWidth;

    // RED YELLOW TRANSFORMATION

    //if (hsl.saturation <= 0.10 || hsl.lightness > 0.90) {
    if (hsl.lightness > 0.90) {
      redOpacity = 0; //r/255;
      greenOpacity = 0; //g/255;
      blueOpacity = 0; //b/255;
      yellowOpacity = 0;
      brownOpacity = 0;
    }

    var rgb = ((r & int.parse("11111000", radix: 2)) << 8) |
        ((g & int.parse("11111100", radix: 2)) << 3) |
        (b >> 3);
    
    //print("r = $r, g = $g, b = $b");
   // print("RGB Value: $rgb");
        
    Map<String, String> mixMap = colourMixList[rgb];
    //print("Colour mix mapping is $mixMap");
    redOpacity = double.parse(mixMap['red']) / 100;
    yellowOpacity = double.parse(mixMap['yellow']) / 100;
    greenOpacity = double.parse(mixMap['green']) / 100;
    blueOpacity = double.parse(mixMap['blue']) / 100;
    brownOpacity = double.parse(mixMap['brown']) / 100;

    redWidth = redOpacity * 5;
    yellowWidth = yellowOpacity * 5;
    greenWidth = greenOpacity * 5;
    blueWidth = blueOpacity * 5;
    brownWidth = brownOpacity * 5;
  

    String colName = ColourNamer(hsl.toColor()).getName();
    if (colName == 'pink') {
      redOpacity = 0;
      yellowOpacity = 0;
      greenOpacity = 0;
      blueOpacity = 0;
      brownOpacity = 0;
      pinkOpacity = 1;
    } 
    // else if (colName == 'brown') {
    //   brownOpacity = 1;
    // }

    Color redPaintColor = Color.fromRGBO(0, 0, 0, redOpacity);
    Color yellowPaintColor = Color.fromRGBO(0, 0, 0, yellowOpacity);
    Color greenPaintColor = Color.fromRGBO(0, 0, 0, greenOpacity);
    Color bluePaintColor = Color.fromRGBO(0, 0, 0, blueOpacity);
    Color pinkPaintColor = Color.fromRGBO(0, 0, 0, pinkOpacity);
    Color pinkPaintColor2 = Color.fromRGBO(0, 0, 0, pinkOpacity);
    Color brownPaintColor = Color.fromRGBO(0, 0, 0, brownOpacity);

    final List<double> lch = Hsluv.rgbToLch([r / 255, g / 255, b / 255]);
    // redWidth = square / 100;
    

    pinkWidth = redWidth;
    if (hsl.lightness <= 0.05) {
      redOpacity = 0;
      yellowOpacity = 0;
      greenOpacity = 0;
      blueOpacity = 0;
    } else if (hsl.lightness <= 0.2) {
      redPaintColor = Color.fromRGBO(200, 200, 200, redOpacity);
      yellowPaintColor = Color.fromRGBO(200, 200, 200, yellowOpacity);
      greenPaintColor = Color.fromRGBO(200, 200, 200, greenOpacity);
      bluePaintColor = Color.fromRGBO(200, 200, 200, blueOpacity);
      pinkPaintColor = Color.fromRGBO(200, 200, 200, pinkOpacity); //CHANGE
      pinkPaintColor2 = Color.fromRGBO(200, 200, 200, pinkOpacity / 4);
      brownPaintColor = Color.fromRGBO(200, 200, 200, brownOpacity); // CHANGE
    }

    if (lch[0] >= 50.0) {
      redPaintColor = Color.fromRGBO(0, 0, 0, redOpacity);
      yellowPaintColor = Color.fromRGBO(0, 0, 0, yellowOpacity);
      greenPaintColor = Color.fromRGBO(0, 0, 0, greenOpacity);
      bluePaintColor = Color.fromRGBO(0, 0, 0, blueOpacity);
      pinkPaintColor = Color.fromRGBO(0, 0, 0, pinkOpacity); //CHANGE
      pinkPaintColor2 = Color.fromRGBO(0, 0, 0, pinkOpacity / 4);
      brownPaintColor = Color.fromRGBO(0, 0, 0, brownOpacity);
    } else {
      redPaintColor = Color.fromRGBO(255, 255, 255, redOpacity);
      yellowPaintColor = Color.fromRGBO(255, 255, 255, yellowOpacity);
      greenPaintColor = Color.fromRGBO(255, 255, 255, greenOpacity);
      bluePaintColor = Color.fromRGBO(255, 255, 255, blueOpacity);
      pinkPaintColor = Color.fromRGBO(255, 255, 255, pinkOpacity); //CHANGE
      pinkPaintColor2 = Color.fromRGBO(255, 255, 255, pinkOpacity / 4);
      brownPaintColor = Color.fromRGBO(255, 255, 255, brownOpacity);
    }

    double width = 1;
    


    double padValue = padding; //size.width / 50;
    satVal = hsl.saturation;
    //double width = lineWidth * satVal;
    //double width = (lineWidth * (lch[2] / 360) + 1);
    //padValue = 0.5;
    final redPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = redWidth
      ..color = redPaintColor;

    final pinkPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = pinkWidth
      ..color = pinkPaintColor;

    final pinkPaint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = pinkWidth
      ..color = pinkPaintColor2;

    final brownPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = brownWidth
      ..color = brownPaintColor;

    if (pinkOpacity > 0) {
      pinkPattern(canvas, size, pinkPaint2, pinkPaint, padValue);
    }

    // if (brownOpacity > 0) {
    //   brownPattern(canvas, size, brownPaint, padValue);
    // }

    final yellowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = yellowWidth
      ..color = yellowPaintColor;

    final greenPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = greenWidth
      ..color = greenPaintColor;

    final bluePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = blueWidth
      ..color = bluePaintColor;

    if (redOpacity > 0) {
      
        redPattern(canvas, size, redPaint, padValue);
    } 
    if (yellowOpacity > 0) {
      
        yellowPattern(canvas, size, yellowPaint, padValue);
      
    } 
    if (greenOpacity > 0) {
      
        greenPattern(canvas, size, greenPaint, padValue);
     
    } 
    if (blueOpacity > 0) {
      bluePattern2(canvas, size, bluePaint, padValue);
    }
    if(brownOpacity > 0) {
      brownPattern(canvas, size, brownPaint, padValue);
    }

    //  if(yellowOpacity > 0) {
    //    yellowPattern(canvas, size, yellowPaint, padValue);
    //  }

    //   if(greenOpacity > 0) {
    //     greenPattern(canvas, size, greenPaint, padValue);
    //   }

    //   if(blueOpacity > 0) {
    //     bluePattern2(canvas, size, bluePaint, padValue);
    //   }
  }

  @override
  bool shouldRepaint(ColourMixer oldDelegate) => false;
}
