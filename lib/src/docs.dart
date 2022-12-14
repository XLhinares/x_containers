import "package:flutter/material.dart";

/// An un-instantiable class containing the common documentation for the package.
class Documentation {
  // CHILDREN ==================================================================

  // CHILD
  /// {@template x_containers.docs.child}
  /// The widget below this in the widget tree.
  /// {@endtemplate}
  final Widget child;

  // TITLE
  /// {@template x_containers.docs.title}
  /// The title of the tile.
  ///
  /// It should summarize the contents of the tile.
  /// {@endtemplate}
  final Widget title;

  // CONTENT
  /// {@template x_containers.docs.content}
  /// The contents of the tile.
  ///
  /// It is optional but if you leave it empty, you might want to consider
  /// trading this widget for an [XContainer] or an [XInkContainer].
  /// {@endtemplate}
  final Widget content;

  // LEADING
  /// {@template x_containers.docs.leading}
  /// An widget to be displayed on the left of the tile.
  ///
  /// It is optional and won't take space if set to [null].
  ///
  /// It is usually used to place icons or elements identifying the type of
  /// content at a glance.
  /// {@endtemplate}
  final Widget leading;

  // TRAILING
  /// {@template x_containers.docs.trailing}
  /// An widget to be displayed on the right of the tile.
  ///
  /// It is optional and won't take space if set to [null].
  /// {@endtemplate}
  final Widget trailing;

  // COLORS =====================================================================

  // COLOR
  /// {@template x_containers.docs.color}
  /// The main color of the box.
  /// {@endtemplate}
  final Color color;

  // GRADIENT
  /// {@template x_containers.docs.gradient}
  /// An optional gradient to color the box.
  ///
  /// If it is not null, then it overrides the color.
  /// {@endtemplate}
  final Gradient gradient;

  // SHADOW COLOR
  /// {@template x_containers.docs.shadowColor}
  /// The color of the shadow of the box.
  /// {@endtemplate}
  final Color shadowColor;

  // ENABLE SHADOW
  /// {@template x_containers.docs.enableShadow}
  /// Whether the box should have a shadow.
  ///
  /// Defaults to [xTheme.enableShadow].
  /// {@endtemplate}
  final bool enableShadow;

  // LAYOUT ======================================================================

  // ALIGNMENT
  /// {@template x_containers.docs.alignment}
  /// An optional alignment setting.
  ///
  /// Defaults to [xTheme.alignment].
  /// {@endtemplate}
  final Alignment alignment;

  // PADDING
  /// {@template x_containers.docs.padding}
  /// An optional padding setting.
  ///
  /// Defaults to [xTheme.padding].
  /// {@endtemplate}
  final EdgeInsets padding;

  // MARGIN
  /// {@template x_containers.docs.margin}
  /// An optional margin setting.
  ///
  /// Defaults to [xTheme.margin].
  /// {@endtemplate}
  final EdgeInsets margin;

  // BORDER RADIUS
  /// {@template x_containers.docs.borderRadius}
  /// An optional border radius setting.
  ///
  /// Defaults to [xTheme.borderRadius].
  /// {@endtemplate}
  final BorderRadius borderRadius;

  // BORDER DECORATION
  /// {@template x_containers.docs.borderDecoration}
  /// An optional box border setting.
  ///
  /// Defaults to [xTheme.borderDecoration].
  /// {@endtemplate}
  final Border borderDecoration;

  // BOX CONSTRAINTS
  /// {@template x_containers.docs.constraints}
  /// An optional BoxConstraints setting.
  /// {@endtemplate}
  final BoxConstraints constraints;

  // WIDTH
  /// {@template x_containers.docs.width}
  /// The optional horizontal extent of the container.
  /// {@endtemplate}
  final double width;

  // HEIGHT
  /// {@template x_containers.docs.height}
  /// The optional vertical extent of the container.
  /// {@endtemplate}
  final double height;

  // INTERACTIVITY =============================================================

  // ON TAP
  /// {@template x_containers.docs.onTap}
  /// An optional behavior when the container is tapped on.
  /// {@endtemplate}
  final void Function()? onTap;

  // ON LONG PRESS
  /// {@template x_containers.docs.onLongPress}
  /// An optional behavior when the container is pressed on for a longer time.
  /// {@endtemplate}
  final void Function()? onLongPress;

  // SPLASH COLOR
  /// {@template x_containers.docs.splashColor}
  /// A splash color to paint when the container is tapped.
  /// {@endtemplate}
  final Color? splashColor;

  // ENABLE SPLASH
  /// {@template x_containers.docs.enableSplash}
  /// Whether the container should "splash" when tapped on.
  ///
  /// Defaults to [xTheme.enableSplash].
  /// {@endtemplate}
  final bool? enableSplash;

  // CONSTRUCTOR ===============================================================

  Documentation._internal(
    this.child,
    this.color,
    this.gradient,
    this.shadowColor,
    this.enableShadow,
    this.alignment,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderDecoration,
    this.constraints,
    this.width,
    this.height,
    this.onTap,
    this.onLongPress,
    this.splashColor,
    this.enableSplash,
    this.title,
    this.content,
    this.leading,
    this.trailing,
  );
}
