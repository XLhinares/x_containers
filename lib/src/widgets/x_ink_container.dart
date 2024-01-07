import "package:flutter/material.dart";

import "../../x_containers.dart";

/// A tap-able custom container with ink properties.
///
/// It has the same properties as a regular container with the exception the some
/// decorations can be set directly without using a [BoxDecoration].
/// However, these decorations will be overridden if the property [decoration]
/// is provided.
///
/// On top of the container, a ink behavior is implemented to allow tapping with
/// splash animations.
class XInkContainer extends StatelessWidget {
  // VARIABLES =================================================================

  // COLORS --------------------------------------------------------------------

  /// {@macro x_containers.docs.color}
  final Color? color;

  /// {@macro x_containers.docs.gradient}
  final Gradient? gradient;
  Gradient? get _gradient => gradient;

  /// {@macro x_containers.docs.shadowColor}
  final Color? shadowColor;

  /// {@macro x_containers.docs.enableShadow}
  final bool? enableShadow;
  bool get _enableShadow => enableShadow ?? xTheme.enableShadow;

  // LAYOUT --------------------------------------------------------------------

  /// {@macro x_containers.docs.alignment}
  final AlignmentGeometry? alignment;
  AlignmentGeometry? get _alignment => alignment ?? xTheme.alignment;

  /// {@macro x_containers.docs.padding}
  final EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry get _padding => padding ?? xTheme.padding;

  /// {@macro x_containers.docs.margin}
  final EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry get _margin => margin ?? xTheme.margin;

  /// {@macro x_containers.docs.borderRadius}
  final BorderRadius? borderRadius;
  BorderRadius get _borderRadius => borderRadius ?? xTheme.borderRadius;

  /// {@macro x_containers.docs.borderDecoration}
  final BoxBorder? borderDecoration;
  BoxBorder? get _borderDecoration =>
      borderDecoration ?? xTheme.borderDecoration;

  /// {@macro x_containers.docs.constraints}
  final BoxConstraints? constraints;
  BoxConstraints? get _constraints => constraints;

  /// {@macro x_containers.docs.width}
  final double? width;
  double? get _width => width;

  /// {@macro x_containers.docs.height}
  final double? height;
  double? get _height => height;

  /// {@macro x_containers.docs.child}
  final Widget? child;
  Widget? get _child => child;

  // INTERACTIVITY -------------------------------------------------------------

  /// {@macro x_containers.docs.onTap}
  final void Function()? onTap;

  /// {@macro x_containers.docs.onLongPress}
  final void Function()? onLongPress;

  /// {@macro x_containers.docs.splashColor}
  final Color? splashColor;

  /// {@macro x_containers.docs.enableSplash}
  final bool? enableSplash;
  bool get _enableSplash => enableSplash ?? xTheme.enableSplash;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [XInkContainer] matching the given parameters.
  const XInkContainer({
    super.key,
    this.child,
    this.color,
    this.gradient,
    this.shadowColor,
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.width,
    this.height,
    this.borderRadius,
    this.borderDecoration,
    this.enableShadow,
    this.onTap,
    this.onLongPress,
    this.enableSplash,
    this.splashColor,
  });

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _margin,

      // A Physical model to be able to cast a shadow.
      child: Material(
        borderRadius: _borderRadius,
        elevation: _enableShadow ? 5 : 0,
        shadowColor: shadowColor ?? Theme.of(context).shadowColor,
        color: _gradient != null
            ? null
            : (color ?? Theme.of(context).colorScheme.primary),

        // A tappable InkWell
        child: InkWell(
          onTap: onTap,
          splashColor: _enableSplash
              ? (splashColor ?? Theme.of(context).splashColor)
              : Colors.transparent,
          highlightColor: _enableSplash ? null : Colors.transparent,
          borderRadius: _borderRadius,

          // The actual container
          child: Container(
            alignment: _alignment,
            width: _width,
            height: _height,
            padding: _padding,
            constraints: _constraints,
            decoration: BoxDecoration(
              color: _gradient != null ? null : Colors.transparent,
              gradient: _gradient,
              borderRadius: _borderRadius,
              border: _borderDecoration,
            ),
            child: _child,
          ),
        ),
      ),
    );
  }
}
