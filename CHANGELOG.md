### 0.2.2

- `REFACTORED`: Using relative imports.
- `REFACTORED`: Non-top-level code has been moved to `lib/src/`.
- `ADDED`: A description of how to use `CHANGELOG.md`.

### 0.2.1

- `CHANGED`: [ShadowContainer] becomes [XContainer].
- `CHANGED`: [InkContainer] becomes [XInkContainer].
- `CHANGED`: Input fields now have padding surrounding the contents in [xTheme.getTheme].

## 0.2.0

- `ADDED`: Theme generator from a palette.
- `IMPROVED`: XContainers now use context for colors which allows for smooth theme changes.

## 0.1.0

- `CHANGED`: Versioning now use the first number for major versions, the second for minor and the third for fixes.

## 0.0.3

- `ADDED`: XDialog.
- `ADDED`: XSnackbar. 
- `IMPROVED`: Some XTheme values and added support for XDialog and XSnackbar.
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

---

## How to use

Every time a new version is uploaded, add a new section to the top of the file.
The title of the section should start with # for a major version, ## for a minor version, and ### for a hotfix.
The content of the section should be a bullet point list, with each point starting by one of the keywords listed below, and followed by a short description of the change.

Keywords:

- `ADDED`: When you add a new feature or dependency.
- `IMPROVED`: When you make some feature or code better.
- `CHANGED`: When you switch some code for different code (for instance, if we decided to radically change the way the movies are displayed).
- `DELETED`: When you remove some feature or code.
- `REFACTORED`: When you change file names or a linting rule.

## WARNING

Don't forget to change the version in pubspec.yaml when a new version is added here!