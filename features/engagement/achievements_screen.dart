import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/data/mock_data.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Achievements',
      subtitle: '3 of ${badges.length} badges earned',
      children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.1,
          children: [
            for (final b in badges)
              Opacity(
                opacity: b.unlocked ? 1 : .45,
                child: GlassCard(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(b.unlocked ? Icons.emoji_events_rounded : Icons.lock_outline,
                            size: 36, color: AppColors.warning),
                        gap(8),
                        Text(b.name,
                            style: const TextStyle(fontWeight: FontWeight.w700)),
                        Text(b.unlocked ? 'Unlocked' : 'Locked',
                            style: Theme.of(context).textTheme.bodySmall),
                      ]),
                ),
              ),
          ],
        ),
        gap(20),
        const Text('Level 6 · 2,480 XP', style: TextStyle(fontWeight: FontWeight.w700)),
        gap(8),
        LinearProgressIndicator(
            value: .72, minHeight: 10, borderRadius: BorderRadius.circular(8)),
      ],
    );
  }
}
