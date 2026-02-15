import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class DurationSelectorWidget extends StatelessWidget {
  const DurationSelectorWidget({super.key, required this.selectedMinutes, required this.durations, required this.onChangedDuration});

  final int selectedMinutes;
  final List<int> durations;
  final void Function(int minutes) onChangedDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: durations.map((minutes) {
          final isSelected = selectedMinutes == minutes;

          return GestureDetector(
            onTap: () => onChangedDuration(minutes),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.light,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "${minutes}m",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : AppColors.primary,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
