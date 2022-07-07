import 'dart:math';
import 'package:hsluv/hsluv.dart';
import 'package:flutter/material.dart';

class ColourMeters extends CustomPainter {
  CustomPainter painter;
  int r;
  int g;
  int b;
  Size size;
  double padding;
  double satVal;
  double lineWidth;
  double square;
  ColourMeters({this.painter, this.r, this.g, this.b, this.size, this.padding, this.satVal = 1.0, this.lineWidth = 3.0, this.square});

  void paintPattern(Canvas canvas, Size size, Paint paint, double padValue) {
    //double padValue = 0;//size.width / 10;
    final p1 = Offset(padValue,padValue);
    final p2 = Offset(size.width-padValue, size.height-padValue);
    final p3 = Offset(padValue, size.height-padValue);
    final p4 = Offset(size.width-padValue, padValue);

  
    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p3, p4, paint);
  }

  num degToRad(num deg) {
    return (deg * pi) / 180;
  }

  @override
  void paint(Canvas canvas, Size size) {


    double padValue = padding;

    final List<double> lch = Hsluv.rgbToLch([r/255,g/255,b/255]);

    final List<double> xyz = Hsluv.rgbToXyz([r/255,g/255,b/255]);
    final List<double> luv = Hsluv.xyzToLuv(xyz);
    

    double u = luv[1];
    double v = luv[2];

    double ratio = 1;

    if(u > 0) {
      ratio = u / 224;
      ratio *= -90;
    } else {
      ratio = (u * -1) / 134;
      ratio *= 90;
    }
    ratio += 90;
    //print("r: $r g: $g b: $b -> l: ${luv[0]} u: ${luv[1]} v: ${luv[2]}");
    //Hsluv.xyzToLuv(tuple)
    Color paintColor = Colors.white;

    if(lch[0] >= 50.0 ) {
      paintColor = Colors.black;
    }

    
    
    // lch[2] += 15;
    // if(lch[2] > 360) lch[2] -= 360;
    double width = square/30;

    //if(lch[2] > 180) width /= 2;
    //double radius = 170;
    double radius = square/2;
    
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..color = paintColor;
    //hueRad /= 2;
    double len = min((2.0 * lch[1] / Hsluv.maxChromaForLH(lch[0], lch[2])) * radius, radius);
    double hue = ratio;//lch[2];

    double cutOff = 135.0;
    if(hue > cutOff) {
      hue = (((hue-cutOff) / (360.0-cutOff)) * (180.0-cutOff)) + cutOff;
    }
    // if(arr[i--] == 0) {
    //   arr[++i] = 1;
    // }
    //hue /= 2;
    double hueRad = degToRad(hue);
    //double hueRad = degToRad(lch[2]);
    int deltaX = (len * cos(hueRad)).round();
    int deltaY = (-1 * (len/2) * sin(hueRad)).round();
    final p1 = Offset(((size.width - padValue)/2) + deltaX, ((size.width-padValue)/2) + deltaY);
    final p2 = Offset(((size.width - padValue)/2), (size.width-padValue)/2);
    canvas.drawLine(p1, p2, paint);

  }

  @override
    bool shouldRepaint(ColourMeters oldDelegate) => false;

}
