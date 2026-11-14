import 'package:flutter/material.dart';
import 'package:skillgrow/core/constants/app_colors.dart';
import 'gap.dart';

/// Swap this widget for `Lottie.asset(...)` when real animations are ready.
class LottiePlaceholder extends StatelessWidget {
  const LottiePlaceholder({super.key, this.size = 220});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        width: size,
        height: size,
        child: Stack(alignment: Alignment.center, children: [
          Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, gradient: AppColors.glowGradient)),
          Container(
            width: size * .7,
            height: size * .7,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.2),
                border: Border.all(color: Colors.white54)),
          ),
          Icon(Icons.auto_awesome, size: size * .25, color: Colors.white),
        ]),
      ),
      gap(8),
      Text('Lottie animation placeholder',
          style: Theme.of(context).textTheme.labelSmall),
    ]);
  }
}
