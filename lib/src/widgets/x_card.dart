import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../x_containers.dart";

/// A custom [Card]-like widget to standardize the tiles within the app.
class XCard extends StatelessWidget {

  // VARIABLES =================================================================

  // CHILDREN ------------------------------------------------------------------

  /// An (optional) widget to be displayed on the left of the card.
  final Widget? leading;

  /// The title of the card.
  final Widget title;

  /// The (optional) subtitle of the card.
  final Widget? subtitle;

  /// An (optional) widget to be displayed on the right of the card.
  final Widget? trailing;

  // COLOR ---------------------------------------------------------------------

  /// The color of the card.
  final Color? color;


  /// Whether the card should cast a shadow.
  ///
  /// Defaults to [xTheme.enableShadow].
  final bool? enableShadow;
  bool get _enableShadow => enableShadow
      ?? xTheme.enableShadow;

  // LAYOUT --------------------------------------------------------------------

  /// An optional BorderRadius setting.
  ///
  /// Defaults to [xTheme.borderRadius].
  final BorderRadius? borderRadius;
  BorderRadius get _borderRadius => borderRadius ?? xTheme.borderRadius;

  /// An optional padding setting.
  ///
  /// The default padding is computed from the density value.
  final EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry get _padding => padding
      ?? EdgeInsets.symmetric(
        horizontal: _density,
        vertical: _density/_densityRatio,
      );

  /// An optional margin setting.
  ///
  /// The default margin is computed from the density value.
  final EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry get _margin => margin
      ?? xTheme.margin;

  /// A double managing the padding of the card.
  ///
  /// It has an impact on how close the children fit within the card.
  final double? density;
  double get _density => density ?? xTheme.paddingValue;

  /// The ratio of horizontal density over vertical density.
  ///
  /// Increasing it will decrease the vertical padding if there is some.
  /// Defaults to [xTheme.densityRatio].
  final double? densityRatio;
  double get _densityRatio => densityRatio ?? xTheme.densityRatio;

  // INTERACTIVITY -------------------------------------------------------------

  /// An (optional) functional specifying the behavior of the card when tapped.
  final void Function()? onTap;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [XCard] matching the given parameters.
  const XCard({
    Key? key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.color,
    this.enableShadow,
    this.borderRadius,
    this.margin,
    this.padding,
    this.density,
    this.densityRatio,
    this.onTap,
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {

    return XInkContainer(
      margin: _margin,
      padding: _padding,
      borderRadius: _borderRadius,
      onTap: onTap,
      color: color ?? context.theme.cardColor,
      enableShadow: _enableShadow,
      child: Row(
        children: [

          // LEADING -----------------------------------------------------------
          leading ?? const SizedBox(),

          // SPACING -----------------------------------------------------------
          SizedBox(width: leading == null ? 0 : _density),

          // MAIN BOX ----------------------------------------------------------
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  textAlign: TextAlign.start,
                  style: Get.textTheme.bodyMedium ?? const TextStyle(),
                  child: title,
                ),
                Visibility(
                  visible: subtitle != null,
                  child: SizedBox(height: _density / _densityRatio),
                ),
                Visibility(
                  visible: subtitle != null,
                  child: DefaultTextStyle(
                    style: Get.textTheme.bodySmall ?? const TextStyle(),
                    child: subtitle ?? const SizedBox(),
                  ),
                ),
              ],
            ),
          ),

          // SPACING -----------------------------------------------------------
          SizedBox(width: trailing == null ? 0 : _density),

          // TRAILING ----------------------------------------------------------
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
