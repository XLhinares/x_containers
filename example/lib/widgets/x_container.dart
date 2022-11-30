import "package:flutter/material.dart";
import "package:x_containers/x_containers.dart";

/// An example for using the [XContainer] widget.
class ExampleXContainer extends StatelessWidget {
  /// Returns a [ExampleXContainer] matching the given parameters.
  const ExampleXContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return XContainer(
      height: 100,
      margin: EdgeInsets.all(XLayout.paddingS),
      child: const Text(
        "This is an [XContainer], the container I usually use.\n\n"
        "By default it takes all the room it can, but you can wrap it in a min-sized [Row] or [Column] if you need to make it fit the size of its child.",
        textAlign: TextAlign.center,
      ),
    );
  }
}
