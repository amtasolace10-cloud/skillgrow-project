import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/data/mock_data.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Skill Portfolio',
      subtitle: 'Verified, shareable proof of growth',
      children: [
        const Row(children: [
          Expanded(child: StatCard('5', 'Skills')),
          SizedBox(width: 12),
          Expanded(child: StatCard('14', 'Projects')),
          SizedBox(width: 12),
          Expanded(child: StatCard('12', 'Badges')),
        ]),
        gap(),
        for (final s in skills.take(3))
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InfoTile(
                title: s.name,
                subtitle: s.level,
                trailing: Text('${(s.progress * 100).round()}%')),
          ),
        gap(12),
        GradientButton(
          label: 'Share Portfolio',
          onPressed: () => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Portfolio link ready to share'))),
        ),
      ],
    );
  }
}
