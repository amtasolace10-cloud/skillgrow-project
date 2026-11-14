import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';

class RecommendationsScreen extends StatefulWidget {
  const RecommendationsScreen({super.key});
  @override
  State<RecommendationsScreen> createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  static const _picks = [
    ('Data Visualization', '92% match'),
    ('Product Strategy', '88% match'),
    ('Public Speaking', '81% match'),
  ];
  final _added = <String>{};

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Smart Picks',
      subtitle: 'Based on your goals and activity',
      children: [
        for (final p in _picks)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InfoTile(
              title: p.$1,
              subtitle: p.$2,
              icon: Icons.auto_awesome,
              trailing: TextButton(
                onPressed: () => setState(() => _added.add(p.$1)),
                child: Text(_added.contains(p.$1) ? 'Added' : 'Add'),
              ),
            ),
          ),
      ],
    );
  }
}
