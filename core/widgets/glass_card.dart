import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:skillgrow/core/constants/app_colors.dart';

class GlassCard extends StatelessWidget {
  const GlassCard(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.all(16),
      this.gradient});
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final radius = BorderRadius.circular(24);
    return Container(
      decoration: BoxDecoration(borderRadius: radius, boxShadow: [
        BoxShadow(
            color: AppColors.primary.withOpacity(dark ? .25 : .12),
            blurRadius: 24,
            offset: const Offset(0, 8))
      ]),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              gradient: gradient,
              color: gradient == null
                  ? Colors.white.withOpacity(dark ? .08 : .72)
                  : null,
              borderRadius: radius,
              border:
                  Border.all(color: Colors.white.withOpacity(dark ? .16 : .9)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
