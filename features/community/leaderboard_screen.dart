import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/data/mock_data.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});
  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  String _range = 'Weekly';

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Leaderboard',
      subtitle: 'Top learners this ${_range == 'Monthly' ? 'month' : 'week'}',
      showBack: false,
      children: [
        SegmentedButton<String>(
          segments: const [
            ButtonSegment(value: 'Weekly', label: Text('Weekly')),
            ButtonSegment(value: 'Monthly', label: Text('Monthly')),
            ButtonSegment(value: 'Friends', label: Text('Friends')),
          ],
          selected: {_range},
          onSelectionChanged: (s) => setState(() => _range = s.first),
        ),
        gap(),
        for (var i = 0; i < learners.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InfoTile(
              title: '${i + 1}. ${learners[i].name}',
              subtitle: learners[i].level,
              color: learners[i].name == 'You' ? AppColors.success : AppColors.primary,
              trailing: Text('${learners[i].xp} XP',
                  style: const TextStyle(
                      color: AppColors.primary, fontWeight: FontWeight.w700)),
            ),
          ),
      ],
    );
  }
}
