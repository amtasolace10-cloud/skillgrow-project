import 'package:flutter/material.dart';
import 'package:skillgrow/core/constants/app_colors.dart';

/// Activity heatmap: 7 columns, darker = more learning that day.
class Heatmap extends StatelessWidget {
  const Heatmap({super.key, this.rows = 4});
  final int rows;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (var r = 0; r < rows; r++)
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            for (var c = 0; c < 7; c++)
              Container(
                width: 32,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColors.primary
                      .withOpacity(.1 + ((r * 7 + c * 3 + r * c) % 5) / 4 * .9),
                ),
              ),
          ]),
        ),
    ]);
  }
}
