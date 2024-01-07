import "dart:ui";

import "package:flutter/material.dart";

import "../../x_containers.dart";

/// A singleton managing the default settings of the XContainer package.
///
/// It allows to change the default properties of all the widgets in this
/// package at once.
/// The default colors can be configured as well; if they are not set, the theme
/// colors are used.
///
/// The individual settings of each instance still may be customized.
class XTheme {
  // VARIABLES =================================================================

  // PADDING -------------------------------------------------------------------

  /// The default value of the padding used.
  double paddingValue = 10;

  /// The default value of the internal horizontal padding of [XListTile].
  double internalHorizontalPadding = XLayout.paddingS;

  /// The default value of the internal vertical padding of [XListTile].
  double internalVerticalPadding = XLayout.paddingS;

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

  // SHADOW --------------------------------------------------------------------

  /// Whether the shadows should be enabled by default.
  bool enableShadow = true;

  // INTERACTIVITY -------------------------------------------------------------

  /// Whether the container should "splash" when tapped on.
  bool enableSplash = true;

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
  ///   xTheme.shadowColor = null;
  /// ```
  void set({
    double? paddingValue,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    BoxBorder? borderDecoration,
    AlignmentGeometry? alignment,
    bool? enableShadow,
    bool? enableSplash,
  }) {
    if (paddingValue != null) this.paddingValue = paddingValue;
    if (padding != null) this.padding = padding;
    if (margin != null) this.margin = margin;
    if (borderRadius != null) this.borderRadius = borderRadius;
    if (borderDecoration != null) this.borderDecoration = borderDecoration;
    if (alignment != null) this.alignment = alignment;
    if (enableShadow != null) this.enableShadow = enableShadow;
    if (enableSplash != null) this.enableSplash = enableSplash;
  }

  /// Returns a custom theme that takes into account the xTheme values.
  ThemeData getTheme({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? backgroundAlt,
    Color? shadowColor,
    Color? containerColor,
    Color? cardColor,
    Color? splashColor,
    ColorScheme? colorScheme,
    ThemeMode mode = ThemeMode.dark,
    // TYPOGRAPHY & ICONOGRAPHY
    Typography? typography,
    TextTheme? textTheme,
    TextTheme? primaryTextTheme,
    IconThemeData? iconTheme,
    IconThemeData? primaryIconTheme,
  }) {
    final bool isDarkMode = mode == ThemeMode.dark;
    final Color textColor = isDarkMode ? Colors.white : Colors.black;

    // Custom [TextTheme] is broken and leads to crashes when switching between themes.
    final TextTheme defaultTextTheme = Typography()
        .englishLike
        .copyWith(
          // TITLE LARGE
          titleLarge: const TextStyle().copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
          // TITLE MEDIUM
          titleMedium: const TextStyle().copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
          // TITLE SMALL
          titleSmall: const TextStyle().copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
          // BODY LARGE
          bodyLarge: const TextStyle().copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          // BODY MEDIUM
          bodyMedium: const TextStyle().copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          // BODY SMALL
          bodySmall: const TextStyle().copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
        )
        .apply(
          bodyColor: textColor,
          displayColor: textColor,
          decorationColor: textColor,
        );
    // final TextTheme defaultTextTheme = const TextTheme().apply(
    //   bodyColor: textColor,
    //   displayColor: textColor,
    //   decorationColor: textColor,
    // );

    final ThemeData res = isDarkMode ? ThemeData.dark() : ThemeData.light();

    late final ColorScheme defaultColorScheme;
    if (primary != null && secondary != null && background != null) {
      defaultColorScheme = isDarkMode
          ? ColorScheme.dark(
              secondary: secondary,
              primary: primary,
              background: background,
            )
          : ColorScheme.light(
              secondary: secondary,
              primary: primary,
              background: background,
            );
    } else {
      defaultColorScheme =
          isDarkMode ? const ColorScheme.dark() : const ColorScheme.light();
    }

    return res.copyWith(
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        filled: true,
        fillColor: background,
        border: OutlineInputBorder(
          borderRadius: XLayout.brcS,
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.all(
          XLayout.paddingS,
        ),
      ),
      colorScheme: colorScheme ?? defaultColorScheme,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      shadowColor: shadowColor,
      canvasColor: background,
      scaffoldBackgroundColor: background,
      cardColor: cardColor,
      dividerColor: backgroundAlt,
      splashColor: splashColor,
      disabledColor: backgroundAlt,
      dialogBackgroundColor: backgroundAlt,
      // TEXT THEME ------------------------------------------------------------
      typography: typography,
      textTheme: defaultTextTheme.merge(textTheme),
      primaryTextTheme: defaultTextTheme.merge(primaryTextTheme),
      // OTHER -----------------------------------------------------------------
      iconTheme: iconTheme ??
          const IconThemeData().copyWith(
            color: textColor,
          ),
      primaryIconTheme: primaryIconTheme,
      appBarTheme: const AppBarTheme().copyWith(
              color: secondary,
              titleTextStyle: const TextStyle().copyWith(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFeatures: [const FontFeature("smcp")],
                letterSpacing: 0.25,
              )),
      buttonTheme: (secondary == null
              ? null
              : const ButtonThemeData().copyWith(
                  buttonColor: secondary,
                )),
      drawerTheme: (backgroundAlt == null
              ? null
              : const DrawerThemeData().copyWith(
                  backgroundColor: backgroundAlt,
                )),
      textSelectionTheme: (secondary == null
              ? null
              : const TextSelectionThemeData().copyWith(
                  cursorColor: secondary,
                )),
    );
  }
}
