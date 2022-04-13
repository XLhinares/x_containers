// Flutter dependencies
import "package:flutter/material.dart";

// Project dependencies
import "package:x_containers/x_containers.dart";

void main() {

  // Setting the global theme of XContainers
  xTheme.set(
    primaryColor: Colors.blueGrey,
    shadowColor: Colors.deepPurple,
    padding: const EdgeInsets.all(20),
  );

  runApp(const MyApp());
}

/// A mock app to demonstrate how to use the XContainers.
class MyApp extends StatelessWidget {

  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [MyApp] matching the given parameters.
  const MyApp({Key? key}) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: ListView(
        children: [

          const ShadowContainer(
            margin: EdgeInsets.all(50),
            child: Text("This is a [ShadowContainer]"),
          ),

          InkContainer(
            height: 50,
            margin: const EdgeInsets.all(20),
            onTap: () => customDialog(context, "I have been tapped on!"),
            child: const Text("Tap me!"),
          ),

          CustomCard(
            title: const Text("A card"),
            subtitle: const Text("It works like a ListTile within a Card, but the trailing and leading widgets are leveled and the density can be modified."),
            leading: const Icon(Icons.sentiment_satisfied),
            trailing: const Icon(Icons.sentiment_satisfied),
            onTap: () => customDialog(context, "You can also tap on me :)"),
          )
        ],
      ),
    );
  }

  // METHODS ===================================================================

  /// Displays a customized [AlertDialog].
  void customDialog (BuildContext context, String message) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
    ),
  );
}
