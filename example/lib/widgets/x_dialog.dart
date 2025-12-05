import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../globals.dart";

/// An example for using the [XDialog] widget.
class ExampleXDialog extends StatelessWidget {
  /// Returns a [ExampleXDialog] matching the given parameters.
  const ExampleXDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: XButton.text(
        "Tap to display an [XDialog].",
        margin: XLayout.edgeInsetsAllS,
        onTap: () => XDialog.text(
          title: "Do you want to toggle dark mode on/off?",
          validateText: "Yes, please",
          cancelText: "No, thanks",
          textAccentColor: context.theme.colorScheme.secondary,
          onValidate: () => toggleTheme(),
        ).show(context),
      ),
    );
  }
}
