import "package:flutter/material.dart";

import "../../x_containers.dart";

/// A custom [ListTile]-style widget.
///
/// It was created to provide a simpler tile alternative to [ListTile] and
/// overcome the issue of the [leading] and [trailing] widgets not being
/// properly aligned.
class XListTile extends StatelessWidget {
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

  // LAYOUT --------------------------------------------------------------------

  /// An optional margin setting.
  ///
  /// The default value is that of [xTheme.padding].
  final EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry get _margin => margin ?? xTheme.padding;

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
  /// > - [margin] works as usual, but by default it is computed from [density] and [densityRatio].
  /// > - [internalHorizontalPadding] and [internalVerticalPadding] manage the spacing between the contents of the tile.
  /// > - [onTap] and [onLongPress] are functions called when the card is tapped or pressed for a longer time.
  const XListTile({
    super.key,
    required this.title,
    this.content,
    this.leading,
    this.trailing,
    this.margin,
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
  /// > - [margin] works as usual, but by default it is computed from [density] and [densityRatio].
  /// > - [onTap] and [onLongPress] are functions called when the card is tapped or pressed for a longer time.
  XListTile.autoPad({
    super.key,
    required this.title,
    this.content,
    this.leading,
    this.trailing,
    required EdgeInsets this.margin,
    this.onTap,
    this.onLongPress,
  })  : internalHorizontalPadding = margin.horizontal,
        internalVerticalPadding = margin.vertical;

  /// Returns an instance of [XListTile] matching the given parameters.
  ///
  /// The title and content are directly provided as [String] rather than [Widgets].
  ///
  /// PARAMETERS:
  ///
  /// > - [title] and [content] are Strings.
  /// > - [titleStyle] and [contentStyle] are the styles of [title] and [content].
  /// > - [leading] and [trailing] are widgets.
  /// > - [margin] works as usual, but by default it is computed from [density] and [densityRatio].
  /// > - [internalHorizontalPadding] and [internalVerticalPadding] manage the spacing between the contents of the tile.
  /// > - [onTap] and [onLongPress] are functions called when the card is tapped or pressed for a longer time.
  XListTile.text({
    super.key,
    required String title,
    String? content,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    this.leading,
    this.trailing,
    this.margin,
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
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: _margin,
        child: Row(
          children: [
            // LEADING -----------------------------------------------------------
            leading ?? const SizedBox(),

            // SPACING -----------------------------------------------------------
            SizedBox(width: leading == null ? 0 : _internalHorizontalPadding),

            // MAIN BOX ----------------------------------------------------------
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle()
                        .merge(Theme.of(context).textTheme.titleMedium),
                    textAlign: TextAlign.start,
                    child: title,
                  ),
                  Visibility(
                    visible: content != null,
                    child: SizedBox(height: _internalVerticalPadding),
                  ),
                  Visibility(
                    visible: content != null,
                    child: DefaultTextStyle(
                      style: const TextStyle()
                          .merge(Theme.of(context).textTheme.bodyMedium),
                      child: content ?? const SizedBox(),
                    ),
                  ),
                ],
              ),
            ),

            // SPACING -----------------------------------------------------------
            SizedBox(width: trailing == null ? 0 : _internalHorizontalPadding),

            // TRAILING ----------------------------------------------------------
            trailing ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

// WIDGETS ===================================================================
}
