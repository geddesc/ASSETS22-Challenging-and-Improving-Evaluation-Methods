//Theme class used to keep the styling
//consistent throughout the app
import 'package:flutter/material.dart';

/// [DesignTheme] is a mixin that contains app wide
/// styling to allow for a consistent look
/// accross the application
mixin DesignTheme {

  /// ------------------------------------------------------------------------
  /// Colour Theme Styling Data 
  /// ------------------------------------------------------------------------
  static Color primaryColor = Colors.orange[600];
  static Color secondaryColor = Colors.blueGrey[100];


  /// ------------------------------------------------------------------------
  /// Padding and Whitespace Styling data
  /// ------------------------------------------------------------------------
  // The styling for whitespace used throughout the application
  static double smallPadding = 5;
  static double mediumPadding = 10;
  static double largePadding = 15;

  /// ------------------------------------------------------------------------
  /// Font Styling data
  /// ------------------------------------------------------------------------

  /// Standard font size used throughout the application
  static double defaultFontSize = 14;
  /// Font size used for all titles throughout the application
  static double titleFontSize = 24;
  /// Font size used for headers throughout the application
  static double headerFontSize = 48;

  /// ------------------------------------------------------------------------
  /// Misc Styling data
  /// ------------------------------------------------------------------------
  static double defaultRadiusVal = 20;



}