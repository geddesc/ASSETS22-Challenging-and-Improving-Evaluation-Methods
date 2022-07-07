import 'package:flutter/material.dart';
import 'package:hsluv/hsluv.dart';
import 'package:hsluv/hsluvcolor.dart';
import 'package:observationStudyScaffold/study_src/ColourPatterns/colour_meters.dart';
import 'dart:math';

class ColourSimulation extends StatelessWidget {
  final Color color;
  final double square;
  final int simulation_severity; // square size

  ColourSimulation({@required this.color, @required this.square, @required this.simulation_severity});

  @override
  Widget build(BuildContext context) {

    Color correctColor(Color color) {
    double r = color.red / 255;
  double g = color.green / 255;
  double b = color.blue / 255;

  // if (r > 0.0031308)	{ r = (1.055 * pow(r, 1.0/2.4)) - 0.055; }
	// 	else				{ r = 12.92 * r; }
	// 	if (g > 0.0031308)	{ g = (1.055 * pow(g, 1.0/2.4)) - 0.055; }
	// 	else				{ g = 12.92 * g; }
	// 	if (b > 0.0031308)	{ b = (1.055 * pow(b, 1.0/2.4)) - 0.055; }
	// 	else				{ b = 12.92 * b; }

  if ( r > 0.04045 ) {
    r = pow(( ( r + 0.055 ) / 1.055 ), 2.4).toDouble();
  } else {
    r = r / 12.92;
  }
  
   if(g > 0.04045) {
     g = pow(( ( g + 0.055 ) / 1.055 ), 2.4).toDouble();
  } else {
    g = g / 12.92;
  }
                   
if ( b > 0.04045 ){
  b = pow(( ( b + 0.055 ) / 1.055 ), 2.4).toDouble();
}  else {
  b = b / 12.92;
}
     

    return Color.fromRGBO((r * 255).toInt(), (g * 255).toInt(), (b * 255).toInt(), 1.0);
}

    var r = (Hsluv.toLinear(color.red / 255.0) * 255).toInt();
    var g = (Hsluv.toLinear(color.green / 255.0) * 255).toInt();
    var b = (Hsluv.toLinear(color.blue / 255.0) * 255).toInt();

    List<double> matrix = [];
    
    if(simulation_severity == 0) { // 0-3 is protan
      matrix = [ // Level 0 regular Vision
      1.0, 0.0, -0.0, 0.0, 0.0,
      0.0, 1.0, 0.0, 0.0, 0.0,
      -0.0, -0.0, 1.0, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
      ];
    } else if(simulation_severity == 1) { // 4-7 is deutan
      matrix = [
      1.000000,	0.000000,	-0.000000, 0.0, 0.0,
      0.000000,	1.000000,	0.000000, 0.0, 0.0,
      -0.000000, -0.000000,	1.000000, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
    ];
    } 
    
    // No Simulation Information
    else if(simulation_severity == 2) {
      matrix = [ // Level 0.3
      0.630323, 0.465641, -0.095964, 0.0, 0.0,
      0.069181, 0.890046, 0.040773, 0.0, 0.0,
      -0.006308, -0.007724, 1.014032, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
    ];
    } else if(simulation_severity == 3) {
      matrix = [ // Level 0.6
      0.385450, 0.769005, -0.154455, 0.0, 0.0,
      0.100526, 0.829802, 0.069673, 0.0, 0.0,
      -0.007442, -0.022190, 1.029632, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
     ];
    } else if(simulation_severity == 4){
      matrix = [ // Level 1.0
      0.152286,	1.052583,	-0.204868, 0.0, 0.0,
      0.114503,	0.786281,	0.099216, 0.0, 0.0,
      -0.003882,	-0.048116,	1.051998, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,

     ];
    } else if(simulation_severity == 5) { 
      matrix = [
       0.675425,	0.433850,	-0.109275, 0.0, 0.0,
      0.125303,	0.847755, 0.026942, 0.0, 0.0,
      -0.007950, 0.018572,	0.989378, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
      ];
    } else if(simulation_severity == 6) {
      matrix = [
      0.498864,	0.674741,	-0.173604, 0.0, 0.0,
      0.205199,	0.754872,	0.039929, 0.0, 0.0,
      -0.011131,	0.030969,	0.980162, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
      ];
    } else if(simulation_severity == 7) {
      matrix = [
      0.367322,	0.860646,	-0.227968, 0.0, 0.0,
      0.280085,	0.672501,	0.047413, 0.0, 0.0,
      -0.011820,	0.042940,	0.968881, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
    ];
    }
    
    // Min Simulation Information
    else if(simulation_severity == 8) {
      matrix = [ // Level 0.3
      0.630323, 0.465641, -0.095964, 0.0, 0.0,
      0.069181, 0.890046, 0.040773, 0.0, 0.0,
      -0.006308, -0.007724, 1.014032, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
    ];
    } else if(simulation_severity == 9) {
      matrix = [ // Level 0.6
      0.385450, 0.769005, -0.154455, 0.0, 0.0,
      0.100526, 0.829802, 0.069673, 0.0, 0.0,
      -0.007442, -0.022190, 1.029632, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
     ];
    } else if(simulation_severity == 10){
      matrix = [ // Level 1.0
      0.152286,	1.052583,	-0.204868, 0.0, 0.0,
      0.114503,	0.786281,	0.099216, 0.0, 0.0,
      -0.003882,	-0.048116,	1.051998, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
     ];
    } else if(simulation_severity == 11) { 
      matrix = [
       0.675425,	0.433850,	-0.109275, 0.0, 0.0,
      0.125303,	0.847755, 0.026942, 0.0, 0.0,
      -0.007950, 0.018572,	0.989378, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
      ];
    } else if(simulation_severity == 12) {
      matrix = [
      0.498864,	0.674741,	-0.173604, 0.0, 0.0,
      0.205199,	0.754872,	0.039929, 0.0, 0.0,
      -0.011131,	0.030969,	0.980162, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
      ];
    } else if(simulation_severity == 13) {
      matrix = [
      0.367322,	0.860646,	-0.227968, 0.0, 0.0,
      0.280085,	0.672501,	0.047413, 0.0, 0.0,
      -0.011820,	0.042940,	0.968881, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
    ];
    } 

    //MAX SIMULATION INFO
    else if(simulation_severity == 14) {
      matrix = [ // Level 0.3
      0.630323, 0.465641, -0.095964, 0.0, 0.0,
      0.069181, 0.890046, 0.040773, 0.0, 0.0,
      -0.006308, -0.007724, 1.014032, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
    ];
    } else if(simulation_severity == 15) {
      matrix = [ // Level 0.6
      0.385450, 0.769005, -0.154455, 0.0, 0.0,
      0.100526, 0.829802, 0.069673, 0.0, 0.0,
      -0.007442, -0.022190, 1.029632, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
     ];
    } else if(simulation_severity == 16){
      matrix = [ // Level 1.0
      0.152286,	1.052583,	-0.204868, 0.0, 0.0,
      0.114503,	0.786281,	0.099216, 0.0, 0.0,
      -0.003882,	-0.048116,	1.051998, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
     ];
    } else if(simulation_severity == 17) { 
      matrix = [
       0.675425,	0.433850,	-0.109275, 0.0, 0.0,
      0.125303,	0.847755, 0.026942, 0.0, 0.0,
      -0.007950, 0.018572,	0.989378, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
      ];
    } else if(simulation_severity == 18) {
      matrix = [
      0.498864,	0.674741,	-0.173604, 0.0, 0.0,
      0.205199,	0.754872,	0.039929, 0.0, 0.0,
      -0.011131,	0.030969,	0.980162, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
      ];
    } else if(simulation_severity == 19) {
      matrix = [
      0.367322,	0.860646,	-0.227968, 0.0, 0.0,
      0.280085,	0.672501,	0.047413, 0.0, 0.0,
      -0.011820,	0.042940,	0.968881, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0,
    ];
    }
    return ColorFiltered(
      colorFilter: ColorFilter.linearToSrgbGamma(),
      
     child: ColorFiltered(
       colorFilter: ColorFilter.matrix(
      //   [ 
      //   0.152286,	1.052583,	-0.204868, 0.0, 0.0,
      //   0.114503,	0.786281,	0.099216, 0.0, 0.0,
      //   -0.003882,	-0.048116,	1.051998, 0.0, 0.0,
      //   0.0, 0.0, 0.0, 1.0, 0.0,
      // ]
      matrix,
      ),
        child: Center(
          child: Container(
            // decoration: BoxDecoration(
            //   border: Border.all(color: color),
            //   color: color,
            // ),
            color: Color.fromRGBO(r, g, b, 1.0),//correctColor(color),
            height: square,
            width: square,
            
          ),
        ),
      ),
    );
  }
}
