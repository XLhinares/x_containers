import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

/// A preset theme for light mode.
ThemeData lightMode = xTheme.getTheme(
  mode: ThemeMode.light,
  primary: const Color(0xFFB4B8AB),
  secondary: const Color(0xFF284B63),
  background: const Color(0xFFF4F9E9),
  backgroundAlt: const Color(0xFFEEF0EB),
  cardColor: const Color(0xFFB4B8AB),
  containerColor: const Color(0xFFB4B8AB),
);

/// A preset theme for dark mode.
ThemeData darkTheme = xTheme.getTheme(
  mode: ThemeMode.dark,
  primary: const Color(0xFF464245),
  secondary: const Color(0xFFAF3131),
  background: const Color(0xFF282627),
  // backgroundAlt: Color(0xFF282627),
  cardColor: const Color(0xFF464245),
  containerColor: const Color(0xFF686866),
);

/// Toggles between light and dark mode
void toggleTheme() {
  if (Get.isDarkMode) {
    Get.changeThemeMode(ThemeMode.light);
  } else {
    Get.changeThemeMode(ThemeMode.dark);
  }
}
