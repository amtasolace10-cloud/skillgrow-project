import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF6C63FF);
  static const secondary = Color(0xFF4D96FF);
  static const accent = Color(0xFF00D4FF);
  static const background = Color(0xFFF5F7FA);
  static const darkBackground = Color(0xFF0F172A);
  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFF59E0B);
  static const textDark = Color(0xFF111827);
  static const textLight = Colors.white;
  static const brandGradient = LinearGradient(
      colors: [primary, secondary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static const glowGradient = LinearGradient(colors: [primary, accent]);
}
