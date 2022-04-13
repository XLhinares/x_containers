// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";

/// A custom container with a shadow!
class ShadowContainer extends StatelessWidget {

  // VARIABLES =================================================================

  // COLORS --------------------------------------------------------------------

  /// The main color of the box.
  ///
  /// Defaults to [xTheme.primaryColor]
  final Color? color;
  Color? get _primaryColor => color ?? xTheme.primaryColor;

  /// An optional gradient to color the box.
  ///
  /// If it is not null, the it overrides the color.
  final Gradient? gradient;
  Gradient? get _gradient => gradient;

  /// The color of the shadow of the box.
  ///
  /// Defaults to [xTheme.shadowColor].
  final Color? shadowColor;
  Color? get _shadowColor => shadowColor ?? xTheme.shadowColor;

  /// Whether the box should have a shadow.
  ///
  /// Defaults to [xTheme.enableShadow].
  final bool? enableShadow;
  bool get _enableShadow => enableShadow ?? xTheme.enableShadow;

  // LAYOUT --------------------------------------------------------------------

  /// An optional alignment setting.
  ///
  /// Defaults to [xTheme.alignment].
  final AlignmentGeometry? alignment;
  AlignmentGeometry? get _alignment => alignment ?? xTheme.alignment;

  /// An optional padding setting.
  ///
  /// Defaults to [xTheme.padding].
  final EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry get _padding => padding ?? xTheme.padding;

  /// An optional margin setting.
  ///
  /// Defaults to [xTheme.margin].
  final EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry get _margin => margin ?? xTheme.margin;

  /// An optional BorderRadius setting.
  ///
  /// Defaults to [xTheme.borderRadius].
  final BorderRadius? borderRadius;
  BorderRadius get _borderRadius => borderRadius ?? xTheme.borderRadius;

  /// An optional BorderDecoration setting.
  ///
  /// Defaults to [xTheme.borderDecoration].
  final BoxBorder? borderDecoration;
  BoxBorder? get _borderDecoration => borderDecoration ?? xTheme.borderDecoration;

  /// An optional BoxConstraints setting.
  ///
  /// If not specified, there is no constraint.
  final BoxConstraints? constraints;
  BoxConstraints? get _constraints => constraints;

  /// The optional horizontal extent of the container.
  final double? width;
  double? get _width => width;

  /// The optional vertical extent of the container
  final double? height;
  double? get _height => height;

  /// The child to build in the box.
  final Widget? child;
  Widget? get _child => child;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [ShadowContainer] matching the given parameters.
  const ShadowContainer({
    Key? key,
    // color
    this.color,
    this.gradient,
    this.shadowColor,
    this.enableShadow = true,
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
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: _margin,
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: _borderRadius,
        elevation: _enableShadow ? 6 : 0,
        shadowColor: _shadowColor ?? Theme.of(context).shadowColor,

        child: Container(
          alignment: _alignment,
          width: _width,
          height: _height,
          padding: _padding,
          constraints: _constraints,
          decoration: BoxDecoration(
            color: _gradient != null
                ? Colors.transparent
                : (_primaryColor ?? Theme.of(context).primaryColor),
            borderRadius: _borderRadius,
            gradient: _gradient,
            border: _borderDecoration,
          ),
          child: _child,
        ),
      ),
    );
  }
}