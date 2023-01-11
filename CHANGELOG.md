## 1.2.2

- :construction_worker: Switched to emojis in the CHANGELOG (matching the gitmoji.dev guide).
- :construction_worker: Add a script to check the version number.
- :sparkles: Added `XListTile.text` and `XCard.text` to not have to wrap strings with a `Text` widget every time.
- :recycle: Changed the example to feature `XListTile.text`.
 
## 1.2.1

- :bug: The `XCard` issue where the padding was stacked with `xTheme.padding`.

## 1.2.0

- :sparkles: `XListTile` as a way to have a box-less reusable tile layout.
- :sparkles: A preset `TextTheme` to `xTheme.getTheme` that can be fully or partially overridden.
- :recycle: Changed `XCard` and `XSnackbar` use `XListTile`.
- :recycle: Changed the documentation which is now handled in part by macros.
- :recycle: Changed the example to showcase changing the text theme through `xTheme`.

- :boom: `XSnackbar` doesn't use the `titleStyle` and `contentStyle` properties which are handled by the text theme.

## 1.1.1

- :recycle: Fixed library name (from `x_container` to `x_containers`).

## 1.1.0

- :sparkles: a makefile containing a few utility commands.
- :zap: Improved The documentation comments on the class constructors.
- :zap: Improved The `XDialog` buttons turn invisible if their label is set to `null`.

- :boom: In `XSnackbar`, the field `message` is renamed to `content` to match the naming of other classes.
- :boom: In `XCard`, the field `subtitle` is renamed to `content` to match the naming of other classes.

- :recycle: Changed the example to match the breaking changes.

## 1.0.3-dev.1

- :zap: Improved The README for even better legibility.
- :zap: Improved Using asset image from github.

## 1.0.2

- :sparkles: An XContainers preview image for the README.
- :zap: Improved the README structure for legibility.
- :zap: Improved the CHANGELOG because it wasn't displayed properly on pub.dev.
- :truck: The code using `flutter format .`.

## 1.0.1

- :zap: Added extensive examples of the use of the different XContainers.

## 1.0.0

- :fire: Deleted uses of the `get` package, because it made XContainers not work with non-get apps. 
- :fire: Deleted `PhysicalModel` from `XContainer` and `XInkContainer` since the `Material` widget handles the same properties. 
- :fire: Temporarily got rid of the custom `TextTheme` generation by the `xTheme` object, as it caused issues during theme changes.
- :zap: Improved generation of a `ThemeData` by the `xTheme` object.

## 0.2.3

- :truck: Switched to using relative imports.
- :truck: Non-top-level code has been moved to `lib/src/`.
- :sparkles: Added a description of how to use `CHANGELOG.md`.
- :zap: Improved `README.md` to be more clear and match some updates.

## 0.2.2

- :recycle: Changed `XContainer` use a physical model for better shadows.
- :recycle: Changed `XSnackBar` now has a `maxWidth` attribute.

## 0.2.1

- :recycle: Changed `ShadowContainer` becomes `XContainer`.
- :recycle: Changed `InkContainer` becomes `XInkContainer`.
- :recycle: Changed input fields now have padding surrounding the contents in `xTheme.getTheme`.

## 0.2.0

- :sparkles: Added a theme generator from a palette.
- :zap: XContainers now use context for colors which allows for smooth theme changes.

## 0.1.0

- :recycle: Versioning now use the first number for major versions, the second for minor and the third for fixes.

## 0.0.3

- :sparkles: Added `XDialog`.
- :sparkles: Added `XSnackbar`. 
- :zap: Improved some `XTheme` values and added support for `XDialog` and `XSnackbar`.
- :zap: Improved the example to include XDialog and XSnackbar.
- :recycle: Changed `xPadding` variables have become static members of `XLayout`.

## 0.0.2

- :sparkles: Added some default padding values.
- :sparkles: Added `XLayout` class to manage common layout features.

## 0.0.1

- :sparkles: Added `ShadowContainer`.
- :sparkles: Added `InkContainer`.
- :sparkles: Added `XCard`.
- :sparkles: Added `XTheme` to manage the shared properties.


## How to use

Every time a new version is uploaded, add a new section to the top of the file.
The title each section should start with `##`.
The content of the section should be a bullet point list, with each point starting by one of the keywords listed below, and followed by a short description of the change.

Keywords:

- :sparkles: When you add a new feature or dependency.
- :zap: Improved When you make some feature or code better.
- :bug: When you make a correction to the code.
- :recycle: When you switch some code for different code (for instance, if we decided to radically change the way the movies are displayed).
- :fire: When you remove some feature or code.
- :truck: When you change file names or a linting rule.
- :boom: Any breaking change.

## WARNING

Don't forget to change the version in pubspec.yaml when a new version is added here!