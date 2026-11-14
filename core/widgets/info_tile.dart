import 'package:flutter/material.dart';
import 'package:skillgrow/core/constants/app_colors.dart';
import 'glass_card.dart';

/// One glass row: gradient icon, title, subtitle and an optional trailing widget.
class InfoTile extends StatelessWidget {
  const InfoTile(
      {super.key,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.icon = Icons.star_rounded,
      this.color = AppColors.primary,
      this.onTap});
  final String title, subtitle;
  final Widget? trailing;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return GlassCard(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Row(children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(colors: [color, AppColors.accent]),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title,
                  style: t.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
              Text(subtitle, style: t.bodySmall),
            ]),
          ),
          if (trailing != null) trailing!,
        ]),
      ),
    );
  }
}
