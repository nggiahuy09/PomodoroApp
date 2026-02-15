import 'package:flutter/material.dart';
import 'package:pomodoro/functionality/time_service.dart';
import 'package:pomodoro/screens/timer_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<TimerService>(
      create: (_) => TimerService(),
      child: const Popomomo(),
    ),
  );
}

class Popomomo extends StatelessWidget {
  const Popomomo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerScreen(),
    );
  }
}
