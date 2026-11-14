import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/core/routes/app_routes.dart';
import 'package:skillgrow/data/mock_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return AppPage(
      title: 'Good morning, Alex',
      subtitle: 'Keep the momentum going',
      showBack: false,
      children: [
        GlassCard(
          child: Row(children: [
            const ProgressRing(value: .78),
            const SizedBox(width: 16),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Learning Score', style: t.titleLarge),
                const Text('+6 points this week'),
              ]),
            ),
          ]),
        ),
        gap(),
        const Row(children: [
          Expanded(child: StatCard('5', 'Active Skills')),
          SizedBox(width: 12),
          Expanded(child: StatCard('12', 'Badges')),
          SizedBox(width: 12),
          Expanded(child: StatCard('48m', 'Today')),
        ]),
        gap(),
        GlassCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Weekly Progress', style: t.titleMedium),
            gap(),
            const BarChart(values: weekly, labels: weekdays),
          ]),
        ),
        gap(),
        const SectionTitle('Active skills'),
        for (final s in skills.take(3))
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InfoTile(
              title: s.name,
              subtitle: '${s.level} · ${s.xp} XP',
              trailing: Text('${(s.progress * 100).round()}%'),
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.skillDetails, arguments: s),
            ),
          ),
      ],
    );
  }
}
