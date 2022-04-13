A Flutter package offering more adaptive container widgets.

## Features

Add this to your Flutter app to:
- Have more container-type widgets at your disposal 
- Easily manage the style of your XContainers via a shared setting object.

## Getting started

To get started, run the command:
```shell
$ flutter pub add x_containers
```

Then you'll be able to use:
```dart
import 'package:x_containers/x_containers.dart';
```

## Usage

This package gives you access to the following widgets:


```dart
xSettings.primaryColor = Colors.red;
xSettings.enableShadow = false;

ShadowContainer(
  padding: EdgeInset.all(10),
  enableShadow: true,
  child: Text("I have a shadow!"),
);

InkContainer(
  padding: EdgeInset.all(10),
  onTap: () => print("I've been tapped on!"),
  child: Text("Tap me!"),
);
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
