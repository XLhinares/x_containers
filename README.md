# XContainers

A Flutter package offering more adaptive container widgets.
I initially created the `ShadowContainer` as a way to have a customizable container with a shadow.
Then I implemented the other XContainers to easily match the uniformize the style of the containers in my apps without repeating style code everywhere.

## Features

Add this to your Flutter app to:
- Have more container-type widgets at your disposal.
- Uniformize the style of the containers within your app. 
- Easily manage that style via a shared setting object.

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

This package gives you access to the following XContainers:
- `ShadowContainer`: A container-type widget with a shadow and some more customization than a regular container.
- `InkContainer`: A container-type widget with a shadow embedding a GestureDetector with a splash animation.
- `XCard`: A card-type widget meant to replace ListTiles inside Cards, it also fixes the issue of ListTile's leading and trailing properties not being leveled.
- `XDialog`: A custom dialog object that can be displayed with its `show` method.
- `XSnackbar`: A custom dialog object that can be displayed with its `show` method.

You will also find a `xSetting` object, it allows you to customize the default properties of all the XContainers.
Note that if you don't set default colors, the Theme colors will be applied.

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

This is my first package, feel free to check the github to add or ask any info you'd like, or give advice!
