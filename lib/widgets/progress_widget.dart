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
          children: [
            Text(
              "${provider.rounds}/4",
              style: textStyle(30, renderColor(provider.currentState), FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            Text(
              'ROUND',
              style: textStyle(30, renderColor(provider.currentState), FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "${provider.goals}/12",
              style: textStyle(30, renderColor(provider.currentState), FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            Text(
              'GOAL',
              style: textStyle(30, renderColor(provider.currentState), FontWeight.bold),
            ),
          ]
        ),
      ],
    );
  }
}
