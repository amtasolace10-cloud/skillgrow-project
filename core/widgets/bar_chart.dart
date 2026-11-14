import 'package:flutter/material.dart';
import 'package:skillgrow/core/constants/app_colors.dart';

/// Animated growth bars. The tallest bar uses the brand gradient.
class BarChart extends StatelessWidget {
  const BarChart({super.key, required this.values, required this.labels});
  final List<double> values;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    final max = values.reduce((a, b) => a > b ? a : b);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < values.length; i++)
          Column(children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: values[i]),
              duration: Duration(milliseconds: 700 + i * 80),
              curve: Curves.easeOutCubic,
              builder: (_, h, __) => Container(
                width: 28,
                height: h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: values[i] == max ? AppColors.glowGradient : null,
                  color: values[i] == max
                      ? null
                      : AppColors.primary.withOpacity(.35),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(labels[i], style: Theme.of(context).textTheme.labelSmall),
          ]),
      ],
    );
  }
}
