import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/core/routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(children: [
              const Spacer(),
              const LottiePlaceholder(),
              gap(24),
              Text('Build skills that get you hired',
                  textAlign: TextAlign.center,
                  style: t.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
              gap(8),
              const Text('Track progress, earn badges and showcase your skill portfolio.',
                  textAlign: TextAlign.center),
              const Spacer(),
              GradientButton(
                  label: 'Get Started',
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.onboarding)),
              gap(12),
              GradientButton(
                  label: 'I already have an account',
                  outlined: true,
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.login)),
            ]),
          ),
        ),
      ),
    );
  }
}
