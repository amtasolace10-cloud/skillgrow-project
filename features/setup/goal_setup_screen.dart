import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/core/routes/app_routes.dart';

class GoalSetupScreen extends StatefulWidget {
  const GoalSetupScreen({super.key});
  @override
  State<GoalSetupScreen> createState() => _GoalSetupScreenState();
}

class _GoalSetupScreenState extends State<GoalSetupScreen> {
  static const _goals = {10: 'Casual', 20: 'Regular', 30: 'Serious', 60: 'Intense'};
  int _minutes = 20;

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Set your daily goal',
      subtitle: 'How much will you learn each day?',
      showBack: false,
      children: [
        for (final e in _goals.entries)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () => setState(() => _minutes = e.key),
              child: GlassCard(
                gradient: _minutes == e.key ? AppColors.brandGradient : null,
                child: Row(children: [
                  Icon(Icons.timer_outlined,
                      color: _minutes == e.key ? Colors.white : AppColors.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text('${e.key} min / day  ·  ${e.value}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: _minutes == e.key ? Colors.white : null)),
                  ),
                  if (_minutes == e.key)
                    const Icon(Icons.check_circle, color: Colors.white),
                ]),
              ),
            ),
          ),
        gap(16),
        GradientButton(
            label: 'Start My Journey',
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.main)),
      ],
    );
  }
}
