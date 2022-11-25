import "package:flutter/material.dart";
import "package:x_containers/x_containers.dart";

void main() {

  // Setting the global theme shared across XContainers.
  xTheme.set(
    padding: const EdgeInsets.all(20),
  );

  runApp(
    MaterialApp(
      home: const MyApp(),
      darkTheme: xTheme.getTheme(
        mode: ThemeMode.dark,
        primary: const Color(0xFF464245),
        background: const Color(0xFF282627),
      ),
      themeMode: ThemeMode.dark,
    ),
  );
}

/// A mock app to demonstrate how to use the XContainers.
class MyApp extends StatelessWidget {

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [MyApp] matching the given parameters.
  const MyApp({Key? key}) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("XContainer: Examples"),
      ),
      body: ListView(
        children: [

          // SHADOW CONTAINER --------------------------------------------------
          XContainer(
            margin: EdgeInsets.all(XLayout.paddingM),
            child: const Text("This is a [ShadowContainer]"),
          ),

          // Vertical gap
          XLayout.verticalS,

          // INK CONTAINER -----------------------------------------------------
          XInkContainer(
            height: 100,
            margin: EdgeInsets.all(XLayout.paddingM),
            onTap: () => XDialog.text(title: "I have been tapped on!").show(context),
            child: const Text("Tap me!"),
          ),

          // CUSTOM CARD -------------------------------------------------------
          XCard(
            title: const Text("A card"),
            subtitle: const Text("It works like a ListTile within a Card, but the trailing and leading widgets are leveled and the density can be modified."),
            leading: const Icon(Icons.sentiment_very_satisfied, size: 40,),
            trailing: const Icon(Icons.sentiment_very_satisfied, size: 40,),
            margin: const EdgeInsets.all(20),
            density: 20,
            onTap: () => XSnackbar.text(title: "You can also tap on me :)").show(),
          ),
        ],
      ),
    );
  }
}
