import 'package:flutter/material.dart';
import 'package:hsluv/hsluv.dart';
import 'package:observationStudyScaffold/models/cvd_type.dart';

class ColourTransitionModel {
  final CvdType cvdType;
  final int colourCode;
  final bool isChroma;
  final int secondaryColourCode;

  List<Color> colourList;

  ColourTransitionModel({
    @required this.cvdType,
    @required this.colourCode,
    @required this.isChroma,
    @required this.secondaryColourCode,
  }) {
    if (cvdType == CvdType.protan) {
      if (isChroma) {
        if (colourCode == 0) {
          //Protan: Grey to Pink
          colourList = [
            // Color.fromRGBO(118, 118, 118, 1.0),
            // Color.fromRGBO(131, 114, 116, 1.0),
            // Color.fromRGBO(143, 110, 114, 1.0),
            // Color.fromRGBO(157, 104, 111, 1.0),
            // Color.fromRGBO(170, 97, 108, 1.0),
            // Color.fromRGBO(181, 91, 105, 1.0),
            // Color.fromRGBO(190, 85, 102, 1.0),
            // Color.fromRGBO(197, 79, 100, 1.0),
            // Color.fromRGBO(203, 74, 98, 1.0),
            // Color.fromRGBO(210, 67, 96, 1.0),

            HSLColor.fromAHSL(1.0, 240, 1.0, 0.5).toColor(),
            HSLColor.fromAHSL(1.0, 246.66, 1.0, 0.5).toColor(), // 6
            HSLColor.fromAHSL(1.0, 253.32, 1.0, 0.5).toColor(), // 7
            HSLColor.fromAHSL(1.0, 259.98, 1.0, 0.5).toColor(), // 6
            HSLColor.fromAHSL(1.0, 266.64, 1.0, 0.5).toColor(), // 7
            HSLColor.fromAHSL(1.0, 273.3, 1.0, 0.5).toColor(), // 6
            HSLColor.fromAHSL(1.0, 279.96, 1.0, 0.5).toColor(), // 7
            HSLColor.fromAHSL(1.0, 286.62, 1.0, 0.5).toColor(), // 6
            HSLColor.fromAHSL(1.0, 293.28, 1.0, 0.5).toColor(), // 7
            HSLColor.fromAHSL(1.0, 300, 1.0, 0.5).toColor(),
          ];
        } else {
          //Protan: Grey to Teal
          colourList = [
            Color.fromRGBO(118, 118, 118, 1.0),
            Color.fromRGBO(113, 120, 119, 1.0),
            Color.fromRGBO(108, 121, 120, 1.0),
            Color.fromRGBO(103, 122, 120, 1.0),
            Color.fromRGBO(99, 123, 121, 1.0),
            Color.fromRGBO(94, 124, 121, 1.0),
            Color.fromRGBO(90, 125, 122, 1.0),
            Color.fromRGBO(84, 126, 122, 1.0),
            Color.fromRGBO(79, 127, 123, 1.0),
            Color.fromRGBO(74, 127, 123, 1.0),
          ];
        }
      } else {
        if (colourCode == 0) {
          //PROTAN: BLUE TO PURPLE
          if (secondaryColourCode == 0) {
            colourList = [
              Color.fromRGBO(0, 0, 241, 1.0),
              Color.fromRGBO(49, 0, 236, 1.0),
              Color.fromRGBO(69, 0, 231, 1.0),
              Color.fromRGBO(83, 0, 228, 1.0),
              Color.fromRGBO(94, 0, 225, 1.0),
              Color.fromRGBO(103, 0, 222, 1.0),
              Color.fromRGBO(112, 0, 220, 1.0),
              Color.fromRGBO(119, 0, 218, 1.0),
              Color.fromRGBO(126, 0, 216, 1.0),
              Color.fromRGBO(133, 0, 215, 1.0),
            ];
          } else if (secondaryColourCode == 1) {
            colourList = [
              Color.fromRGBO(42, 42, 232, 1.0),
              Color.fromRGBO(63, 39, 229, 1.0),
              Color.fromRGBO(78, 36, 227, 1.0),
              Color.fromRGBO(90, 32, 224, 1.0),
              Color.fromRGBO(99, 29, 222, 1.0),
              Color.fromRGBO(108, 25, 220, 1.0),
              Color.fromRGBO(116, 20, 218, 1.0),
              Color.fromRGBO(123, 15, 216, 1.0),
              Color.fromRGBO(129, 8, 215, 1.0),
              Color.fromRGBO(135, 0, 213, 1.0),
            ];
          } else if (secondaryColourCode == 2) {
            colourList = [
              // Color.fromRGBO(63, 63, 234, 1.0),
              // Color.fromRGBO(78, 59, 232, 1.0),
              // Color.fromRGBO(89, 55, 230, 1.0),
              // Color.fromRGBO(99, 50, 228, 1.0),
              // Color.fromRGBO(108, 45, 226, 1.0),
              // Color.fromRGBO(116, 40, 224, 1.0),
              // Color.fromRGBO(123, 34, 223, 1.0),
              // Color.fromRGBO(129, 26, 221, 1.0),
              // Color.fromRGBO(135, 16, 219, 1.0),
              // Color.fromRGBO(141, 0, 217, 1.0),
              Color.fromRGBO(232, 232, 88, 1.0),
              Color.fromRGBO(221, 234, 88, 1.0),
              Color.fromRGBO(209, 237, 88, 1.0),
              Color.fromRGBO(197, 239, 88, 1.0),
              Color.fromRGBO(183, 241, 88, 1.0),
              Color.fromRGBO(169, 244, 88, 1.0),
              Color.fromRGBO(152, 246, 88, 1.0),
              Color.fromRGBO(133, 248, 88, 1.0),
              Color.fromRGBO(111, 250, 88, 1.0),
              Color.fromRGBO(80, 252, 88, 1.0),
            ];
          } else if (secondaryColourCode == 3) {
            colourList = [
              Color.fromRGBO(80, 80, 240, 1.0),
              Color.fromRGBO(92, 77, 238, 1.0),
              Color.fromRGBO(103, 73, 237, 1.0),
              Color.fromRGBO(112, 70, 235, 1.0),
              Color.fromRGBO(120, 66, 233, 1.0),
              Color.fromRGBO(127, 62, 232, 1.0),
              Color.fromRGBO(134, 58, 230, 1.0),
              Color.fromRGBO(141, 53, 228, 1.0),
              Color.fromRGBO(146, 48, 227, 1.0),
              Color.fromRGBO(152, 43, 225, 1.0),
            ];
          } else if (secondaryColourCode == 4) {
            colourList = [
              Color.fromRGBO(95, 95, 249, 1.0),
              Color.fromRGBO(106, 92, 247, 1.0),
              Color.fromRGBO(115, 89, 246, 1.0),
              Color.fromRGBO(123, 86, 244, 1.0),
              Color.fromRGBO(131, 83, 243, 1.0),
              Color.fromRGBO(138, 80, 241, 1.0),
              Color.fromRGBO(145, 77, 240, 1.0),
              Color.fromRGBO(151, 73, 238, 1.0),
              Color.fromRGBO(157, 70, 237, 1.0),
              Color.fromRGBO(162, 66, 235, 1.0),
            ];
          }
        } else if (colourCode == 1) {
          //PROTAN: RED TO BROWN

          if (secondaryColourCode == 0) {
            colourList = [
              Color.fromRGBO(120, 0, 0, 1.0),
              Color.fromRGBO(118, 7, 0, 1.0),
              Color.fromRGBO(115, 14, 0, 1.0),
              Color.fromRGBO(112, 19, 0, 1.0),
              Color.fromRGBO(110, 23, 0, 1.0),
              Color.fromRGBO(107, 26, 0, 1.0),
              Color.fromRGBO(105, 29, 0, 1.0),
              Color.fromRGBO(102, 32, 0, 1.0),
              Color.fromRGBO(99, 35, 0, 1.0),
              Color.fromRGBO(96, 37, 0, 1.0),
            ];
          } else if (secondaryColourCode == 1) {
            colourList = [
              Color.fromRGBO(133, 14, 14, 1.0),
              Color.fromRGBO(130, 21, 13, 1.0),
              Color.fromRGBO(128, 26, 11, 1.0),
              Color.fromRGBO(125, 31, 10, 1.0),
              Color.fromRGBO(122, 34, 8, 1.0),
              Color.fromRGBO(120, 38, 6, 1.0),
              Color.fromRGBO(117, 41, 5, 1.0),
              Color.fromRGBO(114, 44, 3, 1.0),
              Color.fromRGBO(111, 47, 2, 1.0),
              Color.fromRGBO(108, 49, 0, 1.0),
            ];
          } else if (secondaryColourCode == 2) {
            colourList = [
              // Color.fromRGBO(147, 34, 34, 1.0),
              // Color.fromRGBO(144, 38, 33, 1.0),
              // Color.fromRGBO(142, 42, 31, 1.0),
              // Color.fromRGBO(139, 45, 30, 1.0),
              // Color.fromRGBO(136, 48, 28, 1.0),
              // Color.fromRGBO(133, 51, 27, 1.0),
              // Color.fromRGBO(130, 53, 25, 1.0),
              // Color.fromRGBO(127, 56, 24, 1.0),
              // Color.fromRGBO(124, 58, 22, 1.0),
              // Color.fromRGBO(121, 60, 20, 1.0),

              Color.fromRGBO(192, 0, 0, 1.0),
              Color.fromRGBO(182, 34, 4, 1.0),
              Color.fromRGBO(171, 49, 7, 1.0),
              Color.fromRGBO(160, 60, 11, 1.0),
              Color.fromRGBO(148, 69, 14, 1.0),
              Color.fromRGBO(135, 77, 16, 1.0),
              Color.fromRGBO(121, 84, 19, 1.0),
              Color.fromRGBO(104, 90, 21, 1.0),
              Color.fromRGBO(84, 95, 22, 1.0),
              Color.fromRGBO(56, 100, 24, 1.0),
            ];
          } else if (secondaryColourCode == 3) {
            colourList = [
              Color.fromRGBO(160, 49, 49, 1.0),
              Color.fromRGBO(157, 52, 48, 1.0),
              Color.fromRGBO(155, 55, 47, 1.0),
              Color.fromRGBO(152, 58, 46, 1.0),
              Color.fromRGBO(149, 61, 45, 1.0),
              Color.fromRGBO(146, 63, 44, 1.0),
              Color.fromRGBO(143, 66, 43, 1.0),
              Color.fromRGBO(140, 68, 41, 1.0),
              Color.fromRGBO(137, 70, 40, 1.0),
              Color.fromRGBO(134, 72, 39, 1.0),
            ];
          } else if (secondaryColourCode == 4) {
            colourList = [
              Color.fromRGBO(174, 63, 63, 1.0),
              Color.fromRGBO(171, 66, 62, 1.0),
              Color.fromRGBO(168, 69, 61, 1.0),
              Color.fromRGBO(165, 71, 60, 1.0),
              Color.fromRGBO(163, 74, 59, 1.0),
              Color.fromRGBO(160, 76, 58, 1.0),
              Color.fromRGBO(156, 79, 57, 1.0),
              Color.fromRGBO(153, 81, 56, 1.0),
              Color.fromRGBO(150, 83, 55, 1.0),
              Color.fromRGBO(147, 85, 54, 1.0),
            ];
          }
        } else {
          //PROTAN: ORANGE TO GREEN

          if (secondaryColourCode == 0) {
            colourList = [
              Color.fromRGBO(217, 137, 0, 1.0),
              Color.fromRGBO(206, 143, 6, 1.0),
              Color.fromRGBO(194, 148, 12, 1.0),
              Color.fromRGBO(181, 153, 17, 1.0),
              Color.fromRGBO(168, 158, 21, 1.0),
              Color.fromRGBO(152, 162, 25, 1.0),
              Color.fromRGBO(134, 167, 28, 1.0),
              Color.fromRGBO(113, 171, 30, 1.0),
              Color.fromRGBO(85, 175, 33, 1.0),
              Color.fromRGBO(35, 179, 35, 1.0),
            ];
          } else if (secondaryColourCode == 1) {
            colourList = [
              Color.fromRGBO(231, 152, 15, 1.0),
              Color.fromRGBO(220, 157, 24, 1.0),
              Color.fromRGBO(208, 162, 31, 1.0),
              Color.fromRGBO(195, 167, 36, 1.0),
              Color.fromRGBO(181, 172, 41, 1.0),
              Color.fromRGBO(165, 176, 45, 1.0),
              Color.fromRGBO(147, 181, 49, 1.0),
              Color.fromRGBO(126, 185, 53, 1.0),
              Color.fromRGBO(100, 189, 56, 1.0),
              Color.fromRGBO(59, 193, 59, 1.0),
            ];
          } else if (secondaryColourCode == 2) {
            colourList = [
              // Color.fromRGBO(246, 165, 51, 1.0),
              // Color.fromRGBO(234, 170, 55, 1.0),
              // Color.fromRGBO(222, 176, 58, 1.0),
              // Color.fromRGBO(209, 181, 62, 1.0),
              // Color.fromRGBO(195, 185, 65, 1.0),
              // Color.fromRGBO(179, 190, 68, 1.0),
              // Color.fromRGBO(161, 194, 70, 1.0),
              // Color.fromRGBO(140, 199, 73, 1.0),
              // Color.fromRGBO(114, 203, 76, 1.0),
              // Color.fromRGBO(78, 207, 78, 1.0),

              // Color.fromRGBO(248, 12, 0, 1.0),
              // Color.fromRGBO(246, 30, 0, 1.0),
              // Color.fromRGBO(243, 41, 0, 1.0),
              // Color.fromRGBO(241, 50, 0, 1.0),
              // Color.fromRGBO(238, 57, 0, 1.0),
              // Color.fromRGBO(235, 63, 0, 1.0),
              // Color.fromRGBO(233, 69, 0, 1.0),
              // Color.fromRGBO(230, 74, 0, 1.0),
              // Color.fromRGBO(227, 79, 0, 1.0),
              // Color.fromRGBO(224, 84, 0, 1.0),

              //MAGENTA AND BLUE -WITH SEQUENCE CODE
              // Color.fromRGBO(0, 0, 255, 1.0),
              // Color.fromRGBO(89, 0, 245, 1.0),
              // Color.fromRGBO(121, 0, 240, 1.0),
              // Color.fromRGBO(145, 0, 239, 1.0),
              // Color.fromRGBO(166, 0, 239, 1.0),
              // Color.fromRGBO(185, 0, 241, 1.0),
              // Color.fromRGBO(203, 0, 244, 1.0),
              // Color.fromRGBO(221, 0, 247, 1.0),
              // Color.fromRGBO(238, 0, 251, 1.0),
              // Color.fromRGBO(255, 0, 255, 1.0),

              Color.fromRGBO(72, 176, 232, 1.0),
              Color.fromRGBO(113, 171, 229, 1.0),
              Color.fromRGBO(141, 167, 225, 1.0),
              Color.fromRGBO(163, 162, 222, 1.0),
              Color.fromRGBO(181, 156, 218, 1.0),
              Color.fromRGBO(197, 151, 215, 1.0),
              Color.fromRGBO(212, 146, 211, 1.0),
              Color.fromRGBO(225, 140, 207, 1.0),
              Color.fromRGBO(237, 134, 204, 1.0),
              Color.fromRGBO(248, 128, 200, 1.0),
            ];
          } else if (secondaryColourCode == 3) {
            colourList = [
              Color.fromRGBO(255, 179, 73, 1.0),
              Color.fromRGBO(244, 184, 76, 1.0),
              Color.fromRGBO(232, 189, 79, 1.0),
              Color.fromRGBO(219, 194, 81, 1.0),
              Color.fromRGBO(204, 199, 84, 1.0),
              Color.fromRGBO(189, 204, 86, 1.0),
              Color.fromRGBO(171, 208, 88, 1.0),
              Color.fromRGBO(151, 213, 91, 1.0),
              Color.fromRGBO(127, 217, 93, 1.0),
              Color.fromRGBO(95, 221, 95, 1.0),
            ];
          } else if (secondaryColourCode == 4) {
            colourList = [
              Color.fromRGBO(255, 193, 92, 1.0),
              Color.fromRGBO(244, 198, 94, 1.0),
              Color.fromRGBO(233, 203, 97, 1.0),
              Color.fromRGBO(221, 208, 99, 1.0),
              Color.fromRGBO(208, 213, 101, 1.0),
              Color.fromRGBO(194, 217, 103, 1.0),
              Color.fromRGBO(178, 222, 105, 1.0),
              Color.fromRGBO(160, 226, 107, 1.0),
              Color.fromRGBO(138, 231, 109, 1.0),
              Color.fromRGBO(111, 235, 111, 1.0),
            ];
          }
        }
      }
    } else if (cvdType == CvdType.deutan) {
      if (isChroma) {
        if (colourCode == 0) {
          //Deutan: Grey to Magenta
          colourList = [
            Color.fromRGBO(118, 118, 118, 1.0),
            Color.fromRGBO(127, 115, 119, 1.0),
            Color.fromRGBO(136, 112, 120, 1.0),
            Color.fromRGBO(145, 108, 121, 1.0),
            Color.fromRGBO(154, 104, 122, 1.0),
            Color.fromRGBO(164, 99, 124, 1.0),
            Color.fromRGBO(172, 94, 125, 1.0),
            Color.fromRGBO(179, 89, 126, 1.0),
            Color.fromRGBO(186, 84, 127, 1.0),
            Color.fromRGBO(193, 78, 128, 1.0),
          ];
        } else {
          //Deutan: Grey to Aquamarine
          colourList = [
            Color.fromRGBO(118, 118, 118, 1.0),
            Color.fromRGBO(113, 120, 118, 1.0),
            Color.fromRGBO(107, 121, 117, 1.0),
            Color.fromRGBO(101, 123, 117, 1.0),
            Color.fromRGBO(95, 124, 116, 1.0),
            Color.fromRGBO(89, 126, 116, 1.0),
            Color.fromRGBO(83, 127, 115, 1.0),
            Color.fromRGBO(78, 128, 115, 1.0),
            Color.fromRGBO(72, 129, 115, 1.0),
            Color.fromRGBO(66, 130, 115, 1.0),
          ];
        }
      } else {
        //Deutan: Blue to Purple
        if (colourCode == 0) {
          if (secondaryColourCode == 0) {
            colourList = [
              Color.fromRGBO(0, 102, 204, 1.0),
              Color.fromRGBO(49, 98, 206, 1.0),
              Color.fromRGBO(71, 93, 208, 1.0),
              Color.fromRGBO(87, 87, 210, 1.0),
              Color.fromRGBO(100, 82, 212, 1.0),
              Color.fromRGBO(112, 75, 214, 1.0),
              Color.fromRGBO(122, 68, 216, 1.0),
              Color.fromRGBO(132, 59, 218, 1.0),
              Color.fromRGBO(141, 48, 220, 1.0),
              Color.fromRGBO(150, 33, 222, 1.0),
            ];
          } else if (secondaryColourCode == 1) {
            colourList = [
              Color.fromRGBO(0, 115, 215, 1.0),
              Color.fromRGBO(52, 111, 217, 1.0),
              Color.fromRGBO(75, 106, 219, 1.0),
              Color.fromRGBO(91, 101, 220, 1.0),
              Color.fromRGBO(105, 96, 222, 1.0),
              Color.fromRGBO(118, 90, 224, 1.0),
              Color.fromRGBO(129, 84, 226, 1.0),
              Color.fromRGBO(139, 77, 228, 1.0),
              Color.fromRGBO(148, 69, 230, 1.0),
              Color.fromRGBO(157, 59, 232, 1.0),
            ];
          } else if (secondaryColourCode == 2) {
            colourList = [
              // Color.fromRGBO(8, 125, 227, 1.0),
              // Color.fromRGBO(59, 121, 229, 1.0),
              // Color.fromRGBO(82, 117, 230, 1.0),
              // Color.fromRGBO(100, 113, 232, 1.0),
              // Color.fromRGBO(114, 108, 234, 1.0),
              // Color.fromRGBO(127, 104, 236, 1.0),
              // Color.fromRGBO(139, 98, 238, 1.0),
              // Color.fromRGBO(150, 93, 239, 1.0),
              // Color.fromRGBO(160, 86, 241, 1.0),
              // Color.fromRGBO(169, 79, 243, 1.0),
              Color.fromRGBO(232, 232, 88, 1.0),
              Color.fromRGBO(225, 234, 87, 1.0),
              Color.fromRGBO(219, 237, 86, 1.0),
              Color.fromRGBO(212, 239, 85, 1.0),
              Color.fromRGBO(204, 241, 85, 1.0),
              Color.fromRGBO(196, 243, 84, 1.0),
              Color.fromRGBO(188, 246, 83, 1.0),
              Color.fromRGBO(179, 248, 82, 1.0),
              Color.fromRGBO(170, 250, 81, 1.0),
              Color.fromRGBO(160, 252, 80, 1.0),
            ];
          } else if (secondaryColourCode == 3) {
            colourList = [
              Color.fromRGBO(51, 139, 239, 1.0),
              Color.fromRGBO(79, 135, 241, 1.0),
              Color.fromRGBO(98, 131, 242, 1.0),
              Color.fromRGBO(114, 127, 244, 1.0),
              Color.fromRGBO(127, 123, 246, 1.0),
              Color.fromRGBO(140, 118, 247, 1.0),
              Color.fromRGBO(151, 113, 249, 1.0),
              Color.fromRGBO(161, 107, 251, 1.0),
              Color.fromRGBO(171, 101, 252, 1.0),
              Color.fromRGBO(180, 95, 254, 1.0),
            ];
          } else if (secondaryColourCode == 4) {
            colourList = [
              Color.fromRGBO(74, 151, 252, 1.0),
              Color.fromRGBO(97, 147, 252, 1.0),
              Color.fromRGBO(115, 143, 253, 1.0),
              Color.fromRGBO(129, 139, 253, 1.0),
              Color.fromRGBO(143, 135, 253, 1.0),
              Color.fromRGBO(154, 131, 254, 1.0),
              Color.fromRGBO(165, 126, 254, 1.0),
              Color.fromRGBO(175, 122, 254, 1.0),
              Color.fromRGBO(184, 116, 255, 1.0),
              Color.fromRGBO(193, 111, 255, 1.0),
            ];
          }
        } else if (colourCode == 1) {
          //Deutan: Orange to Red
          if (secondaryColourCode == 0) {
            colourList = [
              Color.fromRGBO(195, 98, 0, 1.0),
              Color.fromRGBO(201, 93, 1, 1.0),
              Color.fromRGBO(207, 87, 3, 1.0),
              Color.fromRGBO(213, 81, 4, 1.0),
              Color.fromRGBO(219, 75, 6, 1.0),
              Color.fromRGBO(224, 68, 7, 1.0),
              Color.fromRGBO(230, 59, 9, 1.0),
              Color.fromRGBO(235, 49, 10, 1.0),
              Color.fromRGBO(240, 36, 12, 1.0),
              Color.fromRGBO(245, 13, 13, 1.0),
            ];
          } else if (secondaryColourCode == 1) {
            colourList = [
              Color.fromRGBO(210, 109, 0, 1.0),
              Color.fromRGBO(216, 104, 9, 1.0),
              Color.fromRGBO(221, 99, 16, 1.0),
              Color.fromRGBO(226, 93, 22, 1.0),
              Color.fromRGBO(231, 87, 27, 1.0),
              Color.fromRGBO(236, 81, 31, 1.0),
              Color.fromRGBO(241, 73, 34, 1.0),
              Color.fromRGBO(246, 65, 37, 1.0),
              Color.fromRGBO(250, 55, 40, 1.0),
              Color.fromRGBO(255, 43, 43, 1.0),
            ];
          } else if (secondaryColourCode == 2) {
            colourList = [
              // Color.fromRGBO(225, 124, 0, 1.0),
              // Color.fromRGBO(229, 119, 17, 1.0),
              // Color.fromRGBO(232, 113, 28, 1.0),
              // Color.fromRGBO(236, 108, 35, 1.0),
              // Color.fromRGBO(239, 102, 42, 1.0),
              // Color.fromRGBO(243, 95, 47, 1.0),
              // Color.fromRGBO(246, 88, 51, 1.0),
              // Color.fromRGBO(249, 81, 56, 1.0),
              // Color.fromRGBO(252, 73, 59, 1.0),
              // Color.fromRGBO(255, 63, 63, 1.0),
              // Color.fromRGBO(195, 98, 0, 1.0),
              // Color.fromRGBO(201, 93, 1, 1.0),
              // Color.fromRGBO(207, 87, 3, 1.0),
              // Color.fromRGBO(213, 81, 4, 1.0),
              // Color.fromRGBO(219, 75, 6, 1.0),
              // Color.fromRGBO(224, 68, 7, 1.0),
              // Color.fromRGBO(230, 59, 9, 1.0),
              // Color.fromRGBO(235, 49, 10, 1.0),
              // Color.fromRGBO(240, 36, 12, 1.0),
              // Color.fromRGBO(245, 13, 13, 1.0),

              Color.fromRGBO(168, 0, 24, 1.0),
              Color.fromRGBO(164, 19, 24, 1.0),
              Color.fromRGBO(160, 30, 24, 1.0),
              Color.fromRGBO(156, 38, 24, 1.0),
              Color.fromRGBO(152, 45, 24, 1.0),
              Color.fromRGBO(147, 50, 24, 1.0),
              Color.fromRGBO(143, 55, 24, 1.0),
              Color.fromRGBO(138, 60, 24, 1.0),
              Color.fromRGBO(133, 64, 24, 1.0),
              Color.fromRGBO(128, 68, 24, 1.0),
            ];
          } else if (secondaryColourCode == 3) {
            colourList = [
              Color.fromRGBO(240, 136, 31, 1.0),
              Color.fromRGBO(242, 131, 41, 1.0),
              Color.fromRGBO(244, 125, 48, 1.0),
              Color.fromRGBO(246, 120, 54, 1.0),
              Color.fromRGBO(247, 114, 60, 1.0),
              Color.fromRGBO(249, 108, 65, 1.0),
              Color.fromRGBO(250, 102, 69, 1.0),
              Color.fromRGBO(252, 95, 73, 1.0),
              Color.fromRGBO(254, 88, 77, 1.0),
              Color.fromRGBO(255, 80, 80, 1.0),
            ];
          } else if (secondaryColourCode == 4) {
            colourList = [
              Color.fromRGBO(255, 147, 58, 1.0),
              Color.fromRGBO(255, 142, 64, 1.0),
              Color.fromRGBO(255, 137, 70, 1.0),
              Color.fromRGBO(255, 131, 75, 1.0),
              Color.fromRGBO(255, 126, 79, 1.0),
              Color.fromRGBO(255, 120, 83, 1.0),
              Color.fromRGBO(255, 115, 87, 1.0),
              Color.fromRGBO(255, 109, 90, 1.0),
              Color.fromRGBO(255, 103, 93, 1.0),
              Color.fromRGBO(255, 96, 96, 1.0),
            ];
          }
        } else {
          //Deutan: Gold/Yellow to Green
          if (secondaryColourCode == 0) {
            colourList = [
              Color.fromRGBO(224, 190, 0, 1.0),
              Color.fromRGBO(212, 194, 0, 1.0),
              Color.fromRGBO(200, 198, 0, 1.0),
              Color.fromRGBO(187, 202, 0, 1.0),
              Color.fromRGBO(172, 206, 0, 1.0),
              Color.fromRGBO(155, 210, 0, 1.0),
              Color.fromRGBO(136, 214, 0, 1.0),
              Color.fromRGBO(113, 217, 0, 1.0),
              Color.fromRGBO(81, 221, 0, 1.0),
              Color.fromRGBO(0, 224, 0, 1.0),
            ];
          } else if (secondaryColourCode == 1) {
            colourList = [
              Color.fromRGBO(238, 202, 44, 1.0),
              Color.fromRGBO(226, 206, 42, 1.0),
              Color.fromRGBO(213, 211, 40, 1.0),
              Color.fromRGBO(199, 215, 38, 1.0),
              Color.fromRGBO(183, 219, 36, 1.0),
              Color.fromRGBO(166, 223, 33, 1.0),
              Color.fromRGBO(146, 227, 30, 1.0),
              Color.fromRGBO(121, 231, 28, 1.0),
              Color.fromRGBO(89, 234, 25, 1.0),
              Color.fromRGBO(21, 238, 21, 1.0),
            ];
          } else if (secondaryColourCode == 2) {
            colourList = [
              // Color.fromRGBO(253, 217, 71, 1.0),
              // Color.fromRGBO(240, 221, 70, 1.0),
              // Color.fromRGBO(227, 226, 68, 1.0),
              // Color.fromRGBO(213, 230, 67, 1.0),
              // Color.fromRGBO(197, 234, 66, 1.0),
              // Color.fromRGBO(180, 238, 64, 1.0),
              // Color.fromRGBO(160, 241, 63, 1.0),
              // Color.fromRGBO(136, 245, 61, 1.0),
              // Color.fromRGBO(106, 249, 60, 1.0),
              // Color.fromRGBO(58, 252, 58, 1.0),
              Color.fromRGBO(152, 148, 152, 1.0),
              Color.fromRGBO(166, 144, 154, 1.0),
              Color.fromRGBO(178, 139, 156, 1.0),
              Color.fromRGBO(190, 134, 157, 1.0),
              Color.fromRGBO(200, 129, 159, 1.0),
              Color.fromRGBO(211, 124, 161, 1.0),
              Color.fromRGBO(221, 118, 163, 1.0),
              Color.fromRGBO(230, 111, 164, 1.0),
              Color.fromRGBO(239, 104, 166, 1.0),
              Color.fromRGBO(248, 96, 168, 1.0),
            ];
          } else if (secondaryColourCode == 3) {
            colourList = [
              Color.fromRGBO(255, 233, 92, 1.0),
              Color.fromRGBO(242, 236, 91, 1.0),
              Color.fromRGBO(229, 238, 90, 1.0),
              Color.fromRGBO(215, 241, 89, 1.0),
              Color.fromRGBO(200, 244, 88, 1.0),
              Color.fromRGBO(183, 246, 86, 1.0),
              Color.fromRGBO(165, 248, 85, 1.0),
              Color.fromRGBO(144, 251, 84, 1.0),
              Color.fromRGBO(118, 253, 83, 1.0),
              Color.fromRGBO(82, 255, 82, 1.0),
            ];
          } else if (secondaryColourCode == 4) {
            colourList = [
              Color.fromRGBO(255, 245, 111, 1.0),
              Color.fromRGBO(243, 246, 110, 1.0),
              Color.fromRGBO(230, 248, 109, 1.0),
              Color.fromRGBO(217, 249, 108, 1.0),
              Color.fromRGBO(202, 250, 107, 1.0),
              Color.fromRGBO(187, 251, 106, 1.0),
              Color.fromRGBO(170, 252, 105, 1.0),
              Color.fromRGBO(151, 253, 104, 1.0),
              Color.fromRGBO(129, 254, 103, 1.0),
              Color.fromRGBO(102, 255, 102, 1.0),
            ];
          }
        }
      }
    } else if (cvdType == CvdType.tritan) {
      if (isChroma) {
        if (colourCode == 0) {
          //Tritan: Grey to Purple
          colourList = [
            Color.fromRGBO(118, 118, 118, 1.0),
            Color.fromRGBO(119, 117, 127, 1.0),
            Color.fromRGBO(123, 114, 142, 1.0),
            Color.fromRGBO(124, 112, 151, 1.0),
            Color.fromRGBO(126, 110, 160, 1.0),
            Color.fromRGBO(127, 109, 168, 1.0),
            Color.fromRGBO(130, 106, 177, 1.0),
            Color.fromRGBO(131, 104, 184, 1.0),
            Color.fromRGBO(133, 102, 192, 1.0),
            Color.fromRGBO(135, 99, 199, 1.0),
          ];
        } else {
          //Tritan: Grey to Yellow
          colourList = [
            Color.fromRGBO(118, 118, 118, 1.0),
            Color.fromRGBO(117, 119, 114, 1.0),
            Color.fromRGBO(117, 119, 109, 1.0),
            Color.fromRGBO(116, 120, 104, 1.0),
            Color.fromRGBO(115, 121, 99, 1.0),
            Color.fromRGBO(114, 121, 94, 1.0),
            Color.fromRGBO(114, 122, 90, 1.0),
            Color.fromRGBO(113, 122, 85, 1.0),
            Color.fromRGBO(114, 123, 81, 1.0),
            Color.fromRGBO(113, 123, 75, 1.0),
          ];
        }
      } else {
        //Tritan: Purple to Yellow
        if (colourCode == 0) {
          if (secondaryColourCode == 0) {
            colourList = [
              Color.fromRGBO(189, 108, 255, 1.0),
              Color.fromRGBO(184, 117, 235, 1.0),
              Color.fromRGBO(179, 125, 216, 1.0),
              Color.fromRGBO(174, 131, 196, 1.0),
              Color.fromRGBO(171, 136, 177, 1.0),
              Color.fromRGBO(167, 141, 156, 1.0),
              Color.fromRGBO(164, 145, 134, 1.0),
              Color.fromRGBO(160, 149, 109, 1.0),
              Color.fromRGBO(158, 152, 76, 1.0),
              Color.fromRGBO(155, 155, 0, 1.0),
            ];
          } else if (secondaryColourCode == 1) {
            colourList = [
              Color.fromRGBO(202, 123, 255, 1.0),
              Color.fromRGBO(197, 131, 236, 1.0),
              Color.fromRGBO(192, 138, 218, 1.0),
              Color.fromRGBO(188, 144, 199, 1.0),
              Color.fromRGBO(184, 149, 180, 1.0),
              Color.fromRGBO(180, 154, 159, 1.0),
              Color.fromRGBO(177, 158, 137, 1.0),
              Color.fromRGBO(174, 161, 112, 1.0),
              Color.fromRGBO(171, 165, 79, 1.0),
              Color.fromRGBO(168, 168, 0, 1.0),
            ];
          } else if (secondaryColourCode == 2) {
            colourList = [
              Color.fromRGBO(214, 138, 255, 1.0),
              Color.fromRGBO(209, 145, 237, 1.0),
              Color.fromRGBO(205, 152, 219, 1.0),
              Color.fromRGBO(201, 157, 201, 1.0),
              Color.fromRGBO(197, 162, 182, 1.0),
              Color.fromRGBO(193, 167, 162, 1.0),
              Color.fromRGBO(190, 171, 140, 1.0),
              Color.fromRGBO(187, 174, 114, 1.0),
              Color.fromRGBO(184, 178, 81, 1.0),
              Color.fromRGBO(181, 181, 0, 1.0),
            ];
          } else if (secondaryColourCode == 3) {
            colourList = [
              Color.fromRGBO(230, 153, 255, 1.0),
              Color.fromRGBO(225, 160, 238, 1.0),
              Color.fromRGBO(221, 166, 221, 1.0),
              Color.fromRGBO(216, 171, 203, 1.0),
              Color.fromRGBO(212, 176, 184, 1.0),
              Color.fromRGBO(208, 180, 164, 1.0),
              Color.fromRGBO(205, 184, 142, 1.0),
              Color.fromRGBO(201, 188, 116, 1.0),
              Color.fromRGBO(198, 192, 83, 1.0),
              Color.fromRGBO(195, 195, 0, 1.0),
            ];
          } else if (secondaryColourCode == 4) {
            colourList = [
              Color.fromRGBO(242, 168, 255, 1.0),
              Color.fromRGBO(238, 174, 239, 1.0),
              Color.fromRGBO(233, 180, 222, 1.0),
              Color.fromRGBO(229, 185, 205, 1.0),
              Color.fromRGBO(226, 190, 186, 1.0),
              Color.fromRGBO(222, 194, 166, 1.0),
              Color.fromRGBO(218, 198, 144, 1.0),
              Color.fromRGBO(215, 202, 118, 1.0),
              Color.fromRGBO(212, 206, 84, 1.0),
              Color.fromRGBO(209, 209, 0, 1.0),
            ];
          }
        } else if (colourCode == 1) {
          //Tritan Green to Cyan
          if (secondaryColourCode == 0) {
            colourList = [
              Color.fromRGBO(0, 229, 0, 1.0),
              Color.fromRGBO(2, 228, 72, 1.0),
              Color.fromRGBO(4, 227, 102, 1.0),
              Color.fromRGBO(6, 226, 125, 1.0),
              Color.fromRGBO(8, 225, 144, 1.0),
              Color.fromRGBO(10, 224, 161, 1.0),
              Color.fromRGBO(12, 223, 177, 1.0),
              Color.fromRGBO(14, 222, 191, 1.0),
              Color.fromRGBO(16, 220, 205, 1.0),
              Color.fromRGBO(18, 219, 219, 1.0),
            ];
          } else if (secondaryColourCode == 1) {
            colourList = [
              Color.fromRGBO(39, 244, 39, 1.0),
              Color.fromRGBO(42, 243, 86, 1.0),
              Color.fromRGBO(44, 242, 115, 1.0),
              Color.fromRGBO(47, 241, 137, 1.0),
              Color.fromRGBO(49, 240, 156, 1.0),
              Color.fromRGBO(51, 239, 174, 1.0),
              Color.fromRGBO(54, 237, 190, 1.0),
              Color.fromRGBO(56, 236, 205, 1.0),
              Color.fromRGBO(59, 234, 219, 1.0),
              Color.fromRGBO(61, 233, 233, 1.0),
            ];
          } else if (secondaryColourCode == 2) {
            colourList = [
              Color.fromRGBO(68, 255, 68, 1.0),
              Color.fromRGBO(70, 254, 104, 1.0),
              Color.fromRGBO(72, 254, 130, 1.0),
              Color.fromRGBO(74, 253, 151, 1.0),
              Color.fromRGBO(76, 252, 170, 1.0),
              Color.fromRGBO(78, 251, 187, 1.0),
              Color.fromRGBO(80, 250, 203, 1.0),
              Color.fromRGBO(82, 249, 218, 1.0),
              Color.fromRGBO(84, 248, 233, 1.0),
              Color.fromRGBO(86, 247, 247, 1.0),
            ];
          } else if (secondaryColourCode == 3) {
            colourList = [
              Color.fromRGBO(90, 255, 90, 1.0),
              Color.fromRGBO(92, 255, 119, 1.0),
              Color.fromRGBO(94, 255, 141, 1.0),
              Color.fromRGBO(95, 255, 161, 1.0),
              Color.fromRGBO(97, 255, 179, 1.0),
              Color.fromRGBO(99, 255, 196, 1.0),
              Color.fromRGBO(101, 255, 211, 1.0),
              Color.fromRGBO(103, 255, 226, 1.0),
              Color.fromRGBO(105, 255, 241, 1.0),
              Color.fromRGBO(107, 255, 255, 1.0),
            ];
          } else if (secondaryColourCode == 4) {
            colourList = [
              Color.fromRGBO(109, 255, 109, 1.0),
              Color.fromRGBO(111, 255, 132, 1.0),
              Color.fromRGBO(113, 255, 152, 1.0),
              Color.fromRGBO(115, 255, 169, 1.0),
              Color.fromRGBO(117, 255, 185, 1.0),
              Color.fromRGBO(119, 255, 200, 1.0),
              Color.fromRGBO(121, 255, 215, 1.0),
              Color.fromRGBO(123, 255, 229, 1.0),
              Color.fromRGBO(125, 255, 242, 1.0),
              Color.fromRGBO(127, 255, 255, 1.0),
            ];
          }
        } else {
          //Tritan DarkRed to Orange
          if (secondaryColourCode == 0) {
            colourList = [
              Color.fromRGBO(163, 52, 52, 1.0),
              Color.fromRGBO(162, 53, 49, 1.0),
              Color.fromRGBO(162, 55, 45, 1.0),
              Color.fromRGBO(161, 56, 41, 1.0),
              Color.fromRGBO(161, 57, 37, 1.0),
              Color.fromRGBO(160, 59, 33, 1.0),
              Color.fromRGBO(160, 60, 27, 1.0),
              Color.fromRGBO(159, 61, 21, 1.0),
              Color.fromRGBO(159, 62, 12, 1.0),
              Color.fromRGBO(158, 63, 0, 1.0),
            ];
          } else if (secondaryColourCode == 1) {
            colourList = [
              Color.fromRGBO(177, 66, 66, 1.0),
              Color.fromRGBO(177, 67, 62, 1.0),
              Color.fromRGBO(176, 68, 58, 1.0),
              Color.fromRGBO(176, 69, 53, 1.0),
              Color.fromRGBO(175, 70, 48, 1.0),
              Color.fromRGBO(175, 71, 42, 1.0),
              Color.fromRGBO(174, 72, 36, 1.0),
              Color.fromRGBO(174, 73, 28, 1.0),
              Color.fromRGBO(173, 74, 17, 1.0),
              Color.fromRGBO(173, 75, 0, 1.0),
            ];
          } else if (secondaryColourCode == 2) {
            colourList = [
              Color.fromRGBO(192, 80, 80, 1.0),
              Color.fromRGBO(192, 81, 75, 1.0),
              Color.fromRGBO(191, 82, 70, 1.0),
              Color.fromRGBO(191, 83, 65, 1.0),
              Color.fromRGBO(190, 84, 59, 1.0),
              Color.fromRGBO(190, 85, 52, 1.0),
              Color.fromRGBO(189, 86, 44, 1.0),
              Color.fromRGBO(189, 86, 35, 1.0),
              Color.fromRGBO(188, 87, 23, 1.0),
              Color.fromRGBO(188, 88, 0, 1.0),
            ];
          } else if (secondaryColourCode == 3) {
            colourList = [
              Color.fromRGBO(206, 93, 93, 1.0),
              Color.fromRGBO(206, 94, 87, 1.0),
              Color.fromRGBO(205, 95, 82, 1.0),
              Color.fromRGBO(205, 96, 75, 1.0),
              Color.fromRGBO(204, 97, 68, 1.0),
              Color.fromRGBO(204, 98, 61, 1.0),
              Color.fromRGBO(203, 99, 52, 1.0),
              Color.fromRGBO(203, 99, 42, 1.0),
              Color.fromRGBO(202, 100, 27, 1.0),
              Color.fromRGBO(202, 101, 0, 1.0),
            ];
          } else if (secondaryColourCode == 4) {
            colourList = [
              Color.fromRGBO(221, 107, 107, 1.0),
              Color.fromRGBO(221, 108, 101, 1.0),
              Color.fromRGBO(220, 109, 94, 1.0),
              Color.fromRGBO(220, 110, 87, 1.0),
              Color.fromRGBO(219, 111, 79, 1.0),
              Color.fromRGBO(219, 112, 71, 1.0),
              Color.fromRGBO(218, 113, 61, 1.0),
              Color.fromRGBO(218, 114, 49, 1.0),
              Color.fromRGBO(217, 115, 33, 1.0),
              Color.fromRGBO(217, 116, 0, 1.0),
            ];
          }
        }
      }
    }
  }
}
