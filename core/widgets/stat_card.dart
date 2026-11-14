import 'package:flutter/material.dart';
import 'glass_card.dart';

class StatCard extends StatelessWidget {
  const StatCard(this.value, this.label, {super.key});
  final String value, label;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return GlassCard(
      padding: const EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(value, style: t.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
        Text(label, style: t.bodySmall),
      ]),
    );
  }
}
