import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/core/routes/app_routes.dart';

const _pages = [
  ('Discover Skills', 'Explore curated skills matched to your goals and interests.'),
  ('Track Progress', 'Watch your learning score, streaks and growth charts rise daily.'),
  ('Achieve Goals', 'Complete challenges, earn XP and unlock premium badges.'),
];

/// Onboarding 1, 2 and 3 are the three pages of this PageView.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_index == _pages.length - 1) {
      Navigator.pushReplacementNamed(context, AppRoutes.signUp);
    } else {
      _controller.nextPage(
          duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, AppRoutes.login),
                  child: const Text('Skip')),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const LottiePlaceholder(size: 240),
                    gap(28),
                    Text(_pages[i].$1,
                        style: t.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
                    gap(8),
                    Text(_pages[i].$2, textAlign: TextAlign.center),
                  ]),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (var i = 0; i < _pages.length; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.all(3),
                  width: i == _index ? 28 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: i == _index
                        ? AppColors.primary
                        : AppColors.primary.withOpacity(.25),
                  ),
                ),
            ]),
            Padding(
              padding: const EdgeInsets.all(24),
              child: GradientButton(
                  label: _index == _pages.length - 1 ? 'Get Started' : 'Next',
                  onPressed: _next),
            ),
          ]),
        ),
      ),
    );
  }
}
