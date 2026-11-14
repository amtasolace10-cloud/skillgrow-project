import 'package:flutter/material.dart';

/// Global light/dark switch. The Profile screen changes it.
final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);
