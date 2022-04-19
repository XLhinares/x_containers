// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";

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
  ///
  /// Defaults to [xTheme.cardColor] or the theme card color if needed.
  final Color? color;
  Color? get _color => color
      ?? xTheme.cardColor;


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
        vertical: _density/densityRatio,
      );

  /// An optional margin setting.
  ///
  /// The default margin is computed from the density value.
  final EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry get _margin => margin
      ?? EdgeInsets.all(xTheme.paddingValue);

  /// A double managing the padding of the card.
  ///
  /// It has an impact on how close the children fit within the card.
  final double? density;
  double get _density => density ?? xTheme.paddingValue;

  /// The ratio of horizontal density over vertical density.
  ///
  /// Default value: 4.
  /// Increasing it will increase the vertical padding.
  final double densityRatio;

  // INTERACTIVITY -------------------------------------------------------------

  /// An (optional) functional specifying the behavior of the card when tapped.
  final void Function()? onTap;

  // GETTERS ===================================================================


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
    this.densityRatio = 4,
    this.onTap,
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {

    return InkContainer(
      margin: _margin,
      padding: _padding,
      borderRadius: _borderRadius,
      onTap: onTap,
      color: _color ?? Theme.of(context).cardColor,
      enableShadow: _enableShadow,
      child: Row(
        children: [
          leading ?? const SizedBox(),
          SizedBox(width: leading == null ? 0 : _density,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium ?? TextStyle(),
                  child: title,
                ),
                Visibility(
                  visible: subtitle != null,
                  child: SizedBox(height: _density,),
                ),
                Visibility(
                  visible: subtitle != null,
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodySmall ?? TextStyle(),
                    child: subtitle ?? const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: trailing == null ? 0 : _density,),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }

// METHODS ===================================================================

}