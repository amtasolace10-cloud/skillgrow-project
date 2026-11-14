import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/core/routes/app_routes.dart';
import 'package:skillgrow/data/mock_data.dart';
import 'package:skillgrow/data/models.dart';

class SkillDetailsScreen extends StatelessWidget {
  const SkillDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final skill =
        (ModalRoute.of(context)?.settings.arguments as Skill?) ?? skills.first;
    return AppPage(
      title: skill.name,
      subtitle: '${skill.level} · ${skill.xp} XP',
      children: [
        GlassCard(
          child: Row(children: [
            ProgressRing(value: skill.progress),
            const SizedBox(width: 16),
            const Expanded(child: Text('Mastery\nNext: Level up at 100%')),
          ]),
        ),
        gap(),
        const SectionTitle('Modules'),
        const InfoTile(title: 'Fundamentals', subtitle: 'Completed', trailing: Text('100%')),
        gap(12),
        const InfoTile(title: 'Practice projects', subtitle: 'In progress', trailing: Text('60%')),
        gap(12),
        const InfoTile(title: 'Advanced topics', subtitle: 'Locked', trailing: Icon(Icons.lock_outline)),
        gap(24),
        GradientButton(
            label: 'View Analytics',
            onPressed: () => Navigator.pushNamed(context, AppRoutes.analytics)),
      ],
    );
  }
}
