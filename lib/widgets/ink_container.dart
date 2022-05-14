// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";

/// A tap-able custom container with ink properties.
///
/// It has the same properties as a regular container with the exception the some
/// decorations can be set directly without using a [BoxDecoration].
/// Obviously, these decorations will be overriden if the property [decoration]
/// is provided.
///
/// On top of the container, a ink behavior is implemented to allow tapping with
/// splash animations.
class InkContainer extends StatelessWidget {

  // VARIABLES =================================================================

  // COLORS --------------------------------------------------------------------

  /// The main color of the box.
  ///
  /// Defaults to [xTheme.primaryColor]
  final Color? color;
  Color? get _primaryColor => color ?? xTheme.primaryColor;

  /// An optional gradient to color the box.
  ///
  /// If it is not null, then it overrides the color.
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

  // INTERACTIVITY -------------------------------------------------------------

  /// An optional behavior when the container is tapped on.
  final void Function()? onTap;

  /// A splash color to paint when the container is tapped.
  ///
  /// Defaults to [xTheme.splashColor].
  final Color? splashColor;
  Color? get _splashColor => splashColor ?? xTheme.splashColor;

  /// Whether the container should "splash" when tapped on.
  ///
  /// Defaults to [xTheme.enableSplash].
  final bool? enableSplash;
  bool get _enableSplash => enableSplash ?? xTheme.enableSplash;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [InkContainer] matching the given parameters.
  const InkContainer({
    Key? key,
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
    this.enableSplash,
    this.splashColor,
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: _margin,

      // A Physical model to be able to cast a shadow.
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: _borderRadius,
        elevation: _enableShadow ? 5 : 0,
        shadowColor: _shadowColor ?? Theme.of(context).shadowColor,

        // A material ancestor for the InkWell
        child: Material(
          color: _gradient != null
              ? null
              : (_primaryColor ?? Theme.of(context).primaryColor),
          borderRadius: _borderRadius,

          // A tappable InkWell
          child: InkWell(
            onTap: onTap,
            splashColor: _enableSplash
                ? (_splashColor ?? Theme.of(context).colorScheme.secondary)
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
                color: _gradient != null
                    ? null
                    : Colors.transparent,
                gradient: _gradient,
                borderRadius: _borderRadius,
                border: _borderDecoration,
              ),
              child: _child,
            ),
          ),
        ),
      ),
    );
  }
}
