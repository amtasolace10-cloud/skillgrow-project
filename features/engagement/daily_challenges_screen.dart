import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/data/mock_data.dart';

class DailyChallengesScreen extends StatefulWidget {
  const DailyChallengesScreen({super.key});
  @override
  State<DailyChallengesScreen> createState() => _DailyChallengesScreenState();
}

class _DailyChallengesScreenState extends State<DailyChallengesScreen> {
  final _done = <int>{};

  void _toggle(int i, bool? v) {
    setState(() => v == true ? _done.add(i) : _done.remove(i));
    if (v == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('+${challenges[i].xp} XP earned!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = _done.length / challenges.length;
    return AppPage(
      title: 'Daily Challenges',
      subtitle: 'Complete all ${challenges.length} for bonus XP',
      showBack: false,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: progress),
          duration: const Duration(milliseconds: 500),
          builder: (_, v, __) => LinearProgressIndicator(
              value: v, minHeight: 10, borderRadius: BorderRadius.circular(8)),
        ),
        gap(8),
        Text('${_done.length} of ${challenges.length} completed'),
        gap(),
        for (var i = 0; i < challenges.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GlassCard(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CheckboxListTile(
                value: _done.contains(i),
                onChanged: (v) => _toggle(i, v),
                title: Text(challenges[i].title,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                subtitle: Text('+${challenges[i].xp} XP'),
              ),
            ),
          ),
      ],
    );
  }
}
