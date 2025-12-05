import "package:flutter/material.dart";
import "package:x_containers/x_containers.dart";

/// An example for using the [XButton] widget.
class ExampleXInkContainer extends StatelessWidget {
  /// Returns a [ExampleXInkContainer] matching the given parameters.
  const ExampleXInkContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return XButton.text(
      "This is an [XButton].\n\n"
      "It can be tapped!",
      textAlign: TextAlign.center,
      height: 100,
      margin: XLayout.edgeInsetsAllS,
      onTap: () {},
    );
  }
}
