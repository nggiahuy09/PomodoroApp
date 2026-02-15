import 'dart:math';

import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class TimerCircleWidget extends StatelessWidget {
  const TimerCircleWidget({super.key, required this.remainingSeconds, required this.animationCtrl});

  final int remainingSeconds;
  final AnimationController animationCtrl;

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;

    return "${minutes.toString().padLeft(2, '0')}:"
        "${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: AnimatedBuilder(
          animation: animationCtrl,
          builder: (_, __) {
            return CustomPaint(
              painter: _TimerPainter(progress: animationCtrl.value),
              child: SizedBox(
                width: 260,
                height: 260,
                child: Center(
                  child: Text(
                    _formatTime(remainingSeconds),
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.w700,
                      color: AppColors.accentDark,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TimerPainter extends CustomPainter {
  _TimerPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 18.0;

    final basePaint = Paint()
      ..color = AppColors.mid
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth;

    canvas.drawCircle(center, radius, basePaint);

    final sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _TimerPainter oldDelegate) => oldDelegate.progress != progress;
}
