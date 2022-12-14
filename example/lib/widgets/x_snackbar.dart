import "package:flutter/material.dart";
import "package:x_containers/x_containers.dart";

/// An example for using the [XSnackbar] widget.
class ExampleXSnackbar extends StatelessWidget {
  /// Returns a [ExampleXSnackbar] matching the given parameters.
  const ExampleXSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
      ),
      onPressed: () => XSnackbar.text(
        title: "Here it is :)",
        content: "You can add some more text if you'd like.",
      ).show(context),
      child: Text(
        "Tap to display an [XSnackbar].",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
