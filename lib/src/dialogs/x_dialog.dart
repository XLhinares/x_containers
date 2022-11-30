import "dart:ui";

import "package:flutter/material.dart";

import "../../x_containers.dart";

/// A custom [AlertDialog]
class XDialog {

  // VARIABLES =================================================================

  /// The text to display at the top of the dialog.
  final Widget title;

  /// The description of the effect of the dialog.
  final Widget? content;

  /// The text displayed on the cancel button.
  ///
  /// If it is [null] then the button isn't displayed.
  final String? cancelText;

  /// The text displayed on the validate button.
  ///
  /// If it is [null] then the button isn't displayed.
  final String? validateText;

  /// The color of the background of the box.
  final Color? color;

  /// The behavior to execute when the "cancel" button is pressed.
  ///
  /// It isn't optimal to rely on it as the user may close the dialog by tapping
  /// outside the box.
  final void Function()? onCancel;

  /// The behavior to execute when the "validate" button is pressed.
  final void Function()? onValidate;

  /// The intensity of the gaussian blur applied to the background.
  ///
  /// [0] means no blurring.
  final double backgroundBlur;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [XDialog] matching the given parameters.
  const XDialog({
    required this.title,
    this.content,
    this.cancelText = "Cancel",
    this.validateText = "Okay",
    this.onCancel,
    this.onValidate,
    this.color,
    this.backgroundBlur = 1,
  });

  /// Returns an XDialog displaying only text messages.
  factory XDialog.text ({
    required String title,
    String? content,
    String? cancelText = "Cancel",
    String? validateText = "Okay",
    void Function()? onCancel,
    void Function()? onValidate,
    double backgroundBlur = 1,
  }) => XDialog(
    title: Text(title),
    content: content == null ? null : Text(content),
    cancelText: cancelText,
    validateText: validateText,
    onCancel: onCancel,
    onValidate: onValidate,
    backgroundBlur: backgroundBlur,
  );

  // BUILD =====================================================================

  /// Displays the dialog on the screen.
  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: backgroundBlur,
          sigmaY: backgroundBlur,
        ),
        child: AlertDialog(
          backgroundColor: color ?? Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(borderRadius: xTheme.dialogBorderRadius),
          title: DefaultTextStyle(
              style: Theme.of(context).textTheme.titleSmall ?? const TextStyle(),
              child: title
          ),
          content: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyMedium ?? const TextStyle(),
              child: content ?? const SizedBox()
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onCancel?.call();
              },
              child: Text(cancelText ?? "Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onValidate?.call();
              },
              child: Text(validateText ?? "Okay"),
            ),
          ],
        ),
      ),
    );
  }
}
