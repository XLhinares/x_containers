// Flutter dependencies
import "package:flutter/material.dart";

/// Extra-small padding value.
double xPaddingXS = 5;
/// Small padding value.
double xPaddingS = 10;
/// Medium padding value.
double xPaddingM = 25;
/// Large padding value.
double xPaddingL = 50;

/// A static class to store the main possible shapes.
class XLayout {

  // CONSTRUCTOR ===============================================================

  /// The value of the singleton.
  ///
  /// It is both static and final meaning it can only be instantiated once.
  static final XLayout _instance = XLayout._internal();

  /// Returns the unique instance of the class.
  factory XLayout() => _instance;

  /// The actual constructor of the class.
  XLayout._internal();

  // BORDER RADIUS =============================================================

  /// Extra-small circular border radius
  static BorderRadius get brcXS => BorderRadius.circular(xPaddingXS);
  /// Small circular border radius
  static BorderRadius get brcS => BorderRadius.circular(xPaddingS);
  /// Medium circular border radius
  static BorderRadius get brcM => BorderRadius.circular(xPaddingM);
  /// Large circular border radius
  static BorderRadius get brcL => BorderRadius.circular(xPaddingL);
  /// Circular border radius
  static BorderRadius get brcX => BorderRadius.circular(1000);

  // SIZED BOXES ===============================================================

  // Horizontal ----------------------------------------------------------------

  /// Extra-small horizontal [SizedBox].
  static SizedBox get horizontalXS => SizedBox(width: xPaddingXS);
  /// Small horizontal [SizedBox].
  static SizedBox get horizontalS => SizedBox(width: xPaddingS);
  /// Medium horizontal [SizedBox].
  static SizedBox get horizontalM => SizedBox(width: xPaddingM);
  /// Large horizontal [SizedBox].
  static SizedBox get horizontalL => SizedBox(width: xPaddingL);

  // Vertical ------------------------------------------------------------------

  /// Extra-small vertical [SizedBox].
  static SizedBox get verticalXS => SizedBox(height: xPaddingXS);
  /// Small vertical [SizedBox].
  static SizedBox get verticalS => SizedBox(height: xPaddingS);
  /// Medium vertical [SizedBox].
  static SizedBox get verticalM => SizedBox(height: xPaddingM);
  /// Large vertical [SizedBox].
  static SizedBox get verticalL => SizedBox(height: xPaddingL);

}