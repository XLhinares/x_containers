import "dart:ui";

import "package:flutter/material.dart";

import "../../x_containers.dart";

/// A custom [AlertDialog] matching the style of XContainers.
///
/// It features a title and a content widget and two callback buttons.
/// The buttons are traditionally used for "yes" and "no" behaviors
/// but can be renamed and will not be displayed if their name is set to [null].
class XDialog {
  // VARIABLES =================================================================

  /// {@macro x_containers.docs.title}
  final Widget title;

  /// {@macro x_containers.docs.content}
  final Widget? content;

  /// The text displayed on the cancel button.
  ///
  /// If it is [null] then the button isn't displayed.
  final String? cancelText;

  /// The text displayed on the validate button.
  ///
  /// If it is [null] then the button isn't displayed.
  final String? validateText;

  /// {@macro x_containers.docs.color}
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
  ///
  /// - [title] and [content] are widgets.
  /// - [cancelText] and [validateText] are the Strings displayed on the buttons.
  /// - [onCancel] and [onValidate] are the callbacks run when the buttons are pressed.
  /// - [color] is the background color of the dialog.
  /// - [backgroundBlur] is the intensity of the gaussian blur applied to stuff that is "behind" the dialog.
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
  ///
  /// - [title] and [content] are Strings.
  /// - [cancelText] and [validateText] are the Strings displayed on the buttons.
  /// - [onCancel] and [onValidate] are the callbacks run when the buttons are pressed.
  /// - [color] is the background color of the dialog.
  /// - [backgroundBlur] is the intensity of the gaussian blur applied to stuff that is "behind" the dialog.
  factory XDialog.text({
    required String title,
    String? content,
    String? cancelText = "Cancel",
    String? validateText = "Okay",
    void Function()? onCancel,
    void Function()? onValidate,
    Color? color,
    double backgroundBlur = 1,
  }) =>
      XDialog(
        title: Text(title),
        content: content == null ? null : Text(content),
        cancelText: cancelText,
        validateText: validateText,
        onCancel: onCancel,
        onValidate: onValidate,
        color: color,
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
          contentPadding: xTheme.padding,
          backgroundColor: color ?? Theme.of(context).cardColor,
          shape:
              RoundedRectangleBorder(borderRadius: xTheme.dialogBorderRadius),
          title: DefaultTextStyle(
            style: const TextStyle()
                .merge(Theme.of(context).textTheme.titleMedium),
            child: title,
          ),
          content: DefaultTextStyle(
            style:
                const TextStyle().merge(Theme.of(context).textTheme.bodyMedium),
            child: content ?? const SizedBox(),
          ),
          actions: <Widget>[
            Visibility(
              visible: cancelText != null,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onCancel?.call();
                },
                child: Text(cancelText ?? "Cancel"),
              ),
            ),
            Visibility(
              visible: validateText != null,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onValidate?.call();
                },
                child: Text(validateText ?? "Okay"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
