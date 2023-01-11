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
  /// The default margin is computed from the density value and does NOT use the
  /// [xTheme.padding] property.
  final EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry get _margin =>
      margin ??
      EdgeInsets.symmetric(
        horizontal: _density,
        vertical: _density / _densityRatio,
      );

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
  /// > - [density] is the space between the different elements (title, leading, contents, etc.).
  /// > - [densityRatio] is the ratio of horizontal density over vertical density (for instance, a value of 2 will make the internal padding twice as large as it is tall).
  /// > - [onTap] and [onLongPress] are functions called when the card is tapped or pressed for a longer time.
  const XListTile({
    super.key,
    required this.title,
    this.content,
    this.leading,
    this.trailing,
    this.margin,
    this.density,
    this.densityRatio,
    this.onTap,
    this.onLongPress,
  });

  /// Returns an instance of [XCard] matching the given parameters.
  ///
  /// PARAMETERS:
  ///
  /// > - [title] and [content] are Strings.
  /// > - [titleStyle] and [contentStyle] are the styles of [title] and [content].
  /// > - [leading] and [trailing] are widgets.
  /// > - [margin] works as usual, but by default it is computed from [density] and [densityRatio].
  /// > - [density] is the space between the different elements (title, leading, contents, etc.).
  /// > - [densityRatio] is the ratio of horizontal density over vertical density (for instance, a value of 2 will make the internal padding twice as large as it is tall).
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
    this.density,
    this.densityRatio,
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
            SizedBox(width: leading == null ? 0 : _density),

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
                    child: SizedBox(height: _density / _densityRatio),
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
            SizedBox(width: trailing == null ? 0 : _density),

            // TRAILING ----------------------------------------------------------
            trailing ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

// WIDGETS ===================================================================

}
