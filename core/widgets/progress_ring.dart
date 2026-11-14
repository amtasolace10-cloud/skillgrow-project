import 'package:flutter/material.dart';
import 'package:skillgrow/core/constants/app_colors.dart';

/// Animated circular progress indicator with the % in the middle.
class ProgressRing extends StatelessWidget {
  const ProgressRing({super.key, required this.value, this.size = 96});
  final double value;
  final double size;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeOutCubic,
      builder: (_, v, __) => SizedBox(
        width: size,
        height: size,
        child: Stack(alignment: Alignment.center, children: [
          SizedBox.expand(
            child: CircularProgressIndicator(
              value: v,
              strokeWidth: 10,
              strokeCap: StrokeCap.round,
              backgroundColor: AppColors.primary.withOpacity(.15),
              color: AppColors.primary,
            ),
          ),
          Text('${(v * 100).round()}',
              style: TextStyle(fontSize: size / 3.4, fontWeight: FontWeight.w800)),
        ]),
      ),
    );
  }
}
