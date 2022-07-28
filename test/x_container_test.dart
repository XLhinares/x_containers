// Flutter dependencies
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";

void main() {
  testWidgets("ShadowContainer can have a child.", (WidgetTester tester) async {
    await tester.pumpWidget(
      XContainer(
        color: Colors.grey,
        child: Container(),
      ),
    );
  });
}
