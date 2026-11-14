import 'package:flutter/material.dart';
import 'package:skillgrow/core/routes/app_routes.dart';
import 'package:skillgrow/core/theme/app_theme.dart';
import 'package:skillgrow/core/theme/theme_controller.dart';

void main() => runApp(const SkillGrowApp());

class SkillGrowApp extends StatelessWidget {
  const SkillGrowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeMode,
      builder: (_, mode, __) => MaterialApp(
        title: 'SkillGrow',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: mode,
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.routes,
      ),
    );
  }
}
