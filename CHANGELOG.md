## 1.2.0

- `ADDED`: [XListTile] as a way to have a box-less reusable tile layout.
- `ADDED`: A preset [TextTheme] to [xTheme.getTheme] that can be fully or partially overridden.
- `CHANGED`: [XCard] and [XSnackbar] use [XListTile].
- `CHANGED`: The documentation which is now handled in part by macros.
- `CHANGED`: The example to showcase changing the text theme through [xTheme].

- `BREAKING`: [XSnackbar] doesn't use the [titleStyle] and [contentStyle] properties which are handled by the text theme.

## 1.1.1

- `CHANGED`: Fixed library name (from `x_container` to `x_containers`).

## 1.1.0

- `ADDED`: a makefile containing a few utility commands.
- `IMPROVED`: The documentation comments on the class constructors.
- `IMPROVED`: The [XDialog] buttons turn invisible if their label is set to [null].

- `BREAKING`: In [XSnackbar], the field [message] is renamed to [content] to match the naming of other classes.
- `BREAKING`: In [XCard], the field [subtitle] is renamed to [content] to match the naming of other classes.

- `CHANGED`: The example to match the breaking changes.

## 1.0.3-dev.1

- `IMPROVED`: The README for even better legibility.
- `IMPROVED`: Using asset image from github.

## 1.0.2

- `ADDED`: An XContainers preview image for the README.
- `IMPROVED`: The README structure for legibility.
- `IMPROVED`: The CHANGELOG because it wasn't displayed properly on pub.dev.
- `REFACTORED`: The code using `flutter format .`.

## 1.0.1

- `IMPROVED`: Extensive examples of the use of the different XContainers.

## 1.0.0

- `DELETED`: Uses of the `get` package, because it made XContainers not work with non-get apps. 
- `DELETED`: [PhysicalModel] from [XContainer] and [XInkContainer] since the [Material] widget handles the same properties. 
- `DELETED`: Temporarily got rid of the custom [TextTheme] generation by the [xTheme] object, as it caused issues during theme changes.
- `IMPROVED`: Generation of a [ThemeData] by the [xTheme] object.

## 0.2.3

- `REFACTORED`: Using relative imports.
- `REFACTORED`: Non-top-level code has been moved to `lib/src/`.
- `ADDED`: A description of how to use `CHANGELOG.md`.
- `IMPROVED`: `README.md` to be more clear and match some updates.

## 0.2.2

- `CHANGED`: [XContainer] use a physical model for better shadows.
- `CHANGED`: [XSnackBar] now has a [maxWidth] attribute.

## 0.2.1

- `CHANGED`: [ShadowContainer] becomes [XContainer].
- `CHANGED`: [InkContainer] becomes [XInkContainer].
- `CHANGED`: Input fields now have padding surrounding the contents in [xTheme.getTheme].

## 0.2.0

- `ADDED`: Theme generator from a palette.
- `IMPROVED`: XContainers now use context for colors which allows for smooth theme changes.

## 0.1.0

- `CHANGED`: Versioning now use the first number for major versions, the second for minor and the third for fixes.

## 0.0.3

- `ADDED`: [XDialog].
- `ADDED`: [XSnackbar]. 
- `IMPROVED`: Some [XTheme] values and added support for [XDialog] and [XSnackbar].
- `IMPROVED`: Example to include XDialog and XSnackbar.
- `CHANGED`: [xPadding] variables have become static members of [XLayout].

## 0.0.2

- `ADDED`: some default padding values.
- `ADDED`: XLayout class to manage common layout features.

## 0.0.1

- `ADDED`: ShadowContainer.
- `ADDED`: InkContainer.
- `ADDED`: XCard.
- `ADDED`: XTheme to manage the shared properties.


## How to use

Every time a new version is uploaded, add a new section to the top of the file.
The title each section should start with `##`.
The content of the section should be a bullet point list, with each point starting by one of the keywords listed below, and followed by a short description of the change.

Keywords:

- `ADDED`: When you add a new feature or dependency.
- `IMPROVED`: When you make some feature or code better.
- `CHANGED`: When you switch some code for different code (for instance, if we decided to radically change the way the movies are displayed).
- `DELETED`: When you remove some feature or code.
- `REFACTORED`: When you change file names or a linting rule.
- `BREAKING`: Any breaking change.

## WARNING

Don't forget to change the version in pubspec.yaml when a new version is added here!