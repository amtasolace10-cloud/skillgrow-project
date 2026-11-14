import 'package:flutter/material.dart';
import 'package:skillgrow/core/constants/app_colors.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.outlined = false});
  final String label;
  final VoidCallback onPressed;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final r = BorderRadius.circular(18);
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: 56,
        decoration: BoxDecoration(
          gradient: outlined ? null : AppColors.brandGradient,
          borderRadius: r,
          border: outlined
              ? Border.all(color: AppColors.primary, width: 1.5)
              : null,
          boxShadow: outlined
              ? null
              : [
                  BoxShadow(
                      color: AppColors.primary.withOpacity(.4),
                      blurRadius: 24,
                      offset: const Offset(0, 10))
                ],
        ),
        child: InkWell(
          borderRadius: r,
          onTap: onPressed,
          child: Center(
            child: Text(label,
                style: TextStyle(
                    color: outlined ? AppColors.primary : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}
