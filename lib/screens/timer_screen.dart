import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../theme/theme.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Timer? _timer;

  final List<int> _durations = [15, 25, 45, 60];

  int _selectedMinutes = 25;
  int _remainingSeconds = 25 * 60;
  bool _isRunning = false;

  int get focusDuration => _selectedMinutes * 60;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: focusDuration),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (_isRunning) return;

    _isRunning = true;

    _controller.duration = Duration(seconds: focusDuration);

    _controller.forward(
      from: 1 - (_remainingSeconds / focusDuration),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        _stopTimer();
        return;
      }

      setState(() {
        _remainingSeconds--;
      });
    });

    setState(() {});
  }

  void _pauseTimer() {
    _timer?.cancel();
    _controller.stop();
    _isRunning = false;
    setState(() {});
  }

  void _stopTimer() {
    _timer?.cancel();
    _controller.stop();
    _isRunning = false;
    setState(() {});
  }

  void _resetTimer() {
    _timer?.cancel();
    _controller.reset();
    _remainingSeconds = focusDuration;
    _isRunning = false;
    setState(() {});
  }

  void _changeDuration(int minutes) {
    _timer?.cancel();
    _controller.reset();

    setState(() {
      _selectedMinutes = minutes;
      _remainingSeconds = minutes * 60;
      _isRunning = false;
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;

    return "${minutes.toString().padLeft(2, '0')}:"
        "${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),

            /// TITLE
            const Text(
              "Focus",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 40),

            /// TIMER CIRCLE
            Expanded(
              child: Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: TimerPainter(
                        progress: _controller.value,
                      ),
                      child: SizedBox(
                        width: 260,
                        height: 260,
                        child: Center(
                          child: Text(
                            _formatTime(_remainingSeconds),
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
            ),

            /// DURATION SELECTOR
            const SizedBox(height: 20),
            _buildDurationSelector(),

            const SizedBox(height: 30),

            /// CONTROLS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton(
                    icon: _isRunning ? Icons.pause : Icons.play_arrow,
                    onTap: _isRunning ? _pauseTimer : _startTimer,
                    color: AppColors.primary,
                    iconColor: Colors.white,
                  ),
                  _buildButton(
                    icon: Icons.refresh,
                    onTap: _resetTimer,
                    color: AppColors.light,
                    iconColor: AppColors.primary,
                  ),
                  _buildButton(
                    icon: Icons.stop,
                    onTap: _stopTimer,
                    color: AppColors.light,
                    iconColor: AppColors.primary,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            const Column(
              children: [
                Text(
                  "Up next",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.mid,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "05:00",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Short break",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.mid,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _durations.map((minutes) {
          final isSelected = _selectedMinutes == minutes;

          return GestureDetector(
            onTap: () => _changeDuration(minutes),
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

  Widget _buildButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color color,
    required Color iconColor,
  }) {
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
}

/// =======================
/// CUSTOM PAINTER
/// =======================
class TimerPainter extends CustomPainter {
  final double progress;

  TimerPainter({required this.progress});

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
  bool shouldRepaint(covariant TimerPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
