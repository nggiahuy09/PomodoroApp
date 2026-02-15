import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/features/timer/presentation/widgets/duration_selector_widget.dart';
import 'package:pomodoro/features/timer/presentation/widgets/timer_circle_widget.dart';
import 'package:pomodoro/features/timer/presentation/widgets/timer_controls_widget.dart';
import 'package:pomodoro/features/timer/presentation/widgets/up_next_widget.dart';

import '../../../../core/theme/theme.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  Timer? timer;

  final List<int> durations = [15, 25, 45, 60];

  int selectedMinutes = 25;
  int remainingSeconds = 25 * 60;
  bool isRunning = false;

  int get focusDuration => selectedMinutes * 60;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: focusDuration),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (isRunning) return;

    isRunning = true;
    controller.duration = Duration(seconds: focusDuration);
    controller.forward(from: 1 - (remainingSeconds / focusDuration));
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remainingSeconds == 0) {
        _stopTimer();
        return;
      }
      setState(() => remainingSeconds--);
    });

    setState(() {});
  }

  void _pauseTimer() {
    timer?.cancel();
    controller.stop();
    isRunning = false;
    setState(() {});
  }

  void _stopTimer() {
    timer?.cancel();
    controller.stop();
    isRunning = false;
    setState(() {});
  }

  void _resetTimer() {
    timer?.cancel();
    controller.reset();
    remainingSeconds = focusDuration;
    isRunning = false;
    setState(() {});
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
            TimerCircleWidget(
              remainingSeconds: remainingSeconds,
              animationCtrl: controller,
            ),
            const SizedBox(height: 20),

            /// DURATION SELECTOR
            DurationSelectorWidget(
              selectedMinutes: selectedMinutes,
              durations: durations,
              onChangedDuration: (minutes) {
                timer?.cancel();
                controller.reset();

                setState(() {
                  selectedMinutes = minutes;
                  remainingSeconds = minutes * 60;
                  isRunning = false;
                });
              },
            ),

            const SizedBox(height: 30),

            /// CONTROLS
            TimerControlsWidget(
              isRunning: isRunning,
              onPausedTimer: _pauseTimer,
              onStartedTimer: _startTimer,
              onResetedTimer: _resetTimer,
              onStoppedTimer: _stopTimer,
            ),

            const SizedBox(height: 40),

            const UpNextWidget(),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
