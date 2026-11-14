import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/core/routes/app_routes.dart';
import 'package:skillgrow/core/theme/theme_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Alex Morgan',
      subtitle: 'Level 6 · 2,480 XP',
      showBack: false,
      children: [
        const GlassCard(
          child: Row(children: [
            ProgressRing(value: .72),
            SizedBox(width: 16),
            Expanded(child: Text('Next level\n520 XP to go')),
          ]),
        ),
        gap(),
        InfoTile(
            title: 'Achievements',
            subtitle: 'Badges and XP',
            icon: Icons.emoji_events_rounded,
            onTap: () => Navigator.pushNamed(context, AppRoutes.achievements)),
        gap(12),
        InfoTile(
            title: 'Streak tracker',
            subtitle: 'Daily learning flame',
            icon: Icons.local_fire_department_rounded,
            onTap: () => Navigator.pushNamed(context, AppRoutes.streak)),
        gap(12),
        InfoTile(
            title: 'Smart recommendations',
            subtitle: 'Picked for you',
            icon: Icons.auto_awesome,
            onTap: () => Navigator.pushNamed(context, AppRoutes.recommendations)),
        gap(12),
        InfoTile(
            title: 'Digital portfolio',
            subtitle: 'Share your growth',
            icon: Icons.folder_special_rounded,
            onTap: () => Navigator.pushNamed(context, AppRoutes.portfolio)),
        gap(12),
        GlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ValueListenableBuilder<ThemeMode>(
            valueListenable: themeMode,
            builder: (_, mode, __) => SwitchListTile(
              title: const Text('Dark mode'),
              value: mode == ThemeMode.dark,
              onChanged: (v) => themeMode.value = v ? ThemeMode.dark : ThemeMode.light,
            ),
          ),
        ),
        gap(24),
        GradientButton(
            label: 'Log Out',
            outlined: true,
            onPressed: () =>
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.welcome, (_) => false)),
      ],
    );
  }
}
