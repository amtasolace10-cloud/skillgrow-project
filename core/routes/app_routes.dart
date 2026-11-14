import 'package:flutter/material.dart';
import 'package:skillgrow/features/auth/login_screen.dart';
import 'package:skillgrow/features/auth/sign_up_screen.dart';
import 'package:skillgrow/features/community/leaderboard_screen.dart';
import 'package:skillgrow/features/engagement/achievements_screen.dart';
import 'package:skillgrow/features/engagement/daily_challenges_screen.dart';
import 'package:skillgrow/features/engagement/streak_screen.dart';
import 'package:skillgrow/features/home/home_screen.dart';
import 'package:skillgrow/features/home/main_shell.dart';
import 'package:skillgrow/features/onboarding/onboarding_screen.dart';
import 'package:skillgrow/features/onboarding/splash_screen.dart';
import 'package:skillgrow/features/onboarding/welcome_screen.dart';
import 'package:skillgrow/features/portfolio/portfolio_screen.dart';
import 'package:skillgrow/features/profile/profile_screen.dart';
import 'package:skillgrow/features/setup/goal_setup_screen.dart';
import 'package:skillgrow/features/setup/interest_selection_screen.dart';
import 'package:skillgrow/features/skills/my_skills_screen.dart';
import 'package:skillgrow/features/skills/recommendations_screen.dart';
import 'package:skillgrow/features/skills/skill_analytics_screen.dart';
import 'package:skillgrow/features/skills/skill_details_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const welcome = '/welcome';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signUp = '/sign-up';
  static const interests = '/interests';
  static const goal = '/goal';
  static const main = '/main';
  static const skillDetails = '/skill-details';
  static const analytics = '/analytics';
  static const achievements = '/achievements';
  static const streak = '/streak';
  static const recommendations = '/recommendations';
  static const portfolio = '/portfolio';

  static Map<String, WidgetBuilder> get routes => {
        splash: (_) => const SplashScreen(),
        welcome: (_) => const WelcomeScreen(),
        onboarding: (_) => const OnboardingScreen(),
        login: (_) => const LoginScreen(),
        signUp: (_) => const SignUpScreen(),
        interests: (_) => const InterestSelectionScreen(),
        goal: (_) => const GoalSetupScreen(),
        main: (_) => const MainShell(),
        skillDetails: (_) => const SkillDetailsScreen(),
        analytics: (_) => const SkillAnalyticsScreen(),
        achievements: (_) => const AchievementsScreen(),
        streak: (_) => const StreakScreen(),
        recommendations: (_) => const RecommendationsScreen(),
        portfolio: (_) => const PortfolioScreen(),
      };
}
