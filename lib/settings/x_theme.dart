import "package:flutter/material.dart";

/// A singleton managing the default settings of the XContainer package.
///
/// It allows to change the default properties of all the widgets in
/// this package at once.
/// The default colors can be configured as well; if they are not set, the theme
/// colors are used.
///
/// The individual settings of each instance still may be customized.
class XTheme {

  // VARIABLES =================================================================

  // PADDING ===================================================================

  // PADDING -------------------------------------------------------------------

  /// The default value of the padding used.
   double paddingValue = 10;

  /// The ratio of horizontal density over vertical density.
  ///
  /// Default value: 4.
  /// Increasing it will increase the vertical padding.
   double densityRatio = 2;

  /// The default padding value for all XContainers.
  ///
  /// It indicates an offset between the contents of a container and its border.
   EdgeInsetsGeometry padding = EdgeInsets.zero;

  /// The default margin value for all XContainers.
  ///
  /// It indicates an offset between the border of a container and its
  /// surroundings.
   EdgeInsetsGeometry margin = EdgeInsets.zero;

  // SHAPE ---------------------------------------------------------------------

  /// The default border radius property for all XContainers.
   BorderRadius borderRadius = BorderRadius.circular(5);

  /// The default border radius property for all XContainers.
   BorderRadius dialogBorderRadius = BorderRadius.circular(10);

  /// The default border decoration for all XContainers.
   BoxBorder? borderDecoration;
  // POSITIONING ---------------------------------------------------------------

  /// The default alignment setting of the XContainers.
   AlignmentGeometry alignment = Alignment.center;

  // COLORS --------------------------------------------------------------------

  /// Whether the shadows should be enabled by default.
   bool enableShadow = true;

  /// The default primary color of the XContainers.
   Color? primaryColor;

  /// The default primary color of the card-type XContainers.
   Color? cardColor;

  /// The default shadow color of the XContainers.
   Color? shadowColor = Colors.black;

  /// The default splash color of the XContainers.
   Color? splashColor;

  // INTERACTIVITY -------------------------------------------------------------

  /// Whether the container should "splash" when tapped on.
   bool enableSplash = true;

  // GETTERS ===================================================================


  // CONSTRUCTOR ===============================================================

  /// The value of the singleton.
  ///
  /// It is both static and final meaning it can only be instantiated once.
  static final XTheme _instance = XTheme._internal();

  /// Returns the unique instance of the class.
  factory XTheme() => _instance;

  /// The actual constructor of the class.
  XTheme._internal();


  // METHODS ===================================================================

  /// Set several properties at once.
  ///
  /// WARNING: arguments not set or set to null won't change the value of the properties.
  /// To set a property to null, modify it directly as follows:
  /// ```dart
  ///   XTheme().shadowColor = null;
  /// ```
  void set ({
    double? paddingValue,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    BoxBorder? borderDecoration,
    AlignmentGeometry? alignment,
    bool? enableShadow,
    Color? shadowColor,
    Color? primaryColor,
    Color? cardColor,
    Color? splashColor,
    bool? enableSplash,
  }) {
    if (paddingValue != null) this.paddingValue = paddingValue;
    if (padding != null) this.padding = padding;
    if (margin != null) this.margin = margin;
    if (borderRadius != null) this.borderRadius = borderRadius;
    if (borderDecoration != null) this.borderDecoration = borderDecoration;
    if (alignment != null) this.alignment = alignment;
    if (enableShadow != null) this.enableShadow = enableShadow;
    if (shadowColor != null) this.shadowColor = shadowColor;
    if (primaryColor != null) this.primaryColor = primaryColor;
    if (cardColor != null) this.cardColor = cardColor;
    if (splashColor != null) this.splashColor = splashColor;
    if (enableSplash != null) this.enableSplash = enableSplash;
  }

}