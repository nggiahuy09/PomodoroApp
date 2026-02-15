import 'package:flutter/material.dart';

import '../features/timer/presentation/views/timer_view.dart';

class Popomomo extends StatelessWidget {
  const Popomomo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerView(),
    );
  }
}
