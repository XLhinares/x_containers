import "package:flutter/material.dart";

/// An example container to contrast with the others
class ExampleContainer extends StatelessWidget {
  /// Returns a [ExampleContainer] matching the given parameters.
  const ExampleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: const Text(
          "This is a regular [Container] with a colored background."),
    );
  }
}
