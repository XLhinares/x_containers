import "package:flutter/material.dart";
import "package:x_containers/x_containers.dart";

/// An example for using the [XInkContainer] widget.
class ExampleXInkContainer extends StatelessWidget {

  /// Returns a [ExampleXInkContainer] matching the given parameters.
  const ExampleXInkContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return XInkContainer(
      height: 100,
      margin: EdgeInsets.all(XLayout.paddingS),
      onTap: () {},
      child: const Text("This is an [XInkContainer].\n\n"
          "It can be tapped!",
        textAlign: TextAlign.center,
      ),
    );
  }
}
