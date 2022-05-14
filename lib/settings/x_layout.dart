// Flutter dependencies
import "package:flutter/material.dart";

/// A static class to store the main possible shapes.
class XLayout {

  // PADDING ===================================================================

  /// Extra-small padding value.
  static double paddingXS = 5;

  /// Small padding value.
  static double paddingS = 10;

  /// Medium padding value.
  static double paddingM = 20;

  /// Large padding value.
  static double paddingL = 40;


  // BORDER RADIUS =============================================================

  /// Extra-small circular border radius.
  static BorderRadius get brcXS => BorderRadius.circular(paddingXS);
  /// Small circular border radius.
  static BorderRadius get brcS => BorderRadius.circular(paddingS);
  /// Medium circular border radius.
  static BorderRadius get brcM => BorderRadius.circular(paddingM);
  /// Large circular border radius.
  static BorderRadius get brcL => BorderRadius.circular(paddingL);
  /// Circular border radius.
  static BorderRadius get brcX => BorderRadius.circular(1000);

  // SIZED BOXES ===============================================================

  // Horizontal ----------------------------------------------------------------

  /// Extra-small horizontal [SizedBox].
  static SizedBox get horizontalXS => SizedBox(width: paddingXS);
  /// Small horizontal [SizedBox].
  static SizedBox get horizontalS => SizedBox(width: paddingS);
  /// Medium horizontal [SizedBox].
  static SizedBox get horizontalM => SizedBox(width: paddingM);
  /// Large horizontal [SizedBox].
  static SizedBox get horizontalL => SizedBox(width: paddingL);

  // Vertical ------------------------------------------------------------------

  /// Extra-small vertical [SizedBox].
  static SizedBox get verticalXS => SizedBox(height: paddingXS);
  /// Small vertical [SizedBox].
  static SizedBox get verticalS => SizedBox(height: paddingS);
  /// Medium vertical [SizedBox].
  static SizedBox get verticalM => SizedBox(height: paddingM);
  /// Large vertical [SizedBox].
  static SizedBox get verticalL => SizedBox(height: paddingL);

}