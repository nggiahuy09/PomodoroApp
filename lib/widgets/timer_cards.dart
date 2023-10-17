import 'package:flutter/material.dart';
import 'package:pomodoro/functionality/time_service.dart';
import 'package:pomodoro/util/utils.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds = provider.currentDuration % 60;

    return Column(
      children: [
        Text(
          provider.currentState,
          style: textStyle(35, renderColor(provider.currentState), FontWeight.w700),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: renderColor(provider.currentState),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  (provider.currentDuration ~/ 60).toString(),
                  style: textStyle(70, renderBackgroundColor(provider.currentState), FontWeight.bold),
                ),
              ),
            ),
            Text(
              " : ",
              style: textStyle(50, renderColor(provider.currentState), FontWeight.w700),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: renderColor(provider.currentState),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  seconds == 0 ? "${seconds.round()}0" : seconds.round().toString(),
                  style: textStyle(70, renderBackgroundColor(provider.currentState), FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
