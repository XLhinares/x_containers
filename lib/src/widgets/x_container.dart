import "package:flutter/material.dart";

import "../../x_containers.dart";

/// A custom container with a shadow!
class XContainer extends StatelessWidget {
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

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [XContainer] matching the given parameters.
  const XContainer({
    super.key,
    // color
    this.color,
    this.gradient,
    this.shadowColor,
    this.enableShadow,
    // shape
    this.borderRadius,
    this.borderDecoration,
    this.alignment,
    // layout
    this.padding,
    this.margin,
    this.constraints,
    this.width,
    this.height,
    // child
    this.child,
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
        child: Container(
          alignment: _alignment,
          width: _width,
          height: _height,
          padding: _padding,
          constraints: _constraints,
          decoration: BoxDecoration(
            gradient: _gradient,
            borderRadius: _borderRadius,
            border: _borderDecoration,
          ),
          child: _child,
        ),
      ),
    );
  }
}
