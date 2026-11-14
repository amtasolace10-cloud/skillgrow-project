import 'package:flutter/material.dart';
import 'package:skillgrow/features/community/leaderboard_screen.dart';
import 'package:skillgrow/features/engagement/daily_challenges_screen.dart';
import 'package:skillgrow/features/home/home_screen.dart';
import 'package:skillgrow/features/profile/profile_screen.dart';
import 'package:skillgrow/features/skills/my_skills_screen.dart';

/// Holds the 5 bottom-navigation tabs.
class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;
  static const _tabs = [
    HomeScreen(),
    MySkillsScreen(),
    DailyChallengesScreen(),
    LeaderboardScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _tabs),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.auto_graph_rounded), label: 'Skills'),
          NavigationDestination(icon: Icon(Icons.bolt_rounded), label: 'Tasks'),
          NavigationDestination(icon: Icon(Icons.groups_rounded), label: 'Social'),
          NavigationDestination(icon: Icon(Icons.person_rounded), label: 'Me'),
        ],
      ),
    );
  }
}
