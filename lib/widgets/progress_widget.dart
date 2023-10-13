import 'package:flutter/material.dart';
import 'package:pomodoro/util/utils.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              '0/4',
              style: textStyle(30, Colors.white, FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            Text(
              'ROUND',
              style: textStyle(30, Colors.white, FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              '0/4',
              style: textStyle(30, Colors.white, FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            Text(
              'GOAL',
              style: textStyle(30, Colors.white, FontWeight.bold),
            ),
          ]
        ),
      ],
    );
  }
}
