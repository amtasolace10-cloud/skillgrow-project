import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';

class StreakScreen extends StatelessWidget {
  const StreakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Streak Tracker',
      subtitle: 'Learn daily to keep your flame alive',
      children: [
        GlassCard(
          gradient: AppColors.glowGradient,
          child: Row(children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: .8, end: 1.1),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeInOut,
              builder: (_, v, child) => Transform.scale(scale: v, child: child),
              child: const Icon(Icons.local_fire_department_rounded,
                  size: 64, color: AppColors.warning),
            ),
            const SizedBox(width: 16),
            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('14',
                  style: TextStyle(
                      color: Colors.white, fontSize: 48, fontWeight: FontWeight.w800)),
              Text('day streak', style: TextStyle(color: Colors.white)),
            ]),
          ]),
        ),
        gap(),
        GlassCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('This month', style: Theme.of(context).textTheme.titleMedium),
            gap(),
            const Heatmap(),
          ]),
        ),
        gap(),
        const Row(children: [
          Expanded(child: StatCard('14', 'Current')),
          SizedBox(width: 12),
          Expanded(child: StatCard('21', 'Best')),
          SizedBox(width: 12),
          Expanded(child: StatCard('3', 'Freezes')),
        ]),
      ],
    );
  }
}
