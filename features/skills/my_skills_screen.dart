import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/core/routes/app_routes.dart';
import 'package:skillgrow/data/mock_data.dart';

class MySkillsScreen extends StatefulWidget {
  const MySkillsScreen({super.key});
  @override
  State<MySkillsScreen> createState() => _MySkillsScreenState();
}

class _MySkillsScreenState extends State<MySkillsScreen> {
  String _filter = 'All';

  @override
  Widget build(BuildContext context) {
    final shown = skills.where((s) {
      if (_filter == 'Active') return s.progress < 1;
      if (_filter == 'Completed') return s.progress >= 1;
      return true;
    }).toList();
    return AppPage(
      title: 'My Skills',
      subtitle: '${skills.length} skills in progress',
      showBack: false,
      children: [
        Wrap(spacing: 8, children: [
          for (final f in ['All', 'Active', 'Completed'])
            ChoiceChip(
                label: Text(f),
                selected: _filter == f,
                onSelected: (_) => setState(() => _filter = f)),
        ]),
        gap(),
        for (final s in shown)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InfoTile(
              title: s.name,
              subtitle: '${s.level} · ${s.xp} XP',
              trailing: Text('${(s.progress * 100).round()}%',
                  style: const TextStyle(
                      color: AppColors.primary, fontWeight: FontWeight.w700)),
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.skillDetails, arguments: s),
            ),
          ),
      ],
    );
  }
}
