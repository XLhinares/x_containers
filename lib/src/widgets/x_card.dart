import "package:flutter/material.dart";

import "../../x_containers.dart";

/// A custom [Card]-like widget to standardize the tiles within the app.
class XCard extends StatelessWidget {
  // VARIABLES =================================================================

  // CHILDREN ------------------------------------------------------------------

  /// An (optional) widget to be displayed on the left of the card.
  final Widget? leading;

  /// The title of the card.
  final Widget title;

  /// The (optional) content of the card.
  final Widget? content;

  /// An (optional) widget to be displayed on the right of the card.
  final Widget? trailing;

  // COLOR ---------------------------------------------------------------------

  /// {@macro x_containers.docs.color}
  final Color? color;

  /// {@macro x_containers.docs.enableShadow}
  final bool? enableShadow;
  bool get _enableShadow => enableShadow ?? xTheme.enableShadow;

  // LAYOUT --------------------------------------------------------------------

  /// {@macro x_containers.docs.borderRadius}
  final BorderRadius? borderRadius;
  BorderRadius get _borderRadius => borderRadius ?? xTheme.borderRadius;

  /// An optional padding setting.
  ///
  /// The default padding is computed from the density value.
  final EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry get _padding => padding ?? xTheme.padding;

  /// {@macro x_containers.docs.margin}
  final EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry get _margin => margin ?? xTheme.margin;

  /// A double managing the horizontal padding between the contents of card.
  final double? internalHorizontalPadding;
  double get _internalHorizontalPadding =>
      internalHorizontalPadding ?? xTheme.internalHorizontalPadding;

  /// A double managing the horizontal padding between the contents of card.
  final double? internalVerticalPadding;
  double get _internalVerticalPadding =>
      internalVerticalPadding ?? xTheme.internalVerticalPadding;

  // INTERACTIVITY -------------------------------------------------------------

  /// {@macro x_containers.docs.onTap}
  final void Function()? onTap;

  /// {@macro x_containers.docs.onLongPress}
  final void Function()? onLongPress;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [XCard] matching the given parameters.
  ///
  /// PARAMETERS:
  ///
  /// > - [title], [content], [leading] and [trailing] are widgets.
  /// > - [color], [margin] and [padding] work as usual.
  /// > - [enableShadow] decides whether the card casts a shadow.
  /// > - [borderRadius] describes the intensity of the curvature of the corners.
  /// > - [internalHorizontalPadding] and [internalVerticalPadding] manage the spacing between the contents of the tile.
  /// > - [onTap] is a function called when the card is tapped.
  const XCard({
    super.key,
    required this.title,
    this.content,
    this.leading,
    this.trailing,
    this.color,
    this.enableShadow,
    this.borderRadius,
    this.margin,
    this.padding,
    this.internalHorizontalPadding,
    this.internalVerticalPadding,
    this.onTap,
    this.onLongPress,
  });

  /// Returns an instance of [XCard] matching the given parameters.
  ///
  /// The internal horizontal and vertical padding match the horizontal and vertical values of the margin.
  ///
  /// PARAMETERS:
  ///
  /// > - [title], [content], [leading] and [trailing] are widgets.
  /// > - [color], [margin] and [padding] work as usual.
  /// > - [enableShadow] decides whether the card casts a shadow.
  /// > - [borderRadius] describes the intensity of the curvature of the corners.
  /// > - [onTap] is a function called when the card is tapped.
  XCard.autoPad({
    super.key,
    required this.title,
    this.content,
    this.leading,
    this.trailing,
    this.color,
    this.enableShadow,
    this.borderRadius,
    this.margin,
    required EdgeInsets this.padding,
    this.onTap,
    this.onLongPress,
  })  : internalHorizontalPadding = padding.horizontal,
        internalVerticalPadding = padding.vertical;

  /// Returns an instance of [XCard] matching the given parameters.
  ///
  /// PARAMETERS:
  ///
  /// > - [title], [content] are Strings.
  /// > - [titleStyle] and [contentStyle] are the styles of [title] and [content].
  /// > - [leading] and [trailing] are widgets.
  /// > - [color], [margin] and [padding] work as usual.
  /// > - [enableShadow] decides whether the card casts a shadow.
  /// > - [borderRadius] describes the intensity of the curvature of the corners.
  /// > - [internalHorizontalPadding] and [internalVerticalPadding] manage the spacing between the contents of the tile.
  /// > - [onTap] is a function called when the card is tapped.
  XCard.text({
    super.key,
    required String title,
    String? content,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    this.leading,
    this.trailing,
    this.color,
    this.enableShadow,
    this.borderRadius,
    this.margin,
    this.padding,
    this.internalHorizontalPadding,
    this.internalVerticalPadding,
    this.onTap,
    this.onLongPress,
  })  : title = Text(
          title,
          style: titleStyle,
        ),
        content = content == null
            ? null
            : Text(
                content,
                style: contentStyle,
              );

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return XButton(
      margin: _margin,
      padding: EdgeInsets.zero,
      borderRadius: _borderRadius,
      onTap: onTap,
      color: color ?? Theme.of(context).cardColor,
      enableShadow: _enableShadow,
      child: XListTile(
        title: title,
        content: content,
        leading: leading,
        trailing: trailing,
        margin: _padding,
        internalHorizontalPadding: _internalHorizontalPadding,
        internalVerticalPadding: _internalVerticalPadding,
      ),
    );
  }
}
