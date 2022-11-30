import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "globals.dart";
import "widgets/widgets.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Setting the global theme shared across XContainers.
  xTheme.set(
    padding: EdgeInsets.all(XLayout.paddingS),
    paddingValue: XLayout.paddingM,
  );

  runApp(const ExampleApp());
}

/// A mock app to demonstrate how to use the XContainers.
class ExampleApp extends StatelessWidget {

  /// Returns a [ExampleApp] matching the given parameters.
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Home(),
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

/// A simple tab listing a few XContainers.
class Home extends StatelessWidget {

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [Home] matching the given parameters.
  const Home({Key? key}) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {

    const List<Widget> examples = [
      ExampleContainer(),
      ExampleXContainer(),
      ExampleXInkContainer(),
      ExampleXCard(),
      ExampleXDialog(),
      ExampleXSnackbar(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("XContainer: Examples"),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(XLayout.paddingM),
        shrinkWrap: true,
        itemCount: examples.length,
        itemBuilder: (_, index) => Center(
          child: examples[index],
        ),
        separatorBuilder: (_, __) => XLayout.verticalS,
      ),
    );
  }
}
