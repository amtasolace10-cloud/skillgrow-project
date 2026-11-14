import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';

class SkillAnalyticsScreen extends StatelessWidget {
  const SkillAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return AppPage(
      title: 'Skill Analytics',
      subtitle: 'Your last 7 weeks',
      children: [
        GlassCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Growth Chart', style: t.titleMedium),
            gap(),
            const BarChart(
              values: [30, 42, 38, 55, 63, 72, 88],
              labels: ['W1', 'W2', 'W3', 'W4', 'W5', 'W6', 'W7'],
            ),
          ]),
        ),
        gap(),
        GlassCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Activity Heatmap', style: t.titleMedium),
            gap(),
            const Heatmap(),
          ]),
        ),
        gap(),
        const Row(children: [
          Expanded(child: StatCard('+24%', 'Growth')),
          SizedBox(width: 12),
          Expanded(child: StatCard('6.2h', 'Weekly')),
          SizedBox(width: 12),
          Expanded(child: StatCard('A-', 'Consistency')),
        ]),
      ],
    );
  }
}
