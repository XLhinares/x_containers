import "package:flutter/material.dart";
import "package:x_containers/x_containers.dart";

/// An example for using the [XCard] widget.
class ExampleXCard extends StatelessWidget {
  /// Returns a [ExampleXCard] matching the given parameters.
  const ExampleXCard({super.key});

  @override
  Widget build(BuildContext context) {
    return XCard.text(
      internalHorizontalPadding: XLayout.paddingM,
      internalVerticalPadding: XLayout.paddingXS,
      padding: XLayout.edgeInsetsAllM,
      margin: XLayout.edgeInsetsAllS,
      leading: Icon(
        Icons.check_circle,
        size: XLayout.paddingL,
      ),
      title: "This is an [XCard].",
      content: "It works similarly to a [ListTile] within a [Card].",
    );
  }
}
