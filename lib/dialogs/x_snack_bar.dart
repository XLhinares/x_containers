// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:get/get.dart";

// Project dependencies
import "package:x_containers/x_containers.dart";

/// A custom snackbar matching the theme of the app.
///
/// It can be shown anywhere without passing the context thanks to the [Get]
/// package.
class XSnackbar {

  // VARIABLES =================================================================

  // CONTENTS ------------------------------------------------------------------

  /// The title of the snackbar: sums up the message.
  final Widget title;

  /// A more extensive description of the snackbar.
  final Widget? message;

  /// An optional [TextStyle] to customize the title.
  final TextStyle? titleStyle;

  /// An optional [TextStyle] to customize the message.
  final TextStyle? messageStyle;

  /// An optional widget to display to the right of the snackbar.
  final Widget? trailing;

  /// An optional [Widget] to display at the left of the snackbar.
  final Widget? leading;

  // PROPERTIES ---------------------------------------------------------------

  /// The background color of the Snackbar.
  final Color? color;

  // BEHAVIOR ------------------------------------------------------------------

  /// The duration for which the widget is displayed.
  final Duration? duration;

  // CONSTRUCTOR ===============================================================

  /// Returns a [XSnackbar] instance which can be displayed via the [show] method.
  const XSnackbar({
    required this.title,
    this.message,
    this.titleStyle,
    this.messageStyle,
    this.leading,
    this.trailing,
    this.color,
    this.duration,
  });

  /// Returns an instance of [XSnackbar] with an undo button.
  ///
  /// The undo button replaces the trailing widget so none can be set.
  factory XSnackbar.withUndo({
    required Widget title,
    Widget? message,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    Widget? leading,
    Color? color,
    Duration? duration,
    void Function()? onUndo
  }) => XSnackbar(
    title: title,
    message: message,
    titleStyle: titleStyle,
    messageStyle: messageStyle,
    leading: leading,
    trailing: TextButton(
      onPressed: onUndo,
      child: const Text("Undo"),
    ),
    color: color,
    duration: duration,
  );

  /// Returns an instance of [XSnackbar] made for displaying mainly text.
  factory XSnackbar.text({
    required String title,
    String? message,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    Widget? leading,
    Widget? trailing,
    Color? color,
    Duration? duration,
  }) => XSnackbar(
    title: Text(title),
    message: message == null ? null : Text(message),
    titleStyle: titleStyle,
    messageStyle: messageStyle,
    leading: leading,
    trailing: trailing,
    color: color,
    duration: duration,
  );

  /// Returns an instance of [XSnackbar] made for displaying mainly text with an undo button.
  ///
  /// The undo button replaces the trailing widget so none can be set.
  factory XSnackbar.textWithUndo({
    required String title,
    String? message,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    Widget? leading,
    Color? color,
    Duration? duration,
    void Function()? onUndo
  }) => XSnackbar(
    title: Text(title),
    message: message == null ? null : Text(message),
    titleStyle: titleStyle,
    messageStyle: messageStyle,
    leading: leading,
    trailing: TextButton(
      onPressed: onUndo,
      child: const Text("Undo"),
    ),
    duration: duration,
  );

  // METHODS ===================================================================

  /// Displays the snackbar on the screen.
  void show () => Get.showSnackbar(
    GetSnackBar(
      titleText: ListTile(
        title: DefaultTextStyle(
          style: titleStyle ?? Get.textTheme.titleSmall ?? const TextStyle(),
          child: title,
        ),
        subtitle: DefaultTextStyle(
          style: messageStyle ?? Get.textTheme.bodySmall ?? const TextStyle(),
          child: message ?? const SizedBox(),
        ),
        trailing: trailing,
      ),
      messageText: const SizedBox(),
      duration: duration ?? const Duration(seconds: 3),
      margin: EdgeInsets.all(XLayout.paddingS),
      padding: EdgeInsets.symmetric(
        vertical: XLayout.paddingS,
        horizontal: XLayout.paddingM,
      ),
      borderRadius: XLayout.paddingS,
      backgroundColor: color ?? Get.theme.cardColor,
      icon: leading == null
          ? null
          : Padding(
        padding: EdgeInsets.only(left: XLayout.paddingS,),
        child: leading,
      ),
    ),
  );

}