import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:skillgrow/core/constants/app_colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});
  final Widget child;

  Widget _glow(Color c, double s) => ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
        child: Container(
            width: s,
            height: s,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: c.withOpacity(.3))),
      );

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: dark
              ? [AppColors.darkBackground, const Color(0xFF1E1B4B)]
              : [AppColors.background, const Color(0xFFE4E7FF)],
        ),
      ),
      child: Stack(children: [
        Positioned(top: -90, left: -90, child: _glow(AppColors.primary, 300)),
        Positioned(bottom: -60, right: -80, child: _glow(AppColors.accent, 260)),
        Positioned.fill(child: child),
      ]),
    );
  }
}
