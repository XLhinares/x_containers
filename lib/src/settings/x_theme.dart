import "dart:ui";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../../x_containers.dart";

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
    ThemeMode mode = ThemeMode.dark,
    bool? applyElevationOverlayColor,
    NoDefaultCupertinoThemeData? cupertinoOverrideTheme,
    Iterable<ThemeExtension<dynamic>>? extensions,
    InputDecorationTheme? inputDecorationTheme,
    MaterialTapTargetSize? materialTapTargetSize,
    PageTransitionsTheme? pageTransitionsTheme,
    TargetPlatform? platform,
    ScrollbarThemeData? scrollbarTheme,
    InteractiveInkFeatureFactory? splashFactory,
    VisualDensity? visualDensity,
    bool? useMaterial3,
    ColorScheme? colorScheme,
    Brightness? brightness,
    Color? primaryColorLight,
    Color? primaryColorDark,
    Color? focusColor,
    Color? hoverColor,
    Color? canvasColor,
    Color? scaffoldBackgroundColor,
    Color? bottomAppBarColor,
    Color? dividerColor,
    Color? highlightColor,
    Color? selectedRowColor,
    Color? unselectedWidgetColor,
    Color? disabledColor,
    Color? secondaryHeaderColor,
    Color? backgroundColor,
    Color? dialogBackgroundColor,
    Color? indicatorColor,
    Color? hintColor,
    Color? errorColor,
    Color? toggleableActiveColor,
    // TYPOGRAPHY & ICONOGRAPHY
    Typography? typography,
    TextTheme? textTheme,
    TextTheme? primaryTextTheme,
    IconThemeData? iconTheme,
    IconThemeData? primaryIconTheme,
    // COMPONENT THEMES
    AppBarTheme? appBarTheme,
    MaterialBannerThemeData? bannerTheme,
    BottomAppBarTheme? bottomAppBarTheme,
    BottomNavigationBarThemeData? bottomNavigationBarTheme,
    BottomSheetThemeData? bottomSheetTheme,
    ButtonBarThemeData? buttonBarTheme,
    ButtonThemeData? buttonTheme,
    CardTheme? cardTheme,
    CheckboxThemeData? checkboxTheme,
    ChipThemeData? chipTheme,
    DataTableThemeData? dataTableTheme,
    DialogTheme? dialogTheme,
    DividerThemeData? dividerTheme,
    DrawerThemeData? drawerTheme,
    ElevatedButtonThemeData? elevatedButtonTheme,
    FloatingActionButtonThemeData? floatingActionButtonTheme,
    ListTileThemeData? listTileTheme,
    NavigationBarThemeData? navigationBarTheme,
    NavigationRailThemeData? navigationRailTheme,
    OutlinedButtonThemeData? outlinedButtonTheme,
    PopupMenuThemeData? popupMenuTheme,
    ProgressIndicatorThemeData? progressIndicatorTheme,
    RadioThemeData? radioTheme,
    SliderThemeData? sliderTheme,
    SnackBarThemeData? snackBarTheme,
    SwitchThemeData? switchTheme,
    TabBarTheme? tabBarTheme,
    TextButtonThemeData? textButtonTheme,
    TextSelectionThemeData? textSelectionTheme,
    TimePickerThemeData? timePickerTheme,
    ToggleButtonsThemeData? toggleButtonsTheme,
    TooltipThemeData? tooltipTheme,
    ExpansionTileThemeData? expansionTileTheme,
  }) {
    final bool isDarkMode = mode == ThemeMode.dark;
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    // Custom [TextTheme] is broken and leads to crashes when switching between themes.
    // final TextTheme defaultTextTheme = const TextTheme().merge(TextTheme(
    //   // TITLE MEDIUM
    //   titleLarge: const TextStyle().merge(const TextStyle(
    //     fontSize: 24,
    //     fontWeight: FontWeight.w600,
    //     letterSpacing: 0.15,
    //     inherit: true,
    //   )),
    //   // TITLE MEDIUM
    //   titleMedium: const TextStyle().merge(const TextStyle(
    //     fontSize: 20,
    //     fontWeight: FontWeight.w600,
    //     letterSpacing: 0.15,
    //     inherit: true,
    //   )),
    //   // TITLE SMALL
    //   titleSmall: const TextStyle().merge(const TextStyle(
    //     fontSize: 16,
    //     fontWeight: FontWeight.w600,
    //     letterSpacing: 0.15,
    //     inherit: true,
    //   )),
    //   // BODY MEDIUM
    //   bodyLarge: const TextStyle().merge(const TextStyle(
    //     fontSize: 18,
    //     fontWeight: FontWeight.w400,
    //     letterSpacing: 0.15,
    //     inherit: true,
    //   )),
    //   // BODY MEDIUM
    //   bodyMedium: const TextStyle().merge(const TextStyle(
    //     fontSize: 15,
    //     fontWeight: FontWeight.w400,
    //     letterSpacing: 0.15,
    //     inherit: true,
    //   )),
    //   // BODY SMALL
    //   bodySmall: const TextStyle().merge(const TextStyle(
    //     fontSize: 12,
    //     fontWeight: FontWeight.w400,
    //     letterSpacing: 0.15,
    //     inherit: true,
    //   )),
    // )).apply(
    //   bodyColor: textColor,
    //   displayColor: textColor,
    //   decorationColor: textColor,
    // );
    final TextTheme defaultTextTheme = const TextTheme().apply(
      bodyColor: textColor,
      displayColor: textColor,
      decorationColor: textColor,
    );

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
      applyElevationOverlayColor: applyElevationOverlayColor,
      cupertinoOverrideTheme: cupertinoOverrideTheme,
      extensions: extensions,
      inputDecorationTheme: inputDecorationTheme ??
          const InputDecorationTheme().copyWith(
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
      materialTapTargetSize: materialTapTargetSize,
      pageTransitionsTheme: pageTransitionsTheme,
      platform: platform,
      scrollbarTheme: scrollbarTheme,
      splashFactory: splashFactory,
      visualDensity: visualDensity,
      useMaterial3: useMaterial3,
      colorScheme: colorScheme ?? defaultColorScheme,
      brightness: brightness,
      primaryColorLight: primaryColorLight,
      primaryColorDark: primaryColorDark,
      focusColor: focusColor,
      hoverColor: hoverColor,
      shadowColor: shadowColor,
      canvasColor: canvasColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? background,
      bottomAppBarColor: bottomAppBarColor,
      cardColor: cardColor,
      dividerColor: dividerColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      selectedRowColor: selectedRowColor,
      unselectedWidgetColor: unselectedWidgetColor,
      disabledColor: disabledColor,
      secondaryHeaderColor: secondaryHeaderColor,
      backgroundColor: backgroundColor ?? background,
      dialogBackgroundColor: dialogBackgroundColor ?? secondary,
      indicatorColor: indicatorColor,
      hintColor: hintColor,
      errorColor: errorColor,
      toggleableActiveColor: toggleableActiveColor,
      // TEXT THEME ------------------------------------------------------------
      typography: typography,
      textTheme: textTheme ?? defaultTextTheme,
      primaryTextTheme: primaryTextTheme,
      // OTHER -----------------------------------------------------------------
      iconTheme: iconTheme ??
          const IconThemeData().copyWith(
            color: textColor,
          ),
      primaryIconTheme: primaryIconTheme,
      appBarTheme: appBarTheme ??
          const AppBarTheme().copyWith(
              color: secondary,
              titleTextStyle: const TextStyle().copyWith(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFeatures: [const FontFeature.enable("smcp")],
                letterSpacing: 0.25,
              )),
      bannerTheme: bannerTheme,
      bottomAppBarTheme: bottomAppBarTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      bottomSheetTheme: bottomSheetTheme,
      buttonBarTheme: buttonBarTheme,
      buttonTheme: buttonTheme ??
          (secondary == null
              ? null
              : const ButtonThemeData().copyWith(
                  buttonColor: secondary,
                )),
      cardTheme: cardTheme,
      checkboxTheme: checkboxTheme ??
          (secondary == null
              ? null
              : const CheckboxThemeData().copyWith(
                  fillColor: MaterialStateProperty.all(secondary),
                )),
      chipTheme: chipTheme,
      dataTableTheme: dataTableTheme,
      dialogTheme: dialogTheme,
      dividerTheme: dividerTheme,
      drawerTheme: drawerTheme ??
          (backgroundAlt == null
              ? null
              : DrawerThemeData(
                  backgroundColor: backgroundAlt,
                )),
      elevatedButtonTheme: elevatedButtonTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      listTileTheme: listTileTheme,
      navigationBarTheme: navigationBarTheme,
      navigationRailTheme: navigationRailTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      popupMenuTheme: popupMenuTheme,
      progressIndicatorTheme: progressIndicatorTheme,
      radioTheme: radioTheme,
      sliderTheme: sliderTheme,
      snackBarTheme: snackBarTheme,
      switchTheme: switchTheme,
      tabBarTheme: tabBarTheme,
      textButtonTheme: textButtonTheme ??
          TextButtonThemeData(
            // If there are no background color nor alternate background color,
            // the style is not changed;
            // Otherwise, it is set to match the alternate background color (or the
            // regular background color if there is none.
            style: background == null && backgroundAlt == null
                ? null
                : const ButtonStyle().copyWith(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        backgroundAlt ?? background!),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(textColor),
                    textStyle: MaterialStateProperty.all<TextStyle?>(
                        defaultTextTheme.bodyMedium),
                  ),
          ),
      textSelectionTheme: textSelectionTheme ??
          (secondary == null
              ? null
              : const TextSelectionThemeData().copyWith(
                  cursorColor: secondary,
                )),
      timePickerTheme: timePickerTheme,
      toggleButtonsTheme: toggleButtonsTheme,
      tooltipTheme: tooltipTheme,
      expansionTileTheme: expansionTileTheme,
    );
  }
}
