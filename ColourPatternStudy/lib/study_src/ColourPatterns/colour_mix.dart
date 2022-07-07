import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:hsluv/hsluv.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_namer.dart';
//import 'package:observationStudyScaffold/study_src/colour_namer_model.dart';

class ColourMix extends CustomPainter {
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
  ColourMix({
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
    if (hue >= 0 && hue <= 5) {
      if(isOpacity)
        redOpacity = 1;
      else {
        redOpacity = 1;
        redWidth *= 10;
      }
        
    } else if (hue > 5 && hue <= 10) {
      // if(isOpacity) {
      //   redOpacity = 0.9;
      //   yellowOpacity = 0;
      // } else {
      //   redOpacity = 1;
      //   redWidth *= 9;
      // }
      if(isOpacity)
        redOpacity = 1;
      else {
        redOpacity = 1;
        redWidth *= 10;
      }
      
    } else if (hue > 10 && hue <= 15) {
      // if(isOpacity) {
      //   redOpacity = 0.8;
      //   yellowOpacity = 0.15;
      // } else {
      //   redOpacity = 0.8;
      //   yellowOpacity = 0.15;
      //   redWidth *= 8;
      //   yellowWidth *= 1;
      // }
      if(isOpacity) {
        redOpacity = 0.8;
        yellowOpacity = 0.2;
      } else {
        redOpacity = 0.8;
        yellowOpacity = 0.2;
        redWidth *= 8;
        yellowWidth *= 2;
      }
      
    } else if (hue > 15 && hue <= 20) {
      // if(isOpacity) {
      //   redOpacity = 0.7;
      //   yellowOpacity = 0.3;
      // } else { 
      //   redOpacity = 0.7;
      //   yellowOpacity = 0.3;
      //   redWidth *= 7;
      //   yellowWidth *= 3;
      // }
       if(isOpacity) {
        redOpacity = 0.8;
        yellowOpacity = 0.2;
      } else { 
        redOpacity = 0.8;
        yellowOpacity = 0.2;
        redWidth *= 7;
        yellowWidth *= 3;
      }
      
    } else if (hue > 20 && hue <= 25) {
      // if(isOpacity) {
      //   redOpacity = 0.6;
      //   yellowOpacity = 0.45;
      // } else {
      //   redOpacity = 0.6;
      //   yellowOpacity = 0.45;
      //   redWidth *= 6;
      //   yellowWidth *= 4.5;
      // }

      if(isOpacity) {
        redOpacity = 0.6;
        yellowOpacity = 0.4;
      } else {
        redOpacity = 0.6;
        yellowOpacity = 0.4;
        redWidth *= 6;
        yellowWidth *= 4;
      }
      
    } else if (hue > 25 && hue <= 30) {
      // if(isOpacity) {
      //   redOpacity = 0.5;
      //   yellowOpacity = 0.5;
      // } else {
      //   redOpacity = 0.5;
      //   yellowOpacity = 0.5;
      //   redWidth *= 5;
      //   yellowWidth *= 5;
      // }
      if(isOpacity) {
        redOpacity = 0.6;
        yellowOpacity = 0.4;
      } else {
        redOpacity = 0.6;
        yellowOpacity = 0.4;
        redWidth *= 5;
        yellowWidth *= 5;
      }
      
    } else if (hue > 30 && hue <= 35) {
      // if(isOpacity) {
      //   redOpacity = 0.4;
      //   yellowOpacity = 0.75;
      // } else {
      //   redOpacity = 0.4;
      //   yellowOpacity = 0.75;
      //   redWidth *= 4;
      //   yellowWidth *= 7.5;
      // }

       if(isOpacity) {
        redOpacity = 0.4;
        yellowOpacity = 0.6;
      } else {
        redOpacity = 0.4;
        yellowOpacity = 0.6;
        redWidth *= 4;
        yellowWidth *= 6;
      }
      
    } else if (hue > 35 && hue <= 40) {
      // if(isOpacity) {
      //   redOpacity = 0.3;
      //   yellowOpacity = 0.9;
      // } else {
      //   redOpacity = 0.3;
      //   yellowOpacity = 0.9;
      //   redWidth *= 3;
      //   yellowWidth *= 9;
      // }

      if(isOpacity) {
        redOpacity = 0.4;
        yellowOpacity = 0.6;
      } else {
        redOpacity = 0.4;
        yellowOpacity = 0.6;
        redWidth *= 3;
        yellowWidth *= 7;
      }
      
    } else if (hue > 40 && hue <= 45) {
      // if(isOpacity) {
      //   redOpacity = 0.15;
      //   yellowOpacity = 1.0;
      // } else {
      //   redOpacity = 0.15;
      //   yellowOpacity = 1.0;
      //   redWidth *= 1.5;
      //   yellowWidth *= 10;
      // }

      if(isOpacity) {
        redOpacity = 0.2;
        yellowOpacity = 0.8;
      } else {
        redOpacity = 0.2;
        yellowOpacity = 0.8;
        redWidth *= 2;
        yellowWidth *= 8;
      }
      
    } else if (hue > 45 && hue <= 50) {
      // if(isOpacity) {
      //   redOpacity = 0.05;
      //   yellowOpacity = 1.0;
      // } else {
      //   redOpacity = 0.05;
      //   yellowOpacity = 1.0;
      //   redWidth *= 0;
      //   yellowWidth *= 10;
      // }
      
      if(isOpacity) {
        redOpacity = 0.2;
        yellowOpacity = 0.8;
      } else {
        redOpacity = 0.2;
        yellowOpacity = 0.8;
        redWidth *= 1;
        yellowWidth *= 9;
      }

    } else if (hue > 50 && hue <= 55) {
      // if(isOpacity) {
      //   redOpacity = 0;
      //   yellowOpacity = 1.0;
      // } else {
      //   redOpacity = 0.0;
      //   yellowOpacity = 1.0;
      //   redWidth *= 0;
      //   yellowWidth *= 10;
      // }

      if(isOpacity) {
        redOpacity = 0.2;
        yellowOpacity = 0.8;
      } else {
        redOpacity = 0.05;
        yellowOpacity = 0.95;
        redWidth *= 1;
        yellowWidth *= 9.5;
      }

    } else if (hue > 55 && hue <= 60) {
      // if(isOpacity) {
      //   redOpacity = 0;
      //   yellowOpacity = 1.0;
      // } else {
      //   redOpacity = 0.0;
      //   yellowOpacity = 1.0;
      //   redWidth *= 0;
      //   yellowWidth *= 10;
      // }
      if(isOpacity) {
        redOpacity = 0.0;
        yellowOpacity = 1.0;
      } else {
        redOpacity = 0.0;
        yellowOpacity = 1;
        redWidth *= 0;
        yellowWidth *= 10;
      }
    } else if (hue > 60 && hue <= 65) {
      // if(isOpacity) {
      //   yellowOpacity = 0.95;
      //   greenOpacity = 0.05;
      // } else {
      //   yellowOpacity = 0.95;
      //   greenOpacity = 0.05;
      //   yellowWidth *= 9.5;
      //   greenWidth *= 0.5;
      // }
      if(isOpacity) {
        redOpacity = 0.0;
        yellowOpacity = 1.0;
      } else {
        redOpacity = 0.0;
        yellowOpacity = 1;
        redWidth *= 0;
        yellowWidth *= 10;
      }
    }

    //YELLOW-GREEN TRANSFORMATION
    else if (hue > 65 && hue <= 70) {
      if(isOpacity) {
        yellowOpacity = 0.85;
        greenOpacity = 0.15;
      } else {
        yellowOpacity = 0.85;
        greenOpacity = 0.15;
        yellowWidth *= 9;
        greenWidth *= 1.5;
      }
      
    } else if (hue > 70 && hue <= 75) {
      

      if(isOpacity) {
        yellowOpacity = 0.6;
      greenOpacity = 0.3;
      } else {
        yellowOpacity = 0.6;
      greenOpacity = 0.3;
        yellowWidth *= 6;
        greenWidth *= 3;
      }
    } else if (hue > 75 && hue <= 80) {
      if(isOpacity) {
        yellowOpacity = 0.45;
      greenOpacity = 0.45;
      } else {
        yellowOpacity = 0.45;
      greenOpacity = 0.45;
        yellowWidth *= 4.5;
        greenWidth *= 4.5;
      }
    } else if (hue > 80 && hue <= 85) {
      if(isOpacity) {
        yellowOpacity = 0.3;
        greenOpacity = 0.6;
      } else {
        yellowOpacity = 0.3;
        greenOpacity = 0.6;
        yellowWidth *= 3;
        greenWidth *= 6;
      }
    } else if (hue > 85 && hue <= 90) {
      if(isOpacity) {
        yellowOpacity = 1;
      greenOpacity = 0.9;
      } else {
        yellowOpacity = 1;
      greenOpacity = 0.9;
        yellowWidth *= 1;
        greenWidth *= 9;
      }
    } else if (hue > 90 && hue <= 145) {
      if(isOpacity) {
        yellowOpacity = 0.0;
      greenOpacity = 1.0;
      } else {
        yellowOpacity = 0.0;
        greenOpacity = 1.0;
        yellowWidth *= 0;
        greenWidth *= 10;
      }
    }

    //GREEN-BLUE TRANSFORMATION
    else if (hue > 145 && hue <= 150) {
      if(isOpacity) {
        greenOpacity = 0.9;
        blueOpacity = 0.1;
      } else {
        greenOpacity = 0.9;
        blueOpacity = 0.1;
        greenWidth *= 9;
        blueWidth *= 1;
      }
      
    } else if (hue > 150 && hue <= 155) {
      
      if(isOpacity) {
        greenOpacity = 0.8;
      blueOpacity = 0.2;
      } else {
       greenOpacity = 0.8;
      blueOpacity = 0.2;
        greenWidth *= 8;
        blueWidth *= 2;
      }
    } else if (hue > 155 && hue <= 160) {
      
      if(isOpacity) {
        greenOpacity = 0.7;
      blueOpacity = 0.3;
      } else {
        greenOpacity = 0.7;
      blueOpacity = 0.3;
        greenWidth *= 7;
        blueWidth *= 3;
      }
    } else if (hue > 160 && hue <= 165) {
      if(isOpacity) {
        greenOpacity = 0.6;
      blueOpacity = 0.4;
      } else {
         greenOpacity = 0.6;
      blueOpacity = 0.4;
        greenWidth *= 6;
        blueWidth *= 4;
      }
    } else if (hue > 165 && hue <= 170) {
      if(isOpacity) {
        greenOpacity = 0.5;
      blueOpacity = 0.5;
      } else {
        greenOpacity = 0.5;
      blueOpacity = 0.5;
        greenWidth *= 5;
        blueWidth *= 5;
      }
    } else if (hue > 170 && hue <= 175) {
      if(isOpacity) {
        greenOpacity = 0.4;
      blueOpacity = 0.6;
      } else {
        greenOpacity = 0.4;
      blueOpacity = 0.6;
        greenWidth *= 4;
        blueWidth *= 6;
      }
    } else if (hue > 175 && hue <= 180) {
      if(isOpacity) {
        greenOpacity = 0.3;
      blueOpacity = 0.7;
      } else {
        greenOpacity = 0.3;
      blueOpacity = 0.7;
        greenWidth *= 3;
        blueWidth *= 7;
      }
    } else if (hue > 180 && hue <= 185) {
      if(isOpacity) {
        greenOpacity = 0.2;
      blueOpacity = 0.8;
      } else {
        greenOpacity = 0.2;
      blueOpacity = 0.8;
        greenWidth *= 2;
        blueWidth *= 8;
      }
    } else if (hue > 185 && hue <= 190) {
      if(isOpacity) {
        greenOpacity = 0.1;
      blueOpacity = 0.9;
      } else {
        greenOpacity = 0.1;
      blueOpacity = 0.9;
        greenWidth *= 1;
        blueWidth *= 9;
      }
    } else if (hue > 190 && hue <= 195) {
      if(isOpacity) {
        greenOpacity = 0;
      blueOpacity = 1.0;
      } else {
        greenOpacity = 0.0;
        blueOpacity = 1.0;
        greenWidth *= 0;
        blueWidth *= 10;
      }
    } else if (hue > 195 && hue <= 200) {
      if(isOpacity) {
        greenOpacity = 0;
      blueOpacity = 1.0;
      } else {
        greenOpacity = 0.0;
        blueOpacity = 1.0;
        greenWidth *= 0;
        blueWidth *= 10;
      }
    } else if (hue > 200 && hue <= 245) {
      if(isOpacity) {
        greenOpacity = 0;
      blueOpacity = 1.0;
      } else {
        greenOpacity = 0.0;
        blueOpacity = 1.0;
        greenWidth *= 0;
        blueWidth *= 10;
      }
    }

    //BLUE-RED TRANSFORMATION

    else if (hue > 245 && hue <= 250) {

      if(isOpacity) {
        blueOpacity = 0.95;
      redOpacity = 0.05;
      } else {
        blueOpacity = 0.95;
      redOpacity = 0.05;
        redWidth *= 0.5;
        blueWidth *= 9.5;
      }
    } else if (hue > 250 && hue <= 265) {
      if(isOpacity) {
        blueOpacity = 0.9;
      redOpacity = 0.1;
      } else {
       blueOpacity = 0.9;
      redOpacity = 0.1;
        redWidth *= 1.0;
        blueWidth *= 9;
      }
    } else if (hue > 265 && hue <= 270) {
      if(isOpacity) {
        blueOpacity = 0.85;
      redOpacity = 0.15;
      } else {
        blueOpacity = 0.85;
      redOpacity = 0.15;
        redWidth *= 1.5;
        blueWidth *= 8.5;
      }
    } else if (hue > 270 && hue <= 275) {
      if(isOpacity) {
        blueOpacity = 0.8;
      redOpacity = 0.2;
      } else {
        blueOpacity = 0.8;
      redOpacity = 0.2;
        redWidth *= 2;
        blueWidth *= 8;
      }
    } else if (hue > 275 && hue <= 280) {
      if(isOpacity) {
        blueOpacity = 0.75;
      redOpacity = 0.25;
      } else {
        blueOpacity = 0.75;
      redOpacity = 0.25;
        redWidth *= 2.5;
        blueWidth *= 7.5;
      }
    } else if (hue > 280 && hue <= 285) {
      if(isOpacity) {
        blueOpacity = 0.7;
      redOpacity = 0.3;
      } else {
         blueOpacity = 0.7;
      redOpacity = 0.3;
        redWidth *= 3;
        blueWidth *= 7;
      }
    } else if (hue > 285 && hue <= 290) {
      if(isOpacity) {
        blueOpacity = 0.65;
      redOpacity = 0.35;
      } else {
        blueOpacity = 0.65;
      redOpacity = 0.35;
        redWidth *= 3.5;
        blueWidth *= 6.5;
      }
    } else if (hue > 290 && hue <= 295) {
      if(isOpacity) {
        blueOpacity = 0.6;
      redOpacity = 0.4;
      } else {
        blueOpacity = 0.6;
      redOpacity = 0.4;
        redWidth *= 4;
        blueWidth *= 6;
      }
    } else if (hue > 295 && hue <= 300) {
      if(isOpacity) {
        blueOpacity = 0.55;
      redOpacity = 0.45;
      } else {
        blueOpacity = 0.55;
      redOpacity = 0.45;
        redWidth *= 4.5;
        blueWidth *= 5.5;
      }
    } else if (hue > 300 && hue <= 305) {
      if(isOpacity) {
        blueOpacity = 0.5;
      redOpacity = 0.5;
      } else {
        blueOpacity = 0.5;
      redOpacity = 0.5;
        redWidth *= 5;
        blueWidth *= 5;
      }
    } else if (hue > 305 && hue <= 310) {

      if(isOpacity) {
        blueOpacity = 0.45;
      redOpacity = 0.55;
      } else {
        blueOpacity = 0.45;
      redOpacity = 0.55;
        redWidth *= 5.5;
        blueWidth *= 4.5;
      }
    } else if (hue > 310 && hue <= 315) {
      if(isOpacity) {
        blueOpacity = 0.4;
      redOpacity = 0.6;
      } else {
        blueOpacity = 0.4;
      redOpacity = 0.6;
        redWidth *= 6;
        blueWidth *= 4;
      }
    } else if (hue > 315 && hue <= 320) {
      if(isOpacity) {
        blueOpacity = 0.35;
      redOpacity = 0.65;
      } else {
        blueOpacity = 0.35;
      redOpacity = 0.65;
        redWidth *= 6.5;
        blueWidth *= 3.5;
      }
    } else if (hue > 320 && hue <= 325) {
      if(isOpacity) {
        blueOpacity = 0.3;
      redOpacity = 0.7;
      } else {
        blueOpacity = 0.3;
      redOpacity = 0.7;
        redWidth *= 7;
        blueWidth *= 3;
      }
    } else if (hue > 325 && hue <= 330) {
      if(isOpacity) {
        blueOpacity = 0.25;
      redOpacity = 0.75;
      } else {
        blueOpacity = 0.25;
      redOpacity = 0.75;
        redWidth *= 7.5;
        blueWidth *= 2.5;
      }
    } else if (hue > 330 && hue <= 335) {
      if(isOpacity) {
        blueOpacity = 0.2;
      redOpacity = 0.8;
      } else {
        blueOpacity = 0.2;
      redOpacity = 0.8;
        redWidth *= 8;
        blueWidth *= 2;
      }
    } else if (hue > 335 && hue <= 340) {

      if(isOpacity) {
        blueOpacity = 0.15;
      redOpacity = 0.85;
      } else {
        blueOpacity = 0.15;
      redOpacity = 0.85;
        redWidth *= 8.5;
        blueWidth *= 1.5;
      }
    } else if (hue > 340 && hue <= 345) {
      if(isOpacity) {
        blueOpacity = 0.1;
      redOpacity = 0.9;
      } else {
        blueOpacity = 0.1;
      redOpacity = 0.9;
        redWidth *= 9;
        blueWidth *= 1;
      }
    } else if (hue > 345 && hue <= 350) {

      if(isOpacity) {
        blueOpacity = 0.05;
      redOpacity = 0.95;
      } else {
        blueOpacity = 0.05;
      redOpacity = 0.95;
        redWidth *= 9.5;
        blueWidth *= 0.5;
      }
    } else if (hue > 350 && hue <= 355) {

      if(isOpacity) {
        blueOpacity = 0.0;
      redOpacity = 1;
      } else {
        blueOpacity = 0.0;
      redOpacity = 1;
        redWidth *= 10;
        blueWidth *= 0;
      }
    } else {
      if(isOpacity) {
        blueOpacity = 0.0;
      redOpacity = 1;
      } else {
        blueOpacity = 0.0;
      redOpacity = 1;
        redWidth *= 10;
        blueWidth *= 0;
      }
    }

    //if (hsl.saturation <= 0.10 || hsl.lightness > 0.90) {
    if (hsl.lightness > 0.90) {
      redOpacity = 0; //r/255;
      greenOpacity = 0; //g/255;
      blueOpacity = 0; //b/255;
      yellowOpacity = 0;
    }

    if (tutorialPresets == 1) {
      // redOpacity = 1;
      // yellowOpacity = 1;
    } else if (tutorialPresets == 2) {
      // yellowOpacity = 1;
      // greenOpacity = 1;
    } else if (tutorialPresets == 3) {
      // greenOpacity = 1;
      // blueOpacity = 1;
    } else if (tutorialPresets == 4) {
      // blueOpacity = 1;
      // redOpacity = 1;
    }

    String colName = ColourNamer(hsl.toColor()).getName();
    if (colName == 'pink') {
      redOpacity = 0;
      yellowOpacity = 0;
      greenOpacity = 0;
      blueOpacity = 0;
      pinkOpacity = 1;
    } else if (colName == 'brown') {
      brownOpacity = 1;
    }

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
    

    // if(square == 0) {
    //   redWidth = wid;
    //   yellowWidth = lineWidth;
    //   greenWidth = lineWidth;
    //   blueWidth = lineWidth;
    // }

    // if (colName == 'brown') {
    //   width = 1.0;
    // }
    // else if(colName == 'orange') {
    //   width = 3;
    // } else if(colName == 'yellow') {
    //   width = 5;
    // } else if(colName == 'green') {
    //   width = 7;
    // } else if(colName == 'teal') {
    //   width = 9;
    // } else if(colName == 'blue') {
    //   width = 11;
    // } else if(colName == 'purple') {
    //   width = 13;
    // } else if(colName == 'pink') {
    //   width = 15;
    // } else if(colName == 'red') {
    //   width = 17;
    // }

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

    if (brownOpacity > 0) {
      brownPattern(canvas, size, brownPaint, padValue);
    }

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
      if (redOpacity > yellowOpacity || redOpacity > blueOpacity) {
        if (yellowOpacity > 0) {
          yellowPattern(canvas, size, yellowPaint, padValue);
        } else if (blueOpacity > 0) {
          bluePattern2(canvas, size, bluePaint, padValue);
        }
        redPattern(canvas, size, redPaint, padValue);
      } else if (redOpacity < blueOpacity) {
        redPattern(canvas, size, redPaint, padValue);
        bluePattern2(canvas, size, bluePaint, padValue);
      } else {
        redPattern(canvas, size, redPaint, padValue);
        yellowPattern(canvas, size, yellowPaint, padValue);
      }
    } else if (yellowOpacity > 0) {
      if (yellowOpacity > greenOpacity) {
        if (greenOpacity > 0) {
          greenPattern(canvas, size, greenPaint, padValue);
        }
        yellowPattern(canvas, size, yellowPaint, padValue);
      } else {
        yellowPattern(canvas, size, yellowPaint, padValue);
        greenPattern(canvas, size, greenPaint, padValue);
      }
    } else if (greenOpacity > 0) {
      if (greenOpacity > blueOpacity) {
        if (blueOpacity > 0) {
          bluePattern3(canvas, size, bluePaint, padValue);
        }
        greenPattern(canvas, size, greenPaint, padValue);
      } else {
        greenPattern(canvas, size, greenPaint, padValue);
        bluePattern2(canvas, size, bluePaint, padValue);
      }
    } else if (blueOpacity > 0) {
      bluePattern2(canvas, size, bluePaint, padValue);
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
  bool shouldRepaint(ColourMix oldDelegate) => false;
}
