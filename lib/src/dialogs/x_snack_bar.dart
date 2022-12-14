import "package:flutter/material.dart";

import "../../x_containers.dart";

/// A custom snackbar matching the style of XContainers.
class XSnackbar {
  // VARIABLES =================================================================

  // CONTENTS ------------------------------------------------------------------

  /// {@macro x_containers.docs.title}
  final Widget title;

  /// {@macro x_containers.docs.content}
  final Widget? content;

  /// {@macro x_containers.docs.trailing}
  final Widget? trailing;

  /// {@macro x_containers.docs.leading}
  final Widget? leading;

  // PROPERTIES ---------------------------------------------------------------

  /// The maximum horizontal extent of the Snackbar.
  ///
  /// Usually used when the screen is too wide.
  final double? maxWidth;

  /// {@macro x_containers.docs.color}
  final Color? color;

  // BEHAVIOR ------------------------------------------------------------------

  /// The duration for which the widget is displayed.
  final Duration duration;

  // CONSTRUCTOR ===============================================================

  /// Returns a [XSnackbar] instance which can be displayed via the [show] method.
  ///
  /// PARAMETERS:
  /// > - [title], [content], [leading] and [trailing] are widgets.
  /// > - [color] is the background color of the snackbar.
  /// > - [maxWidth] is the maximum allowed width of the Snackbar;
  /// > if null, the Snackbar takes the whole screen minus a small padding.
  /// > - [duration] is the time during which the snackbar is displayed.
  const XSnackbar({
    required this.title,
    this.content,
    this.leading,
    this.trailing,
    this.color,
    this.maxWidth,
    this.duration = const Duration(seconds: 4),
  });

  /// Returns an instance of [XSnackbar] with an undo button.
  ///
  /// The undo button replaces the trailing widget so none can be set.
  ///
  /// PARAMETERS:
  /// > - [title], [content] and [leading] are widgets.
  /// > - [titleStyle] and [contentStyle] are the default text style for [Text] widgets inside [title] and [content].
  /// > - [color] is the background color of the snackbar.
  /// > - [maxWidth] is the maximum allowed width of the Snackbar;
  /// > if null, the Snackbar takes the whole screen minus a small padding.
  /// > - [duration] is the time during which the snackbar is displayed.
  /// > - [undoLabel] is the string displayed on the "undo" button.
  /// > - [onUndo] is a callback called when the "undo" button is pressed.
  factory XSnackbar.withUndo({
    required Widget title,
    Widget? content,
    Widget? leading,
    Color? color,
    Duration duration = const Duration(seconds: 4),
    double? maxWidth,
    String undoLabel = "Undo",
    void Function()? onUndo,
  }) =>
      XSnackbar(
        title: title,
        content: content,
        leading: leading,
        trailing: TextButton(
          onPressed: onUndo,
          child: Text(undoLabel),
        ),
        color: color,
        duration: duration,
        maxWidth: maxWidth,
      );

  /// Returns an instance of [XSnackbar] made for displaying mainly text.
  ///
  /// PARAMETERS:
  /// > - [title] and [content] are strings.
  /// > - [titleStyle] and [contentStyle] are the text styles used for [title] and [content].
  /// > - [leading] and [trailing] are widgets.
  /// > - [color] is the background color of the snackbar.
  /// > - [maxWidth] is the maximum allowed width of the Snackbar;
  /// > if null, the Snackbar takes the whole screen minus a small padding.
  /// > - [duration] is the time during which the snackbar is displayed.
  factory XSnackbar.text({
    required String title,
    String? content,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    Widget? leading,
    Widget? trailing,
    Color? color,
    Duration duration = const Duration(seconds: 4),
    double? maxWidth,
  }) =>
      XSnackbar(
        title: Text(
          title,
          style: titleStyle,
        ),
        content: content == null
            ? null
            : Text(
                content,
                style: contentStyle,
              ),
        leading: leading,
        trailing: trailing,
        color: color,
        duration: duration,
        maxWidth: maxWidth,
      );

  /// Returns an instance of [XSnackbar] made for displaying mainly text with an undo button.
  ///
  /// The undo button replaces the trailing widget so none can be set.
  ///
  /// PARAMETERS:
  /// > - [title] and [content] are strings.
  /// > - [titleStyle] and [contentStyle] are the text styles used for [title] and [content].
  /// > - [leading] is a widget.
  /// > - [color] is the background color of the snackbar.
  /// > - [maxWidth] is the maximum allowed width of the Snackbar;
  /// > if null, the Snackbar takes the whole screen minus a small padding.
  /// > - [duration] is the time during which the snackbar is displayed.
  /// > - [undoLabel] is the string displayed on the "undo" button.
  /// > - [onUndo] is a callback called when the "undo" button is pressed.
  factory XSnackbar.textWithUndo({
    required String title,
    String? content,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    Widget? leading,
    Color? color,
    Duration duration = const Duration(seconds: 4),
    double? maxWidth,
    String undoLabel = "Undo",
    void Function()? onUndo,
  }) =>
      XSnackbar(
        title: Text(
          title,
          style: titleStyle,
        ),
        content: content == null
            ? null
            : Text(
                content,
                style: contentStyle,
              ),
        leading: leading,
        trailing: TextButton(
          onPressed: onUndo,
          child: Text(undoLabel),
        ),
        duration: duration,
        color: color,
        maxWidth: maxWidth,
      );

  // METHODS ===================================================================

  /// Displays the snackbar on the screen.
  void show(BuildContext context) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: XListTile(
            title: DefaultTextStyle(
              style: const TextStyle()
                  .merge(Theme.of(context).textTheme.titleMedium),
              child: title,
            ),
            content: DefaultTextStyle(
              style: const TextStyle()
                  .merge(Theme.of(context).textTheme.bodyMedium),
              child: content ?? const SizedBox(),
            ),
            leading: leading == null
                ? null
                : Padding(
                    padding: EdgeInsets.only(
                      left: XLayout.paddingS,
                    ),
                    child: leading,
                  ),
            trailing: trailing,
          ),
          behavior: SnackBarBehavior.floating,
          duration: duration,
          padding: EdgeInsets.symmetric(
            vertical: XLayout.paddingS,
            horizontal: XLayout.paddingM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: xTheme.borderRadius,
          ),
          backgroundColor: color ?? Theme.of(context).cardColor,
          width: maxWidth ??
              MediaQuery.of(context).size.width - 2 * XLayout.paddingS,
        ),
      );
}
