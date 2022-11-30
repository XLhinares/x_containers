import "package:flutter/material.dart";
import "package:x_containers/x_containers.dart";

import "../globals.dart";

/// An example for using the [XDialog] widget.
class ExampleXDialog extends StatelessWidget {

  /// Returns a [ExampleXDialog] matching the given parameters.
  const ExampleXDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
      ),
      onPressed: () => XDialog.text(
        title: "Do you want to toggle dark mode on/off?",
        validateText: "Yes",
        cancelText: "No",
        onValidate: () => toggleTheme(),
      ).show(context),
      child: Text("Tap to display an [XDialog].",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
