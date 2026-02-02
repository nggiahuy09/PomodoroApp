import 'package:flutter/material.dart';
import 'package:pomodoro/functionality/time_service.dart';
import 'package:pomodoro/util/utils.dart';
import 'package:provider/provider.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          spacing: 15.0,
          children: [
            Text(
              "${provider.rounds}/4",
              style: textStyle(30, renderColor(provider.currentState), FontWeight.bold),
            ),
            Text(
              'ROUND',
              style: textStyle(30, renderColor(provider.currentState), FontWeight.bold),
            ),
          ],
        ),
        Column(
          spacing: 15.0,
          children: [
            Text(
              "${provider.goals}/12",
              style: textStyle(30, renderColor(provider.currentState), FontWeight.bold),
            ),
            Text(
              'GOAL',
              style: textStyle(30, renderColor(provider.currentState), FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
