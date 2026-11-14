import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/core/routes/app_routes.dart';
import 'package:skillgrow/data/mock_data.dart';

class InterestSelectionScreen extends StatefulWidget {
  const InterestSelectionScreen({super.key});
  @override
  State<InterestSelectionScreen> createState() => _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
  final _picked = <String>{};

  void _continue() {
    if (_picked.length < 3) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Pick at least 3 interests')));
      return;
    }
    Navigator.pushReplacementNamed(context, AppRoutes.goal);
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Pick your interests',
      subtitle: 'Choose at least 3 to personalise your path.',
      showBack: false,
      children: [
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (final i in interests)
            FilterChip(
              label: Text(i),
              selected: _picked.contains(i),
              selectedColor: AppColors.primary.withOpacity(.25),
              onSelected: (v) => setState(() => v ? _picked.add(i) : _picked.remove(i)),
            ),
        ]),
        gap(32),
        GradientButton(label: 'Continue (${_picked.length} selected)', onPressed: _continue),
      ],
    );
  }
}
