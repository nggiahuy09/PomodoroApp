import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class TimerControlsWidget extends StatelessWidget {
  const TimerControlsWidget({
    super.key,
    required this.isRunning,
    required this.onPausedTimer,
    required this.onStartedTimer,
    required this.onResetedTimer,
    required this.onStoppedTimer,
  });

  final bool isRunning;
  final VoidCallback onPausedTimer;
  final VoidCallback onStartedTimer;
  final VoidCallback onResetedTimer;
  final VoidCallback onStoppedTimer;

  Widget _buildButton({required IconData icon, required VoidCallback onTap, required Color color, required Color iconColor}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 30,
          color: iconColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton(
            icon: isRunning ? Icons.pause : Icons.play_arrow,
            onTap: isRunning ? onPausedTimer : onStartedTimer,
            color: AppColors.primary,
            iconColor: Colors.white,
          ),
          _buildButton(
            icon: Icons.refresh,
            onTap: onResetedTimer,
            color: AppColors.light,
            iconColor: AppColors.primary,
          ),
          _buildButton(
            icon: Icons.stop,
            onTap: onStartedTimer,
            color: AppColors.light,
            iconColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
